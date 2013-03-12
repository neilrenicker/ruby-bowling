class Bowling

  attr_accessor :turns, :bonus

  def initialize(*turns)
    @turns = turns
    if turns.count == 11
      @bonus = turns.last
      turns.pop
    end
  end

  def turn
    turns.first
  end

  def following_turn
    turns[1]
  end

  def sum
    turn[0] + turn[1]
  end

  def is_miss?
    sum < 10 && sum >= 0
  end

  def is_spare?
    sum == 10 && turn[0] != 10
  end

  def is_strike?
    turn[0] == 10
  end

  def turn_score
    if is_miss?
      sum
    elsif is_spare?
      10 + following_turn[0]
    else is_strike?
      10 + following_turn[0] + following_turn[1]
    end
  end

  def scorer
    score = 0
    while turns != []
      score = score + turn_score
      turns.shift
    end
    score
  end

end