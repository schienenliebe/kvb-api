require 'csv'
class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_single_gtfs_record(record)
    csv_string = CSV.generate do |csv|
      csv << record.class.gtfs_attributes.values
      csv << record.class.gtfs_attributes.keys.map { |a| record.send(a) }
    end
    render text: csv_string
  end

  def render_gtfs(data, type = data.first.try(:class))
    csv_string = if data.kind_of?(Array)
      CSV.generate do |csv|
        if type
          csv << type.gtfs_attributes.values
        end
        data.each do |row|
          csv << row.class.gtfs_attributes.keys.map { |a| row.send(a) }
        end
      end
    else
      CSV.generate do |csv|
        csv << record.class.gtfs_attributes.values
        csv << record.class.gtfs_attributes.keys.map { |a| record.send(a) }
      end
    end
    render text: csv_string
  end

end