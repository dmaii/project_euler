digit_powers = (0..9).inject([]) { |s, i| s << i**5}

puts (2..digit_powers[9] * 6).select { |i|
  i.to_s.chars.inject(0) { |s, i| s += digit_powers[i.to_i] }.eql? i
}.inject(:+)
