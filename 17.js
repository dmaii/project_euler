/**
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
*/

LESS_THAN_20 = [null,    'one',     'two',       'three',    'four', 
             'five',    'six',     'seven',     'eight',    'nine', 
             'ten',     'eleven',  'twelve',    'thirteen', 'fourteen', 
             'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];

DOUBLE_FIGURES = [null,    'ten',   'twenty',  'thirty', 'forty', 
               'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];

function numToEnglish(num) {
  if (num < 20) {
    return LESS_THAN_20[num];
  } else if (num < 100) {
    return DOUBLE_FIGURES[Math.floor(num/10)] + (LESS_THAN_20[num % 10] || '');
  } else if (num < 1000) {
    var collector = function(item) { return parseInt(item); }
    digits = num.toString().split('').map(collector);
    var r = LESS_THAN_20[digits[0]] + 'hundred' + (num % 100 > 0 ? 'and' : '');
    if (digits[1] > 0 && digits[1] < 2) {
      return r + LESS_THAN_20[parseInt(digits[1].toString() + digits[2].toString())];
    } else {
      return r + ((DOUBLE_FIGURES[digits[1]] || '') + (LESS_THAN_20[digits[2]] || ''));
    } 
  } else {
    return 'onethousand';
  }
}

var sum = 0;
for (var i = 1; i <= 1000; i++) {
  sum += numToEnglish(i).length;
}

console.log(sum);
