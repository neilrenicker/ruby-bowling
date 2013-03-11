require 'spec_helper.rb'
require './bowling.rb'

describe Bowling do

  it "should accept a series of turns" do
    game = Bowling.new([5,5], [5,5])
    game.turns.should == [[5,5], [5,5]]
  end

  it "should isolate the first turn from a series of turns" do
    game = Bowling.new([5,5], [3,0])
    game.turn.should == [5,5]
  end

  it "should determine when a miss is rolled" do
    game = Bowling.new([5,3], [3,0])
    game.is_miss?.should be_true
  end

  it "should determine when a spare is rolled" do
    game = Bowling.new([5,5], [3,0])
    game.is_spare?.should be_true
  end

  it "should determine when a strike is rolled" do
    game = Bowling.new([10,0], [3,0])
    game.is_strike?.should be_true
  end

  it "should not determine a spare if a strike is rolled" do
    game = Bowling.new([10,0], [3,0])
    game.is_spare?.should be_false
  end

  it "should not determine a spare when a miss is rolled" do
    game = Bowling.new([5,3], [3,0])
    game.is_spare?.should be_false
  end

end