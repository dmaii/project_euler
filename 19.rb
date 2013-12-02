=begin
You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
=end 

require 'date'

sundays = (Date.new(1901, 1, 1)..Date.new(2000, 12, 31)).inject(0) do |sundays, date|
  sundays += 1 if date.sunday? && date.day.eql?(1)
  sundays
end 

puts sundays
