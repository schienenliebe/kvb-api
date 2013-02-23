class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_single_gtfs_record(record)
    record.class.csv_attributes
    csv_string = CSV.generate do |csv|
      csv << record.class.csv_attributes
      csv << record.class.csv_attributes.map { |a| record.send(a) }
    end
    render text: csv_string
  end
end
