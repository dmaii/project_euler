=begin
A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

1/2	= 	0.5
1/3	= 	0.(3)
1/4	= 	0.25
1/5	= 	0.2
1/6	= 	0.1(6)
1/7	= 	0.(142857)
1/8	= 	0.125
1/9	= 	0.(1)
1/10	= 	0.1
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
=end 

require 'prime'

def cycle_length(num)
  not_2_or_5 = num.prime_division.select { |i| i[0] != 2 && i[0] != 5 }
  if not_2_or_5.size > 0
    nines = '9'
    m = not_2_or_5.inject(1) { |s, i| s *= i[0]**i[1] }
    nines << '9' until nines.to_i % m == 0
    nines.size
  else 
    0
  end 
end 

puts (1..1000).inject(0) { |g, i| cycle_length(i) > g ? i : g }
