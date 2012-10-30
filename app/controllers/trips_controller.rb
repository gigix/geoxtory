class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
    render :layout => false
  end

  def csv
    @trip = Trip.find(params[:id])
    if (request.post?)
      uploaded_io = params[:csv]
      csv_content = uploaded_io.read
      @trip.load!(csv_content)
      redirect_to edit_trip_path(@trip)
    else
      render :text => @trip.to_csv
    end
  end

  def create
    new_trip = Trip.create!(params[:trip])
    redirect_to edit_trip_path(new_trip)
  end

  def edit
    @trip = Trip.find(params[:id])
    render :layout => false
  end

  def update
    trip = Trip.find(params[:id])
    trip.update_attributes(params[:trip])
    redirect_to edit_trip_path(trip)
  end
end
