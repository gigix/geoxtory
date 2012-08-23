class LocationsController < ApplicationController
  def create
    trip = Trip.find(params[:trip_id])
    trip.locations.create!(params[:trip][:locations])
    redirect_to edit_trip_path(trip.id)
  end
end
