class Stop < ActiveRecord::Base
  attr_accessible :location_type, :parent_station, :code, :desc, :agency_stop_id, :lat, :lon, :name, :timezone, :url, :wheelchair_boarding, :zone_id, :agency_id
  belongs_to :agency
end
