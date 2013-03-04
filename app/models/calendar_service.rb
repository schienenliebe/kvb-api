class CalendarService < ActiveRecord::Base
  attr_accessible :agency_id, :code, :ends_on, :friday, :monday, :saturday, :starts_on, :sunday, :thursday, :tuesday, :wednesday

  belongs_to :agency

  validates :agency_id, presence: true
  validates :code, presence: true, uniqueness: { scope: :agency_id }
  validates :monday, inclusion: [true, false]
  validates :tuesday, inclusion: [true, false]
  validates :wednesday, inclusion: [true, false]
  validates :thursday, inclusion: [true, false]
  validates :friday, inclusion: [true, false]
  validates :saturday, inclusion: [true, false]
  validates :sunday, inclusion: [true, false]
  validates :starts_on, presence: true
  validates :ends_on, presence: true

  def self.gtfs_attributes
    {
      code: 'service_id',
      monday: 'monday',
      tuesday: 'tuesday',
      wednesday: 'wednesday',
      thursday: 'thursday',
      friday: 'friday',
      saturday: 'saturday',
      sunday: 'sunday',
      starts_on: 'start_date',
      ends_on: 'end_date'
    }
  end
end
