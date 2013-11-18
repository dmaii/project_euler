=begin
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
=end 

curious = []
(1..98).each do |i|
  (i + 1..99).each do |ii|
    num_digits, den_digits = i.to_s.split(''), ii.to_s.split('')
    if !(num_digits[1].to_i == 0 && den_digits[1].to_i == 0) &&
      (common = (num_digits & den_digits)).size == 1
      s_num, s_den = (num_digits - common)[0].to_i, (den_digits - common)[0].to_i
      if s_den != 0 && 
        (r = Rational(i, ii)).eql?(Rational(s_num, s_den))
        curious << r
      end 
    end 
  end 
end 

puts curious.inject(:*).denominator
