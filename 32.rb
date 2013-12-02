=begin
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
=end 

puts [1,2,3,4,5,6,7,8,9].permutation(9).to_a.reduce([]) { |answers, i|
  answer = i[5..8].join.to_i
  two_three = i[0..1].join.to_i * i[2..4].join.to_i == answer 
  one_four = i[0] * i[1..4].join.to_i == answer 
  two_three || one_four ? answers + [answer] : answers
}.uniq.inject(:+)
