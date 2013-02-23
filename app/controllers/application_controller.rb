class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_single_gtfs_record(record)
    csv_string = CSV.generate do |csv|
      csv << record.class.gtfs_attributes.values
      csv << record.class.gtfs_attributes.keys.map { |a| record.send(a) }
    end
    render text: csv_string
  end
end
