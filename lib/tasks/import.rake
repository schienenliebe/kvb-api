# encoding: utf-8
# https://raw.github.com/bitboxer/kvb_geo/master/kvb_stops.json

# t.integer :stop_id, null: false
# t.string :stop_code
# t.string :stop_name, null: false
# t.text :stop_desc
# t.float :stop_lat, null: false
# t.float :stop_lon, null: false
# t.integer :zone_id
# t.string :stop_url
# t.integer :location_type
# t.integer :parent_station
# t.string :stop_timezone
# t.integer :wheelchair_boarding
# t.timestamps

# namespace :import do

#   desc "Get station data"
#   task :stops => [:environment] do
#     require 'open-uri'
#     stations = JSON.parse(open('https://raw.github.com/bitboxer/kvb_geo/master/kvb_stops.json').read)   
#     stations.each do |station|
#       Stop.create(
#         stop_id: station["kvb-id"], 
#         stop_name: station["station"], 
#         stop_lat: station["points"].first["lat"], 
#         stop_lon: station["points"].first["long"], 
#         location_type: 0, 
#         stop_url: "http://www.kvb-koeln.de/german/hst/overview/#{station['kvb-id']}/"
#       )
#     end
#   end
# end