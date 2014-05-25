class FlightsController < ApplicationController

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new flight_params
    @flight.user = current_user
    mailer_user_address = current_user.email
    mailer_flight_number = params["flight"]["flight_number"]
    mailer_airline_name = params["flight"]["airline_name"]
    mailer_departure_time = params["flight"]["departure_time"]
    mailer_arrival_time = params["flight"]["arrival_time"]
    mailer_departure_airport = params["flight"]["departure_airport"]
    mailer_arrival_airport = params["flight"]["arrival_airport"]
    mailer_departure_city = params["flight"]["departure_city"]
    mailer_arrival_city = params["flight"]["arrival_city"]
    binding.pry
    respond_to do |format|
      if @flight.save
        format.json { render json: @flight, status: :created }
      else
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # def create 
  #   @flight = Flight.create(flight_params)
  #   flash[:notice] = "Flight successfully created"
  #   render :new
  # end

private
  def flight_params
    params.require(:flight).permit(:flight_number, :airline_name, :date_year, :date_month, :date_day, :departure_airport, :arrival_airport, :stops, :departure_time, :arrival_time, :airline_code, :departure_city, :arrival_city)
  end

end
