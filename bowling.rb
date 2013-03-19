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

  def second_turn
    turns[2]
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

  def ninth_strike_followed_by_strike?
    following_turn[0] == 10 && second_turn == nil
  end

  def strike_followed_by_two_strikes?
    following_turn[0] == 10 && second_turn[0] == 10
  end

  def strike_followed_by_strike?
    following_turn[0] == 10
  end

  def strike_scorer
    if ninth_strike_followed_by_strike?
      20 + bonus[0]
    elsif strike_followed_by_two_strikes?
      30
    elsif strike_followed_by_strike?
      20 + second_turn[0]
    else
      10 + following_turn[0] + following_turn[1]
    end
  end

  def turn_score
    if is_miss?
      sum
    elsif is_spare?
      10 + following_turn[0]
    else is_strike?
      strike_scorer
    end
  end

  def scorer
    score = 0
    while turns.length > 1
      score = score + turn_score
      turns.shift
    end
    if bonus
      score = score + sum + bonus[0] + bonus[1]
      score
    else
      score = score + sum
    end
  end

end