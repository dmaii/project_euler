=begin
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 Ã 99.

Find the largest palindrome made from the product of two 3-digit numbers
=end 

largest = (100...1000).inject(0) do |pal, a|
  cl = (100...1000).each do |b|
    pal = a * b if a * b > pal if (p = a * b).to_s == p.to_s.reverse
  end 
  pal 
end 

puts largest
