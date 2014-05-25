$(document).ready(function(){
  var apiKey = $('body').data('key');
  var apiID = $('body').data('api');


  $('#flightButton').on('click', function(event){
    event.preventDefault();
    var form = $(this);
    var flightNumber = $('#flight_flight_number').val();
    var airlineCode = $('#flight_airline_code').val();
    var departureDay = $('#flight_date_day').val();
    var departureMonth = $('#flight_date_month').val();
    var departureYear = $('#flight_date_year').val();

    $.ajax({
      url: "https://api.flightstats.com/flex/schedules/rest/v1/jsonp/flight/" + airlineCode + "/" + flightNumber + "/departing/" + departureYear + "/" + departureMonth + "/" + departureDay + "?appId=" + apiID + "&appKey=" + apiKey,
      method: 'get',
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
              arrival_city: arrivalCity }
            }
          });
        }
    });
    $(':text').val('');
  });
});
