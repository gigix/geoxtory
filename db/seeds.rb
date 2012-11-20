# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Location.delete_all
# Trip.delete_all

puts "creating seed data......"

locations = Location.create({:name => "chengdu1",
                             :description => "logo of rails",
                             :latitude => "30.657419659093495",
                             :longitude => "104.06695885186764",
                             :image_url => "http://img3.douban.com/lpic/s9102133.jpg",
                             :thumbnail_url => "http://img3.douban.com/lpic/s9102133.jpg"},
                            {:name => "chengdu2",
                             :description => "logo of rails",
                             :latitude => "30.657419659093495",
                             :longitude => "104.06695885186764",
                             :image_url => "http://img3.douban.com/lpic/s9102133.jpg",
                             :thumbnail_url => "http://img3.douban.com/lpic/s9102133.jpg"},
                            {:name => "chengdu3",
                             :description => "logo of rails",
                             :latitude => "30.657419659093495",
                             :longitude => "104.06695885186764",
                             :image_url => "http://img3.douban.com/lpic/s9102133.jpg",
                             :thumbnail_url => "http://img3.douban.com/lpic/s9102133.jpg"})
                            trip1 = Trip.create(:name => "item1",
                                                :description => "test trip1",
                                                :locations => [locations])

puts "seed data created."