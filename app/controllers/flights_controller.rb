class FlightsController < ApplicationController
  def index
  end

  def show
    @flight = current_user.flights
  end

  def new
    @flight = Flight.new
    @flights = Flight.all
  end
end
