=begin
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

=end 

class Integer
  LESS_THAN_20 = [
    nil,    'one',     'two',       'three',    'four', 
    'five',    'six',     'seven',     'eight',    'nine', 
    'ten',     'eleven',  'twelve',    'thirteen', 'fourteen', 
    'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 
  ]
  DOUBLE_FIGURES = [
    nil,    'ten',   'twenty',  'thirty', 'forty', 
    'fifty', 'sixty', 'seventy', 'eighty', 'ninety',
  ]

  def to_english
    if self < 20
      LESS_THAN_20[self]
    elsif self < 100
      DOUBLE_FIGURES[(self / 10).floor] + (LESS_THAN_20[self % 10] || '')
    elsif self < 1000 
      digits = self.to_s.split(//).collect { |i| i.to_i }
      r = LESS_THAN_20[digits[0]] + 'hundred' + (self % 100 > 0 ? 'and' : '')
      if digits[1] > 0 && digits[1] < 2
        r + LESS_THAN_20[(digits[1].to_s + digits[2].to_s).to_i]
      else 
        r + ((DOUBLE_FIGURES[digits[1]] || '') + (LESS_THAN_20[digits[2]] || ''))
      end 
    else
      'onethousand'
    end 
  end 
end 

puts (1..1000).inject(0) { |s, i| s += i.to_english.length }
