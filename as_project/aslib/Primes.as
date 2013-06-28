package aslib
{

  public class Primes {

    public static function sum_of_first_n_primes(n:uint):uint
    {
      // Account for 0 so we can iterate by 2
      var found:uint = n > 0 ? 1 : 0;
      var sum:uint = n > 0 ? 2 : 0;
      var i:uint = 3;
   
      while (found<n) {
        var prime:Boolean = true;
        var j0:uint = 2;
        var j1:uint = i>>1;
        for (var j:uint=j0; j<j1; j++) {
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
}
