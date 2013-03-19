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
    game = Bowling.new([5,3],[1,4],[5,5])
    game.following_turn.should == [1,4]
  end

  it "should score a miss by adding the turns two rolls" do
    game = Bowling.new([5,3])
    game.turn_score.should == 8
  end

  it "should score a spare by adding 10 to the first roll of the next turn" do
    game = Bowling.new([5,5],[4,1])
    game.turn_score.should == 14
  end

  it "should properly score multiple consecutive spares" do
    game = Bowling.new([5,5],[5,5],[5,5],[5,5])
    game.scorer.should == 55
  end

  it "should score a strike by adding 10 to both rolls of the next turn" do
    game = Bowling.new([10,0],[4,1])
    game.turn_score.should == 15
  end

  it "should process all but the last turn from the turns array" do
    game = Bowling.new([10,0],[4,1])
    game.scorer
    game.turns.should == [[4,1]]
  end

  it "should output a final score of 20 for a game rolled with a strike and a 4,1 spare" do
    game = Bowling.new([10,0],[4,1])
    game.scorer.should == 20
  end

  it "should remove the bonus turn from the list of turns" do
    game = Bowling.new([10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,10])
    game.turns.should == [[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0]]
  end

  it "should separate out the bonus turn from the list of turns" do
    game = Bowling.new([10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,10])
    game.bonus.should == [10,10]
  end

  it "should add the bonus to the last turn if a spare is rolled" do
    game = Bowling.new([3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[0,10],[6,0])
    game.scorer.should == 70
  end

  it "should score an entire game of misses correctly" do
    game = Bowling.new([3,0],[3,0],[3,0],[3,0],[3,0],[3,0],[3,0],[3,0],[3,0],[3,0])
    game.scorer.should == 30
  end

  it "should score an entire game of spares correctly" do
    game = Bowling.new([3,7],[3,7],[3,7],[3,7],[3,7],[3,7],[3,7],[3,7],[3,7],[3,7],[10,0])
    game.scorer.should == 137
  end

  it "should score consecutive strikes correctly" do
    game = Bowling.new([10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,10])
    game.turn_score.should == 30
    game.scorer.should == 300
  end

  it "should score a game consecutive strikes ending in a miss correctly" do
    game = Bowling.new([10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[5,3])
    game.scorer.should == 261
  end

end