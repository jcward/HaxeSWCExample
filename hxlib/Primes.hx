package hxlib;

class Primes {

	public static function sum_of_first_n_primes(n:UInt) : UInt
  {
    // Account for 0 so we can iterate by 2
    var found:UInt = n > 0 ? 1 : 0;
    var sum:UInt = n > 0 ? 2 : 0;
    var i:UInt = 3;

    while (found<n) {
      var prime:Bool = true;
      var j0:UInt = 2;
      var j1:UInt = i>>1;
      for (j in j0...j1) {
        if (i % j == 0) {
          prime = false;
          break;
        }
      }
      if (prime) {
        sum += i;
        found++;
      }
      i+=2;
    }
    return sum;
  }
}
