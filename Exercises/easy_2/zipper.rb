def zip(arr1, arr2)
  arr1.each_index.map do |idx| 
    [arr1[idx], arr2[idx]]
  end
end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
