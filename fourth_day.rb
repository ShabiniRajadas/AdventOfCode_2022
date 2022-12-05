input="2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8"

a = input.split("\n")

def convert_to_array(element_a, element_b)
    new_array = []
    (element_a..element_b).map { |r| new_array << r}
    return new_array
end

#Part 1
total_count = 0

a.each do |t|
    left, right = t.split(",")
    left_a, left_b = left.split("-")
    right_a, right_b = right.split("-")
    left_array = convert_to_array(left_a, left_b)
    right_array = convert_to_array(right_a, right_b)
    result_1 = left_array.intersection(right_array)
    result_2 = right_array.intersection(left_array)
    
    if result_1 == left_array || result_2 == right_array
        total_count = total_count + 1
    end
end
p total_count
# Part 2
total_count = 0
a.each do |t|
    left, right = t.split(",")
    left_a, left_b = left.split("-")
    right_a, right_b = right.split("-")
    left_array = convert_to_array(left_a, left_b)
    right_array = convert_to_array(right_a, right_b)
    result = left_array.intersection(right_array)
    
    unless result.empty?
        total_count = total_count + 1
    end
end

p total_count