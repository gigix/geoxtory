# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Location.delete_all
Trip.delete_all

puts "creating seed data......"

trip = Trip.create(name: "my first trip",
                   description: "trips on away day"
)

trip.locations.create(name: "chengdu1",
                      description: "logo of rails",
                      latitude: "30.657419659093495",
                      longitude: "104.06695885186764",
                      image_url: "DSC01400.JPG",
                      thumbnail_url: "DSC01400.JPG")

trip.locations.create(name: "chengdu2",
                      description: "logo of rails",
                      latitude: "30.657419659093495",
                      longitude: "104.06695885186764",
                      image_url: "DSC01401.JPG",
                      thumbnail_url: "DSC01401.JPG")

trip.locations.create(name: "chengdu3",
                      description: "logo of rails",
                      latitude: "30.657419659093495",
                      longitude: "104.06695885186764",
                      image_url: "DSC01442.JPG",
                      thumbnail_url: "DSC01442.JPG")

trip.locations.create(name: "chengdu4",
                      description: "logo of rails",
                      latitude: "30.657419659093495",
                      longitude: "104.06695885186764",
                      image_url: "DSC01446.JPG",
                      thumbnail_url: "DSC01446.JPG")

trip.locations.create(name: "chengdu5",
                      description: "logo of rails",
                      latitude: "30.657419659093495",
                      longitude: "104.06695885186764",
                      image_url: "DSC01401.JPG",
                      thumbnail_url: "DSC01401.JPG")

trip.locations.create(name: "chengdu6",
                      description: "logo of rails",
                      latitude: "30.657419659093495",
                      longitude: "104.06695885186764",
                      image_url: "DSC01401.JPG",
                      thumbnail_url: "DSC01401.JPG")

puts "seed data created."