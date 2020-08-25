def method(arr)
  yield(*arr)
end

birds = %w(raven finch hawk eagle)
method(birds) do |raven, finch, *raptors|
  puts raven
  puts finch
  puts raptors
end