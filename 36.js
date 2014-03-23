/*
   The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

   Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

   (Please note that the palindromic number, in either base, may not include leading zeros.)
*/

String.prototype.reverse = function() { 
  return this.split("").reverse().join("");
}

var sum = 0;
for (var i = 0; i < 1000000; i++) {
  var numStr = i.toString(), binStr = i.toString(2);
  if (numStr === numStr.reverse() && binStr === binStr.reverse()) {
    sum += i;
  }
}
console.log(sum);
