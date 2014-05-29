$(document).ready(function(){
  var apiKey = $('body').data('key');
  var apiID = $('body').data('api');

  $('#flightButton').on('click', function(event){
    event.preventDefault();
    var chkArray = [];
    var flightNumber = $('#flight_flight_number').val();
    var airlineCode = $('#flight_airline_code').val();
    var departureDay = $('#flight_date_day').val();
    var departureMonth = $('#flight_date_month').val();
    var departureYear = $('#flight_date_year').val();

    flightNumber = '1012';
    airlineCode = 'B6';
    departureDay = '1';
    departureMonth = '6';
    departureYear = '2014';

    $('#flight_form').slideToggle("slow");
        
    $("#new_flight input:checked").each(function() {
      chkArray.push($(this).val());
    });

    var selected = chkArray.join(',') + ",";

    $.ajax({
      url: "https://api.flightstats.com/flex/schedules/rest/v1/jsonp/flight/" + airlineCode + "/" + flightNumber + "/departing/" + departureYear + "/" + departureMonth + "/" + departureDay + "?appId=" + apiID + "&appKey=" + apiKey,
      method: 'get',
      timeout: 5000,
      dataType: "jsonp",
      success: function(data) {
        var airlineName = data.appendix.airlines[0].name;
        var departureAirport = data.appendix.airports[0].name;
        var departureCity = data.appendix.airports[0].city;
        var arrivalAirport = data.appendix.airports[1].name;
        var arrivalCity = data.appendix.airports[1].city;
        var stops = data.scheduledFlights[0].stops;
        var departureTime = data.scheduledFlights[0].departureTime;
        var arrivalTime = data.scheduledFlights[0].arrivalTime; 


        $.ajax({
          url: '/flights',
          method: 'post',
          data: { "flight": {
            flight_number: flightNumber,
            airline_name: airlineName,
            date_year: departureYear,
            date_month: departureMonth,
            date_day: departureDay,
            departure_airport: departureAirport,
            arrival_airport: arrivalAirport,
            stops: stops,
            departure_time: departureTime,
            arrival_time: arrivalTime,
            airline_code: airlineCode,
            departure_city: departureCity,
            arrival_city: arrivalCity,
            contacts: chkArray }
          }
        });
        $('.completed_flight_info').slideDown("slow");
        $('.completed_flight_info').append("<ul>" + airlineName + " Flight # " + flightNumber + " has been added</ul>");
        $('.completed_flight_info').append("<button id='addAnotherFlightButton'>Add Another Flight</button>");
        $('.completed_flight_info').append("<button id='goToMyProfile' method='get' action='/profile'>Go to Your Profile</button>");
      },
      error: function() {
        $('.completed_flight_info').append("<h1>" + "The information you entered was invalid" + "</h1>");
        $('.completed_flight_info').append("<button id='addAnotherFlightButton'>Try Again</button>");
        $('.completed_flight_info').append("<button id='goToMyProfile' method='get' action='/profile'>Go to Your Profile</button>");
      }
    });
    $(':text').val('');
    $('#flight_airline_code').find('option:first').attr('selected', 'selected');
    $('#flight_date_year').find('option:first').attr('selected', 'selected');
    $('#flight_date_month').find('option:first').attr('selected', 'selected');
    $('#flight_date_day').find('option:first').attr('selected', 'selected');
  });
  $('.completed_flight_info').on('click', '#addAnotherFlightButton', function() {
    $('.completed_flight_info').slideToggle("slow");
    $('#flight_form').slideToggle("slow");
  });
  $('.completed_flight_info').on('click', '#goToMyProfile', function() {
    window.location = '/profile';
  });
});
