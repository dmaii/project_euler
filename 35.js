/*
   The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

   There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

   How many circular primes are there below one million?
*/

var Prime = require('./lib/prime');
var primes = [null, true, true, true, false, true, false, true, false, true];

var prime = new Prime();

function getRotations(digits) {
  var rotations = [];
  for (var i = 0; i < digits.length; i++) {
    digits.unshift(digits.pop()); 
    rotations.push(parseInt(digits.slice().join('')));
  }
  return rotations; 
}

function isCircularPrime(num, sieve) {
  var digits = num.toString().split('');
  for (var i in digits) {
    if (!primes[parseInt(digits[i])])
      return false;
  }

  var rotations = getRotations(digits);
  for (var i in rotations) {
    if (!sieve[rotations[i]]) 
      return false;
  }
  return true;
}

var sieve = prime.sieve(1000000), count = 0;
for (var i = 2; i <= 1000000; i++) {
  if (isCircularPrime(i, sieve)) 
    count += 1;
}
console.log(count);
