input = "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw"

def alphabet_positions(string)
    if string == string.downcase
        string.bytes.map{|b| b - 96}[0]
    else
        string.downcase.bytes.map{|b| b - 96}[0] + 26
    end
end

# Part 1
array = input.split("\n")
all = []
array.each do |z|
    q = z.split("")
    count = q.count/2
    result = q[0..(count-1)] & q[count..(q.count)]
    position_score = alphabet_positions(result[0])
    all << position_score
end
p all
p all.sum

# Part 2
array = input.split("\n").each_slice(3).to_a
all = []
array.each do |z|
    left, middle, right = z
    result = left.split("") & middle.split("") & right.split("")
    position_score = alphabet_positions(result[0])
    all << position_score
end
p all
p all.sum