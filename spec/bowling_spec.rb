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

  it "should be able to know the score of the following turn" do
    game = Bowling.new([5,3], [1,4], [5,5])
    game.following_turn.should == [1,4]
  end

  it "should score a miss by adding the turns two rolls" do
    game = Bowling.new([5,3])
    game.score.should == 8
  end

  it "should score a spare by adding 10 to the first roll of the next turn" do
    game = Bowling.new([5,5],[4,1])
    game.score.should == 14
  end

    it "should score a strike by adding 10 to both rolls of the next turn" do
    game = Bowling.new([10,0],[4,1])
    game.score.should == 15
  end

end