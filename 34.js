/*
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
*/

/*
No factorion can exist with more than seven digits, because if there are 8 digits, then the number n
needs to be between the range 10,000,000 and 9! * 8 = 2903040. This is impossible.
*/

var factorials = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880];
var sum = 0;

for (var i = 3; i <= 10000000; i++) {
  var factSum = 0, divide = i;
  while (divide !== 0) {
    factSum += factorials[divide % 10];
    divide = Math.floor(divide/10);
  }
  if (factSum === i) 
    sum += factSum;
}

console.log(sum);
