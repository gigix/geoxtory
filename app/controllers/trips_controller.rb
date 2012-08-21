class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end
  
  def create
    new_trip = Trip.create!(params[:trip])
    redirect_to edit_trip_path(new_trip)
  end
  
  def edit
    @trip = Trip.find(params[:id])
  end
  
  def update
    trip = Trip.find(params[:id])
    trip.update_attributes(params[:trip])
    redirect_to edit_trip_path(trip)
  end
end
