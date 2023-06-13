class Visitor
  attr_reader :name, 
              :height, 
              :spending_money,
              :preferences

  def initialize(name, height, spending_money_raw)
    @name = name
    @height = height
    @spending_money = spending_format(spending_money_raw)
    @preferences = []
  end

  def spending_format(raw_data)
    raw_data.delete("$").to_i
  end

  def add_preference(preference)
    preferences << preference
  end

  def tall_enough?(required_height)
    height >= required_height
  end
end