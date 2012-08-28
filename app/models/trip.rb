class Trip < ActiveRecord::Base
  has_many :locations
  
  def to_csv
    result = "Name,Description,Icon_color,Long,Lat,URL,Thumb_URL\n"
    result << locations.map(&:to_csv).join("\n")
    result
  end
end
