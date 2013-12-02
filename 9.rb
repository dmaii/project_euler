=begin
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=end 

catch :break do
  (1..1000).each do |a|
    (a..1000).each do |b|
      (b..1000).each do |c|
        if a + b + c == 1000 && a**2 + b**2 == c**2
          puts a * b * c 
          throw :break
        end 
      end 
    end 
  end 
end 
