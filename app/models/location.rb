class Location < ActiveRecord::Base
  belongs_to :trip
  attr_accessible :trip_id, :name, :description, :longitude, :latitude, :link_url, :image_url, :thumbnail_url
  def to_csv
    # Name,Description,Icon_color,Long,Lat,URL,Thumb_URL
    %Q("#{name}","#{description.gsub('"', '""')}",R,"#{longitude}","#{latitude}","#{image_url}","#{thumbnail_url}")
  end
end
