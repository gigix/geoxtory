require 'spec_helper'

describe Trip do
  before(:each) do
    @trip = Trip.create!(:name => "Test trip")
    location_1 = @trip.locations.create!(:name => "Test location 1")
    location_2 = @trip.locations.create!(:name => "Test location 2")
  end
  
  describe :locations do
    it 'has many locations' do
      trip = Trip.find(@trip.id)
      trip.locations.size.should == 2
    end
  end  
  
  describe :to_csv do
    it 'renders all locations as csv' do
      csv = @trip.to_csv
      rows = csv.split("\n")
      rows.should have(3).rows
      rows.first.should == "Name,Description,Icon_color,Long,Lat,URL,Thumb_URL"
      rows[1].should be_include("Test location 1")
      rows[2].should be_include("Test location 2")
    end
  end
  
  describe :load! do
    it 'loads all locations in given csv' do
      csv = @trip.to_csv
      trip = Trip.create!(:name => "new one")

      lambda do
        trip.load!(csv)
      end.should change(Location, :count).by(2)
      
      trip.locations.first.name.should == "Test location 1"
    end
    
    it 'does not load duplicate locations' do
      csv = @trip.to_csv
      lambda do
        @trip.load!(csv)
      end.should_not change(Location, :count)
    end
  end
end
