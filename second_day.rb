opponent = {"A": "Rock", "B": "Paper", "C": "Scissors"}
me = {"X": "Rock", "Y": "Paper", "Z": "Scissors"}
points_for_shape = {"Rock": 1, "Paper": 2, "Scissors": 3 }
points_for_round = {"Lose": 0, "Draw": 3, "Win": 6 }

#Part 1
a = "A Y
B X
C Z
"
b = a.split("\n").map { |z| z.split(" ") }
all_scores = []
b.each do |z|
    score = points_for_shape[me[z[1].to_sym].to_sym]
    if opponent[z[0].to_sym] == me[z[1].to_sym]
        score = score + points_for_round[:Draw]
    elsif (opponent[z[0].to_sym] == "Rock" && me[z[1].to_sym] == "Paper") || (opponent[z[0].to_sym] == "Paper" && me[z[1].to_sym] == "Scissors") || (opponent[z[0].to_sym] == "Scissors" && me[z[1].to_sym] == "Rock") 
        score = score + points_for_round[:Win]
    end
    all_scores << score
end
print all_scores.sum
print "------\n"

# Part 2
winning_status = {X: "Lose", Y: "Draw", Z: "Win"}
all_scores = []
b.each do |z|
    score = points_for_round[winning_status[z[1].to_sym].to_sym]
    if winning_status[z[1].to_sym] == "Draw"
        score = score + points_for_shape[opponent[z[0].to_sym].to_sym]
    elsif winning_status[z[1].to_sym] == "Lose"
        case opponent[z[0].to_sym] 
        when "Rock"
            score = score + points_for_shape[:Scissors]
        when "Scissors"
            score = score + points_for_shape[:Paper]
        when "Paper"
            score = score + points_for_shape[:Rock]
        end
    elsif winning_status[z[1].to_sym] == "Win"
        case opponent[z[0].to_sym]
        when "Rock"
            score = score + points_for_shape[:Paper]
        when "Scissors"
            score = score + points_for_shape[:Rock]
        when "Paper"
            score = score + points_for_shape[:Scissors]
        end
    end
    all_scores << score
end
print all_scores.sum