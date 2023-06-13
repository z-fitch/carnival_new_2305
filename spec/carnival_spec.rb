require 'spec_helper'

RSpec.describe Carnival do 
  before(:each) do
    @carnival1 = Carnival.new(14)
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')

    @visitor1.add_preference(:gentle)
    @visitor1.add_preference(:thrilling)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling)
    @visitor3.add_preference(:thrilling)
    @visitor3.add_preference(:gentle)

  end

  describe "#intialize" do
    it "exists and has attributes" do
      carnival1 = Carnival.new(14)

      expect(carnival1).to be_a Carnival
      
      expect(carnival1.duration).to eq(14)
      expect(carnival1.rides).to eq([])
    end

    it "can add rides" do
      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)
      
      expect(@carnival1.rides).to eq([@ride1, @ride2, @ride3])
    end
  end

  describe "#most_popular_ride" do
    it "can find the most popular ride" do
      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)
# 3
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
# 4
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)
      
      expect(@carnival1.most_popular_ride).to eq(@ride3)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor2)
      expect(@carnival1.most_popular_ride).to eq(@ride1)

    end
  end

  describe "#most_profitable_ride" do
    it "can find the most profitable ride" do
      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)

      @ride3.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride2.board_rider(@visitor3)
    
      expect(@carnival1.most_profitable_ride).to eq(@ride2)

      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor1)
      expect(@carnival1.most_profitable_ride).to eq(@ride3)
    end
  end

  describe "#total_revenue" do
    it "can find the total_revenue" do
      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)
      
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      
      @ride3.board_rider(@visitor1)
      
      @ride2.board_rider(@visitor3)
    
      expect(@carnival1.total_revenue).to eq(10)

      @ride1.board_rider(@visitor1)
      expect(@carnival1.total_revenue).to eq(11)
    end
  end
end