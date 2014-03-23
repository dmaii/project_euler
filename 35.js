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
