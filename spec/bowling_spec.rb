require 'spec_helper.rb'
require './bowling.rb'

describe Bowling do

  it "should be able to create a new game" do
    game = Bowling.new
  end

  xit "should recognize 2 rolls within each turn" do
    game = Bowling.new
    game.turn([5,5]).should == [5,5]
  end

end