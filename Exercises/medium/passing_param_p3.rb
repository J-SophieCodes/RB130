items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1
gather(items) do |*first , second|
  puts first.join(", ")
  puts second
end

# 2
gather(items) do |first, *second, third|
  puts first
  puts second.join(", ")
  puts third
end

# 3
gather(items) do |first, *second|
  puts first
  puts second.join(", ")
end

# 4
gather(items) do |a, b, c, d|
  puts "#{a}, #{b}, #{c}, and #{d}"
end