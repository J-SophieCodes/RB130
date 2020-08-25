=begin
Implement an reduce method that will behave like Enumerable#reduce

  [1, 2, 3].reduce(10) do |acc, num|
    acc + num
  end

  - The return value of the block is assigned to the accumulator 
    object.
  - You can initialize the accumulator to a default value

Your reduce should take at least 1 argument that represents the 
array we'll operate on. It should also take an optional second 
argument that represents the default value for the accumulator. 
=end

def reduce(array, acc = nil)
  counter = 0

  if acc.nil?
    acc = array.first
    counter += 1
  end

  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end

  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    
# => 15
p reduce(array, 10) { |acc, num| acc + num }                
# => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        
# => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     
# => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } 
# => [1, 2, 'a', 'b']