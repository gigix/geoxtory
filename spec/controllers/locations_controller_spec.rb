require 'spec_helper'

describe LocationsController do
  integrate_views
  
  before(:each) do
    @trip = Trip.create!(:name => "Test trip", :description => "It's just for test")
  end
  
  describe :create do
    it "creates new location under specified trip and redirects back" do
      lambda do
        post :create, :trip_id => @trip.id, :trip => {:locations => {:name => 'Test location'}}
      end.should change(Location, :count).by(1)
      response.should redirect_to(edit_trip_path(@trip))
      
      new_trip = Trip.find(@trip.id)
      new_trip.locations.should have(1).trip
    end
  end
end
