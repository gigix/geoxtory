require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe TripsController do
  describe :new do
    it "renders with an empty model" do
      get :new
      response.should be_success
      assigns[:trip].should_not be_nil
    end
  end
  
  describe :create do
    it "creates a new trip and redirects" do
      lambda do
        post :create, :trip => {:name => "Test trip", :description => "This is a test trip"}
      end.should change(Trip, :count).by(1)
      new_trip = Trip.find(:first)
      response.should redirect_to(edit_trip_path(new_trip))
      new_trip.name.should == 'Test trip'
    end
  end
  
  describe :edit do
    it "renders with specified model" do
      trip = Trip.create!
      
      get :edit, :id => trip.id
      response.should be_success
      assigns[:trip].should == trip
    end
  end
  
  describe :update do
    it "updates specified model and redirects" do
      trip = Trip.create!
    
      lambda do
        put :update, :id => trip.id, :trip => {:name => "Test trip", :description => "This is a test trip"}
      end.should_not change(Trip, :count)
      response.should redirect_to(edit_trip_path(trip))
      
      trip = Trip.find(trip.id)
      trip.name.should == "Test trip"
    end
  end  
end
