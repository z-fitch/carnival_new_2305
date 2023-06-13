class Carnival
  attr_reader :duration, 
              :rides
  
  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    rides << ride
  end

  def most_popular_ride
    rides.max do |ride, ride2|
      ride.rider_log.values.sum <=> ride2.rider_log.values.sum
    end
  end

  def most_profitable_ride
    rides.max do |ride, ride2|
      ride.total_revenue <=> ride2.total_revenue
    end
  end

  def total_revenue
    rides.sum do |ride|
      ride.total_revenue
    end
  end
end