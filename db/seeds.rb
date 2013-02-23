# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Agency.create(
  name: 'Kölner Verkehrs-Betriebe AG',
  url: 'http://www.kvb-koeln.de/',
  timezone: 'Europe/Berlin',
  lang: 'de',
  phone: '+49 (0) 221 5470',
  fare_url: 'http://www.kvb-koeln.de/german/tarif/index.html')