class Agency < ActiveRecord::Base
  attr_accessible :fare_url, :lang, :name, :phone, :timezone, :url

  has_many :routes
  has_many :stops

  validates :name, presence: true
  validates :timezone, presence: true
  validates :url, presence: true

  def self.gtfs_attributes
    {
      id: 'agency_id',
      name: 'agency_name',
      url: 'agency_url',
      timezone: 'agency_timezone',
      lang: 'agency_lang',
      phone: 'agency_phone',
      fare_url: 'agency_fare_url'
    }
  end

end
