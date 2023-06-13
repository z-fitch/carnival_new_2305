class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log
  def initialize(info)
    @name = info[:name]
    @min_height = info[:min_height]
    @admission_fee = info[:admission_fee]
    @excitement = info[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end

  def board_rider(rider)
    if rider.preferences.include?(excitement) && rider.tall_enough?(min_height)
      if rider_log[rider] != nil
        rider_log[rider] += 1
      else
        rider_log[rider] = 0
        rider_log[rider] += 1
      end
      @total_revenue += admission_fee
      rider.spending_money -= admission_fee
    end

  end
end