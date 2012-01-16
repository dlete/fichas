# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# http://www.citizensinformation.ie/en/employment/employment_rights_and_conditions/leave_and_holidays/public_holidays_in_ireland.html
PublicHoliday.delete_all
PublicHoliday.create(day: "2012-01-01", event: "New Year's Day")
PublicHoliday.create(day: "2012-03-17", event: "St. Patrick's Day")
PublicHoliday.create(day: "2012-04-09", event: "Easter Monday")
PublicHoliday.create(day: "2012-05-01", event: "First Monday of May")
PublicHoliday.create(day: "2012-06-04", event: "First Monday of June")
PublicHoliday.create(day: "2012-08-06", event: "First Monday of August")
PublicHoliday.create(day: "2012-10-29", event: "Last Monday of October")
PublicHoliday.create(day: "2012-12-25", event: "Christmas Day")
PublicHoliday.create(day: "2012-12-26", event: "St. Stephen's Day")

Department.delete_all
Department.create(name: "d1")
Department.create(name: "d2")
Department.create(name: "d3")

