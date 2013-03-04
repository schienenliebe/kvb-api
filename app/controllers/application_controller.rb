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
      CSV.generate(quote_char: '"', force_quotes: true) do |csv|
        if type
          csv << type.gtfs_attributes.values
        end
        data.each do |row|
          csv << row.class.gtfs_attributes.keys.map { |a| format_value(row.send(a)) }
        end
      end
    else
      CSV.generate(quote_char: '"', force_quotes: true) do |csv|
        csv << record.class.gtfs_attributes.values
        csv << record.class.gtfs_attributes.keys.map do |attribute_name|
          format_value(record.send(attribute_name))
        end
      end
    end
    render text: csv_string
  end

  private

  def format_value(value)
    case value
    when Date
      value.strftime('%Y%m%d')
    else
      value
    end
  end

end