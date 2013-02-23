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
#       "name"=>"Eifelpstation_latz",
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

  task :routes => [:environment] do
    Route.delete_all
    Cologne::Lines.new.process
  end

  desc "Get station data"
  task :stops => [:environment] do
    require 'open-uri'
    require 'csv'
    skipped = 0
    created = 0
    counter = 0
    skipped_names = []
    hash = {}
    Stop.destroy_all
    CSV.new(open('https://raw.github.com/schienenliebe/kvb_geo/master/hst_testdata.csv'), col_sep: ";").each do |line|
    # CSV.new(open('/Volumes/code/kvb_geo/hst_testdata.csv'), col_sep: ";").each do |line|
      hash[line[2]] = {:id => line[0], :name => line[1]}
    end
    stations = JSON.parse(open('https://raw.github.com/schienenliebe/kvb_geo/master/vrs_kvb_stops.json').read)
    stations["features"].each do |feature|
      counter += 1
      station = feature["properties"]["tags"]
      next if ["DB Station & Service AG"].include?(station['operator'])
      next if ["14479"].include?(station['VRS:ref'] || station['ref:VRS'])
      puts "-> Importing Stop #{station['VRS:ref']} #{counter} / #{stations["features"].size}"
      station_lon = feature["geometry"]["coordinates"].first
      station_lat = feature["geometry"]["coordinates"].second

      if station['VRS:ref'].present?
        agency_stop_id = hash[station['VRS:ref']][:id]
      elsif station['ref:VRS'].present?
        agency_stop_id = hash[station['ref:VRS']][:id]
      end

      if station['VRS:ref'].blank? && station['ref:VRS'].blank?
        name_mapping = { "Breslauer Platz / Hbf" => "Breslauer Platz/Hbf",
        "Deutz Fachhochschule" => "Deutz-Kalker Bad",
        "Slabystraße" => "Slabystr.",
        "Rathaus" => "Rathaus",
        "Rath-Heumar" => "Rath-Heumar",
        "Gelderstraße/Parkgürtel, Köln" => "Geldernstr./Parkgürtel",
        "Siegstraße" => "Siegstr. (Stadtbahn)",
        "Iltisstraße" => "Iltisstr.",
        "Margaretastraße" => "Margaretastr.",
        "Marsdorf" => "Marsdorf",
        "Iltisstraße" => "Iltisstr.",
        "Lustheide" => "Lustheide"}
        result = hash.find {|i| i.second[:name] == name_mapping[station["name"]]}
        if result
          station['VRS:ref'] = result.first
          agency_stop_id = result.second[:id]
        else
          puts "-> skipping #{station["name"]}... retry"
          skipped_names << station["name"]
          skipped += 1
        end
      end

      if agency_stop_id
        next if Stop.find_by_agency_stop_id(agency_stop_id).present?
        puts "-> Creating #{agency_stop_id}"
        stop = Stop.create(
          agency_stop_id: agency_stop_id,
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
    puts skipped_names
  end
end