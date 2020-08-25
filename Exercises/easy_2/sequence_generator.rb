def step(start_val, end_val, step_val)
  counter = start_val
  
  while counter <= end_val
    yield(counter)
    counter += step_val
  end

  counter # sensible to return nil or last value returned by block
end

p step(1, 10, 3) { |value| puts "value = #{value}" }