function Prime() {
  this.table = [null, true]; 
  this.last = 2;
  this.sieve = function(num) {
    for (var n = this.last; n <= num; n++) {
      if (this.table[n] == undefined) {
        this.table[n] = true;
        this.last = n; 
        for (var p = n * n; p <= num; p += n) {
          this.table[p] = false;
        }
      } 
    }
    return this.table;
  }
}

module.exports = Prime;
