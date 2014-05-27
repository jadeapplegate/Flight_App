class FlightsController < ApplicationController

  def new
    @flight = Flight.new
    @contacts = current_user.contacts
    @flights = current_user.flights
  end

  def create
    @flight = Flight.new flight_params
    @flight.user = current_user
    number = params["flight"]["flight_number"]
    name = params["flight"]["airline_name"]
    d_time = params["flight"]["departure_time"]
    a_time = params["flight"]["arrival_time"]
    d_airport = params["flight"]["departure_airport"]
    a_airport = params["flight"]["arrival_airport"]
    d_city = params["flight"]["departure_city"]
    a_city = params["flight"]["arrival_city"]
    @recipients = params["flight"]["contacts"]
    if @flight.save
      @recipients.each do |id|
        contact = Contact.find(id)
        address = contact.email
        EmailsWorker.perform_async(address, number, name, d_time, a_time, d_airport, a_airport, d_city, a_city, current_user.id)
      end
    end
    respond_to do |format|
      if @flight.save
        format.json { render json: @flight, status: :created }
      else
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def flight_params
    params.require(:flight).permit(:flight_number, :airline_name, :date_year, :date_month, :date_day, :departure_airport, :arrival_airport, :stops, :departure_time, :arrival_time, :airline_code, :departure_city, :arrival_city)
  end

end
