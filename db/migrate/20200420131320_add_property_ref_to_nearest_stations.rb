class AddPropertyRefToNearestStations < ActiveRecord::Migration[5.2]
  def change
    add_reference :nearest_stations, :property, foreign_key: true
  end
end
