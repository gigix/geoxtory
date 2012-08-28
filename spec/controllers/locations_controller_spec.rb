require 'spec_helper'

describe LocationsController do
  render_views
  
  before(:each) do
    @trip = Trip.create!(:name => "Test trip", :description => "It's just for test")
    @location = @trip.locations.create!(:name => "Test location", :description => "A test only location")
  end
  
  describe :create do
    it "creates new location under specified trip and redirects back" do
      lambda do
        post :create, :trip_id => @trip.id, :trip => {:locations => {:name => 'Test location'}}
      end.should change(Location, :count).by(1)
      response.should redirect_to(edit_trip_path(@trip))
      
      new_trip = Trip.find(@trip.id)
      new_trip.locations.should have(2).location
    end
  end
  
  describe :destroy do
    it "removes specified model and redirects" do
      lambda do
        post :destroy, :trip_id => @trip.id, :id => @location.id 
      end.should change(Location, :count).by(-1)
      response.should redirect_to(edit_trip_path(@trip))
      
      new_trip = Trip.find(@trip.id)
      new_trip.locations.should be_empty
    end
  end
  
end
