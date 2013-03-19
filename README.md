# Ruby Bowling Kata

My implementation in Ruby of the [KataBowling](http://codingdojo.org/cgi-bin/wiki.pl?KataBowling) challenge, based on a game of standard 10-pin American bowling.

## Bowling Rules:

* 10 turns allowed per game.
* 2 rolls allowed per turn.
* If bowler fails to knock both down, score for that turn is sum of its rolls rolls.
* Spare: bowler knocks down 10 on roll #2. Score is 10 + next roll score.
* Strike: bowler knocks down 10 on roll #1. Score is 10 + next 2 throw scores.
* Spare or strike on last turn (turn 10), gets 1 or 2 bonus rolls respectively. These bonus rolls count toward the 10th turn.

## My Approach:

I chose to structure the turns as an array of arrays. Since the kata doesn't require checking for invalid roll sequences, I simply check for a bonus based on the array count. If a bonus exists, it gets defined as `bonus`, removed from the turns, and added on to the final turn score.

To deal with consecutive strike scoring, I have a `strike_scorer` method that looks ahead at the following two turns, and checks to see if they are also strikes. My main `scorer` method is where the magic happens - a `while` loop iterates through each turn in the array except the 10th turn, then the 10th turn is dealt with based on whether a `bonus` exists or not.