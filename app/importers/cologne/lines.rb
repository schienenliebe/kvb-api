require 'open-uri'

module Cologne
  class Lines
    URL = "http://www.kvb-koeln.de/german/fahrplan/aushangfahrplaene6.html"

    def process
      fetch_lines.each do |code, name|
        tram = code < 100
        Route.create(
          agency_id: 1,
          short_name: code.to_s,
          long_name: name,
          route_type: tram ? 0 : 1,
          url: "http://www.kvb-koeln.de/german/hst/showline/0/#{code}"
        )
      end
    end

    private

    def doc
      @doc ||= Nokogiri::HTML(open(URL))
    end

    def fetch_lines
      result = {}
      doc.css('#content_wrapper select[name=down] option').each do |row|
        data = row.text.match(/Linie\s+(\d+),?(.*)/)
        result[data[1].to_i] = data[2]
      end
      result
    end
  end
end