require 'spec_helper'

RSpec.describe Carnival do 
  describe "#intialize" do
    it "exists and has attributes" do
      carnival1 = Carnival.new(14)

      expect(carnival1).to be_a Carnival
      
      expect(carnival1.duration).to eq(14)
      expect(carnival1.rides).to eq([])
    end
  end
end