# def divisors(n)
#   (1..n).select { |num| n % num == 0 }
# end

# def divisors(n)
#   result = []
#   (1..n).each do |num|
#     if n % num == 0
#       result << num
#       result << (n / num)
#     end
#   end
#   result.sort
# end

def divisors(n)
  result = []
  1.upto(Math.sqrt(n).to_i).each do |num|
   result << num << n / num if n % num == 0
  end
  result.uniq
end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(25)
p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a minute
