=begin
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ? b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
=end 

require 'prime'

def factors(number)
  if number == 1
    [1]
  else 
    primes, powers = number.prime_division.transpose
    exponents = powers.map{|i| (0..i).to_a}
    divisors = exponents.shift.product(*exponents).map do |powers|
      primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
    end
    divisors - [number]
  end 
end

def amicable?(a, b)
  if a != b
    a_factors = factors(a) 
    b_factors = factors(b) 
    a_factors.inject(:+) == b && b_factors.inject(:+) == a ? true : false
  end 
end 

arr = (0..10000).inject([]) { |s, i| s << [i] }
range = (2..10000).each do |i|
  if arr[i][1].nil?
    factor_sum = factors(i).inject(:+)
    if amicable?(i, factor_sum)
      arr[i] << true
      arr[factor_sum] << true 
    end 
  end 
end 

puts arr.inject(0) { |s, i| i[1].nil? ? s : s + i[0] }
