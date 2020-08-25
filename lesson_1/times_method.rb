=begin
Implement a times method that will behave like Integer#times

times(5) do |num|
  puts num
end

=end

# method implementation
def times(n)
  counter = 0

  while counter < n do
    yield(counter)
    counter += 1
  end

  n
end

# method invocation
times(5) do |num|
  puts num
end
