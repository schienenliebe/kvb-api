class Route < ActiveRecord::Base
  attr_accessible :agency_id, :color, :desc, :route_type, :long_name, :short_name, :text_color, :url

  belongs_to :agency

  validates :agency_id, presence: true
  validates :short_name, presence: true
  validates :long_name, presence: true
  validates :route_type, presence: true

  def self.gtfs_attributes
    {
      id: 'route_id',
      agency_id: 'agency_id'
      color: 'route_color'
      desc: 'route_desc'
      route_type: 'route_type'
      long_name: 'route_long_name'
      short_name: 'route_short_name'
      text_color: 'route_text_color'
      url: 'route_url'
    }
  end
end
