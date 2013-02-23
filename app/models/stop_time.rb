class StopTime

  def self.gtfs_attributes
    {
      trip_id: 'trip_id',
      arrival_time: 'arrival_time',
      departure_time: 'departure_time',
      stop_id: 'stop_id',
      stop_sequence: 'stop_sequence',
      stop_headsign: 'stop_headsign',
      pickup_type: 'pickup_type',
      drop_off_type: 'drop_off_type',
      shape_dist_traveled: 'shape_dist_traveled'
    }
  end

  def initialize(stop_id)
    @stop_id = stop_id
  end

  def trip_id
    'nightbus-1'
  end

  def arrival_time
    '27:01:00'
  end

  def departure_time
    '27:01:00'
  end

  def stop_id
    @stop_id
  end

  def stop_sequence
    1
  end

  def stop_headsign
    nil
  end

  def pickup_type
    nil
  end

  def drop_off_type
    nil
  end

  def shape_dist_traveled
    nil
  end

end