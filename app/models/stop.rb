class Stop < ActiveRecord::Base
  attr_accessible :location_type, :parent_station, :code, :desc, :agency_stop_id, :lat, :lon, :name, :timezone, :url, :wheelchair_boarding, :zone_id, :agency_id
  belongs_to :agency

  def self.gtfs_attributes
    {
      agency_stop_id: 'stop_id',
      code: 'stop_code',
      name: 'stop_name',
      lon: 'stop_lon',
      lat: 'stop_lat'
      # location_type: 'stop_location_type',
      # parent_station: 'stop_parent_station',
      # desc: 'stop_desc',
      # timezone: 'stop_timezone',
      # url: 'stop_url',
      # wheelchair_boarding: 'stop_wheelchair_boarding',
      # zone_id: 'stop_zone_id',
      # agency_id: 'stop_agency_id'
    }
  end
end
