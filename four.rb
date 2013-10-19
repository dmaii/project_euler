largest = (100...1000).inject(0) do |pal, a|
  cl = (100...1000).each do |b|
    pal = a * b if a * b > pal if (p = a * b).to_s == p.to_s.reverse
  end 
  pal 
end 

puts largest
