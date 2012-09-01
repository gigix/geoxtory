require 'csv'

class Trip < ActiveRecord::Base
  has_many :locations
  
  def to_csv
    result = "Name,Description,Icon_color,Long,Lat,URL,Thumb_URL\n"
    result << locations.map(&:to_csv).join("\n")
    result
  end
  
  def load!(csv)
    CSV.parse(csv, :headers => true) do |row|
      next unless locations.find_by_name(row['Name']).nil?
      locations.create!(:name => row['Name'], :description => row['Description'], :longitude => row['Long'], :latitude => row['Lat'], 
                        :image_url => row['URL'], :thumbnail_url => row['Thumb_URL'])
    end
  end
end
