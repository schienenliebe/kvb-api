# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless Agency.any?
  Agency.create(
    name: 'Kölner Verkehrs-Betriebe AG',
    url: 'http://www.kvb-koeln.de/',
    timezone: 'Europe/Berlin',
    lang: 'de',
    phone: '+49 (0) 221 5470',
    fare_url: 'http://www.kvb-koeln.de/german/tarif/index.html')
end

unless CalendarService.any?
  agency = Agency.first
  CalendarService.create!({
    agency_id: agency.id,
    code: 'week-day',
    monday: true,
    tuesday: true,
    wednesday: true,
    thursday: true,
    friday: true,
    saturday: false,
    sunday: false,
    starts_on: Date.new(2013, 1, 1),
    ends_on: Date.new(2013, 12, 31)
  })
  CalendarService.create!({
    agency_id: agency.id,
    code: 'saturday',
    monday: false,
    tuesday: false,
    wednesday: false,
    thursday: false,
    friday: false,
    saturday: true,
    sunday: false,
    starts_on: Date.new(2013, 1, 1),
    ends_on: Date.new(2013, 12, 31)
  })
  CalendarService.create!({
    agency_id: agency.id,
    code: 'sunday-or-holiday',
    monday: false,
    tuesday: false,
    wednesday: false,
    thursday: false,
    friday: false,
    saturday: false,
    sunday: true,
    starts_on: Date.new(2013, 1, 1),
    ends_on: Date.new(2013, 12, 31)
  })
end