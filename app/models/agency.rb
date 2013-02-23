class Agency < ActiveRecord::Base
  attr_accessible :fare_url, :lang, :name, :phone, :timezone, :url

  has_many :stops

  validates :name, presence: true
  validates :timezone, presence: true
  validates :url, presence: true

  def self.csv_attributes
    %w(id name url timezone lang phone fare_url)
  end

end
