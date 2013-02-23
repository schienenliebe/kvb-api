class Stop < ActiveRecord::Base
  attr_accessible :location_type, :parent_station, :stop_code, :stop_desc, :stop_id, :stop_lat, :stop_lon, :stop_name, :stop_timezone, :stop_url, :wheelchair_boarding, :zone_id
end
