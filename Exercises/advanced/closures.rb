# write down your observations for each group of code.
# write one final analysis that explains the differences between 
# procs, blocks, and lambdas.



# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
# A new Proc object can be created with a call of proc instead 
# of Proc.new

puts my_proc #<Proc:0x000055d4204004f8 blocks.rb:6>
puts my_proc.class # proc class
my_proc.call # proc called without an argument; lenient arity
my_proc.call('cat') # proc called with an argument

# A Proc object does not require that the correct number of 
# arguments are passed to it. If nothing is passed, then nil is 
# assigned to the block variable.



# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
# lambda is equivalent to Proc.new, except the resulting Proc 
# objects check the number of parameters passed when called.

my_second_lambda = -> (thing) { puts "This is a #{thing}." } 
# -> (param) is a notation for lambda

puts my_lambda #<Proc:0x0000555f7637f390 closures.rb:13 (lambda)
puts my_second_lambda #<Proc:0x0000555f7637f2c8 closures.rb:14 (lambda)>
# While a Lambda is a Proc, it maintains a separate identity 
# from a plain Proc.

puts my_lambda.class 
# proc class. A Lambda is actually a different variety of Proc.
my_lambda.call('dog') # lambda called with an argument

my_lambda.call # ArgumentError; lambda has strict arity rules

my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } 
# NameError; We cannot create a new Lambda object with Lambda.new

# A lambda enforces the number of arguments. If the expected number 
# of arguments are not passed to it, then an error is thrown.



# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# no arg passed into block
# If a block variable is defined, and no value is passed to it, 
# then nil will be assigned to that block variable.

block_method_1('seal')
# LocalJumpError
# must provide a block to yield to

# Lenient arity rules: A block passed to a method does not 
# require the correct number of arguments



# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# This is a turtle.

block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# This is a turtle and a .
# Blocks have lenient arity rules. You can pass less than what
# the block takes. Remaining param are assigned nil

block_method_2('turtle') { puts "This is a #{animal}."}
# NameError (undefined local var animal)
# The block created an inner scope and have no access to the 
# variables in its outerscope. Must be passed in as arguments.

# Blocks will throw an error if a variable is referenced that 
# doesn't exist in the block's scope.

=begin
SUMMARY - Comparison

Lambdas are types of Proc's. Technically they are both Proc objects. 

An implicit block is a grouping of code, a type of closure, it 
is not an Object.

Lambdas enforce the number of arguments passed to them. 

Implicit blocks and Procs do not enforce the number of arguments 
passed in.

=end