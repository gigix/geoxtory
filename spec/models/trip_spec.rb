require 'spec_helper'

describe Trip do
  it 'has many locations' do
    trip = Trip.create!(:name => "Test trip")
    location_1 = trip.locations.create!(:name => "Test location 1")
    location_2 = trip.locations.create!(:name => "Test location 2")
    
    trip = Trip.find(trip.id)
    trip.locations.size.should == 2
  end
end
