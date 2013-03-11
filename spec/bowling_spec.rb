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
    game = Bowling.new([5,3])
    game.is_miss?.should be_true
  end

  it "should determine when a spare is rolled" do
    game = Bowling.new([5,5])
    game.is_spare?.should be_true
  end

  it "should determine when a strike is rolled" do
    game = Bowling.new([10,0])
    game.is_strike?.should be_true
  end

  it "should not call a spare if a strike is rolled" do
    game = Bowling.new([10,0])
    game.is_spare?.should be_false
  end

  it "should not call a spare when a miss is rolled" do
    game = Bowling.new([5,3])
    game.is_spare?.should be_false
  end

  xit "should not run miss if a strike or a spare is rolled" do
    game = Bowling.new([10,0])
    game.miss.should == nil
  end

  xit "should add the score of a miss to the scorer if a miss is rolled" do
    game = Bowling.new([5,3])
    game.scorer.should == {"turn1"=>8}
  end

end