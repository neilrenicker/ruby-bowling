# Ruby Bowling Kata

My implementation of the [KataBowling](http://codingdojo.org/cgi-bin/wiki.pl?KataBowling) challenge, based on a game of standard 10-pin American bowling and coded with Ruby.

## Bowling Rules:

* 10 turns (frames) for the bowler
* 2 tries per turn
* If fails to knock both down, score for that frame is sum of rolls
* Spare: knocks down 10 on roll #2. Score is 10 + next throw score
* Strike: knocks down 10 on roll #1. Score is 10 + next 2 throw scores
* Spare or strike on last turn (frame 10), gets 1 or 2 bonus balls. Count as same turn.

## Suggested Test Cases:

*(When scoring "X" indicates a strike, "/" indicates a spare, "-" indicates a miss)*

* "XXXXXXXXXXXX" (12 rolls: 12 strikes) = 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 + 10+10+10 = 300
* "9-9-9-9-9-9-9-9-9-9-" (20 rolls: 10 pairs of 9 and miss) = 9 + 9 + 9 + 9 + 9 + 9 + 9 + 9 + 9 + 9 = 90
* "5/5/5/5/5/5/5/5/5/5/5" (21 rolls: 10 pairs of 5 and spare, with a final 5) = 10+5 + 10+5 + 10+5 + 10+5 + 10+5 + 10+5 + 10+5 + 10+5 + 10+5 + 10+5 = 150

*Break it into parts!*