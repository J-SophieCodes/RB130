# def compute
#   block_given? ? yield : 'Does not compute.'
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# FURTHER EXPLORATION
def compute(input)
  block_given? ? yield(input) : 'Does not compute.'
end

p compute(3) { 5 + 3 } == 8
p compute(3) { 'a' + 'b' } == 'ab'
p compute(3) == 'Does not compute.'