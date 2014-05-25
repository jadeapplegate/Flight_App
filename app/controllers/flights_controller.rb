class FlightsController < ApplicationController

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new flight_params
    @flight.user = current_user
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
