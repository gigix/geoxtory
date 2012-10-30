class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.references :trip
      t.string :name
      t.string :description
      t.string :longitude
      t.string :latitude
      t.string :link_url
      t.string :image_url
      t.string :thumbnail_url

      t.timestamps
    end

    add_index :locations, :trip_id

  end

  def self.down
    drop_table :locations
  end
end
