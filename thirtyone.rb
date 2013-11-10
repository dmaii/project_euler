=begin
In England the currency is made up of pound, Â£, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, Â£1 (100p) and Â£2 (200p).
It is possible to make Â£2 in the following way:

1ÃÂ£1 + 1Ã50p + 2Ã20p + 1Ã5p + 1Ã2p + 3Ã1p
How many different ways can Â£2 be made using any number of coins?
=end 

$denom = [0, 1, 2, 5, 10, 20, 50, 100, 200]

def make_change_for(n, k)
  if k < 1 || n < 0
    0
  elsif n == 0
    1
  else
    make_change_for(n, k - 1) + make_change_for(n - $denom[k], k)
  end 
end 

puts make_change_for(200, 8)
