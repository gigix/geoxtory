class Location < ActiveRecord::Base
  def to_csv
    # Name,Description,Icon_color,Long,Lat,URL,Thumb_URL
    %Q("#{name}","#{description.gsub('"', '""')}",R,"#{longitude}","#{latitude}","#{image_url}","#{thumbnail_url}")
  end
end
