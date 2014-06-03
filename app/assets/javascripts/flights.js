$(document).on("page:load ready", function() {
  var apiKey = $('body').data('key');
  var apiID = $('body').data('api');

  $('#airplane_form').on('submit', function(event){
    event.preventDefault();
    var chkArray = [];
    var flightNumber = $('#flight_flight_number').val();
    var airlineCode = $('#flight_airline_code').val();
    var airlineName = $('#flight_airline_code option:selected').text();
    var departureDay = $('#flight_date_day').val();
    var departureMonth = $('#flight_date_month').val();
    var departureYear = $('#flight_date_year').val();
    
    $('#airplane_form').slideToggle("slow");
        
    $("#airplane_form input:checked").each(function() {
      chkArray.push($(this).val());
    });

    var selected = chkArray.join(',') + ",";

    $.ajax({
      url: "https://api.flightstats.com/flex/connections/rest/v1/jsonp/direct/flight/" + airlineCode + "/" + flightNumber + "/departing/" + departureYear + "/" + departureMonth + "/" + departureDay + "?appId=" + apiID + "&appKey=" + apiKey + "&serviceType=PASSENGER_ONLY",
      method: 'get',
      timeout: 3000,
      dataType: "jsonp",
      success: function(data) {
        var departureAirport = data.appendix.airports[0].name;
        var departureCity = data.appendix.airports[0].city;
        var arrivalAirport = data.appendix.airports[1].name;
        var arrivalCity = data.appendix.airports[1].city;
        var departureTime = data.request.date.interpreted + " " + data.flights[0].departureTime;
        var arrivalTime = data.request.date.interpreted + " " + data.flights[0].arrivalTime; 

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
            departure_time: departureTime,
            arrival_time: arrivalTime,
            airline_code: airlineCode,
            departure_city: departureCity,
            arrival_city: arrivalCity,
            contacts: chkArray }
          }
        });
        $('.instructions').slideUp("slow");
        $('.completed_flight_info').slideDown("slow");
        $('.completed_flight_info').html("");
        $('.completed_flight_info').append("<h3>" + airlineName + " Flight # " + flightNumber + " has been added to your profile</h3>" + "<br>" + "<h4>You and your contacts will now be automatically notified regarding this flight</h4>" + "<br>" + "<h5>Thank you for using FlightShare!</h5>");
        $('.completed_flight_info').append("<button class='btn btn-primary' id='addAnotherFlightButton'>Add Another Flight</button> ");
        $('.completed_flight_info').append("<button class='btn btn-primary' id='goToMyProfile' method='get' action='/profile'>Go to Your Profile</button>");
      },
      error: function() {
        $('.completed_flight_info').slideDown("slow");
        $('.completed_flight_info').html("");
        $('.completed_flight_info').append("<h4>" + "The information you entered was invalid" + "</h4>");
        $('.completed_flight_info').append("<button class='btn btn-primary' id='addAnotherFlightButton'>Try Again</button> ");
        $('.completed_flight_info').append("<button class='btn btn-primary' id='goToMyProfile' method='get' action='/profile'>Go to Your Profile</button>");
      }
    });
    $(':text').val('');
    $('#flight_airline_code').find('option:first').attr('selected', 'selected');
    $('#flight_date_year').find('option:first').attr('selected', 'selected');
    $('#flight_date_month').find('option:first').attr('selected', 'selected');
    $('#flight_date_day').find('option:first').attr('selected', 'selected');
    $('.contact_dropdown input').prop("checked", false);
  });
    $('.completed_flight_info').on('click', '#addAnotherFlightButton', function() {
    $('.completed_flight_info').slideToggle("slow");
    $('#airplane_form').slideToggle("slow");
  });
    $('.completed_flight_info').on('click', '#goToMyProfile', function() {
    window.location = '/profile';
  });
});
