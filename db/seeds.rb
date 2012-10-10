# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Location.delete_all
# Trip.delete_all

puts "creating seed data"
location1 = Location.create(:name => "somewhere in chengdu", 
:description => "logo of rails", 
:latitude => "30.657419659093495", 
:longitude => "104.06695885186764",
:image_url => "http://www.kuqin.com/upimg/topic/Rails.png",
:thumbnail_url => "http://www.kuqin.com/upimg/topic/Rails.png")

trip1 = Trip.create(:name => "item1",
:description => "test trip1",
:locations => [location1])