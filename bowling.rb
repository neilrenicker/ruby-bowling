require 'pry'

class Bowling

  attr_accessor :turns, :scorer

  def initialize(*turns)
    @turns = turns
    @scorer = Hash.new
  end

  def turn
    turns.first
  end

  def sum
    turn[0] + turn[1]
  end

  def is_miss?
    sum < 10 && sum >= 0
  end

  def is_spare?
    sum == 10 && turn.first != 10
  end

  def is_strike?
    turn.first == 10
  end

  # def miss
  #   if is_miss? == true
  #     self.scorer = { "turn1" => sum }
  #   end
  # end

end