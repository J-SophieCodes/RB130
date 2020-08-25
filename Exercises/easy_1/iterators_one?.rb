def one?(arr)
  result = 0
  arr.each do |item| 
    result += 1 if yield(item)
    return false if result > 1
  end
  result == 1
end

puts one?([1, 3, 5, 6]) { |value| value.even? }    == true
puts one?([1, 3, 5, 7]) { |value| value.odd? }     == false
puts one?([2, 4, 6, 8]) { |value| value.even? }    == false
puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
puts one?([1, 3, 5, 7]) { |value| true }           == false
puts one?([1, 3, 5, 7]) { |value| false }          == false
puts one?([]) { |value| true }                     == false

# SOLUTION
def one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end