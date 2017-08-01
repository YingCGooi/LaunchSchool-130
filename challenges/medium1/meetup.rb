# the first Monday => first week of the month that falls on a Monday
# the third Tuesday => third weeek of the month that falls on a Tuesday
# the Wednesteenth => 13-19th day of the month that falls on a Wednesday
# the last Thursday => last week of the month that falls on a Thursday

# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule)
# where weekday is one of :monday, :tuesday, etc
# and schedule is :first, :second, :third, :fourth, :last or :teenth.

require 'date'

class Meetup
  SCHEDULES = {
    first:  lambda { |weeks| weeks[0] },
    second: lambda { |weeks| weeks[1] },
    third:  lambda { |weeks| weeks[2] },
    fourth: lambda { |weeks| weeks[3] },
    last:   lambda { |weeks| weeks.flatten(1) },
    teenth: lambda { |weeks| weeks.flatten(1)[12..18] }
  }

  attr_accessor :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    weeks =
      (1..31).map do |day|
        [new_date(day).strftime('%A').downcase.to_sym, day] if valid_date?(day)
      end.compact
         .each_slice(7)
         .to_a

    meetup_day = SCHEDULES[schedule].call(weeks).to_h[weekday]
    new_date(meetup_day)
  end

  def valid_date?(day)
    Date.valid_date?(year, month, day)
  end

  def new_date(day)
    Date.new(year, month, day)
  end
end


p Meetup.new(3, 2013).day(:monday, :first)
p Meetup.new(2, 2013).day(:saturday, :first)
p Meetup.new(3, 2013).day(:sunday, :first)
p Meetup.new(5, 2013).day(:monday, :teenth)
p Meetup.new(8, 2013).day(:monday, :teenth)
p Meetup.new(4, 2013).day(:sunday, :last)