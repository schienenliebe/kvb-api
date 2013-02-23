# encoding: utf-8
# https://raw.github.com/schienenliebe/kvb_geo/master/vrs_kvb_stops.json

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

# Structure of Open Street Map
#
# {
#   "type"=>"Feature", 
#   "properties"=>{
#     "type"=>"node", 
#     "id"=>"361716", 
#     "tags"=>{
#       "VRS:gemeinde"=>"KÖLN", 
#       "VRS:ortsteil"=>"Innenstadt", 
#       "VRS:ref"=>"11509", 
#       "name"=>"Eifelplatz", 
#       "railway"=>"tram_stop", 
#       "wheelchair"=>"yes"
#     }, 
#     "relations"=>[], 
#     "meta"=>{}
#   }, 
#   "geometry"=>{
#     "type"=>"Point", 
#     "coordinates"=>[6.9434608, 50.9232266]
#   }
# }

namespace :import do

  desc "Get station data"
  task :stops => [:environment] do
    require 'open-uri'
    skipped = 0
    created = 0
    stations = JSON.parse(open('https://raw.github.com/schienenliebe/kvb_geo/master/vrs_kvb_stops.json').read)   
    stations["features"].each do |feature|
      station = feature["properties"]["tags"]
      puts "-> Importing Stop #{station['VRS:ref']}"      
      station_lat = feature["geometry"]["coordinates"].first
      station_lon = feature["geometry"]["coordinates"].second
      puts "-> Creating #{station['VRS:ref']}"
      if station['VRS:ref'].blank? && station['ref:VRS'].blank?
        puts "-> skipping #{station["name"]}"
        skipped += 1
      else
        stop = Stop.create(
          agency_stop_id: station['VRS:ref'] || station['ref:VRS'],
          agency_id: 1,
          name: station['name'],
          lat: station_lat,
          lon: station_lon,
          location_type: 0,
          wheelchair_boarding: station['wheelchair'],
          url: station['webseite']        
        )
        created += 1
        puts "-> Stop #{station['VRS:ref']} created #{stop.id}"      
      end
    end
    puts "-> Skipped #{skipped} :: Created: #{created}"
  end
end