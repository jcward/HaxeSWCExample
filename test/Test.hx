package;

import flash.display.Sprite;
import flash.geom.Rectangle;
import hxlib.Primes;
import flash.Lib;

class Test extends Sprite {

	public function new () {
		
		super ();

    // Ensure the Primes.hx library is working as expected in Haxe,
    // because it's harder to debug from Flash.

    var sum:UInt;
    sum = Primes.sum_of_first_n_primes(3);
    trace((sum==10 ? "Correct" : "ERROR") + ": sum_of_first_n_primes(3) => "+sum);

    sum = Primes.sum_of_first_n_primes(4);
    trace((sum==17 ? "Correct" : "ERROR") + ": sum_of_first_n_primes(4) => "+sum);

    sum = Primes.sum_of_first_n_primes(1131);
    trace((sum==4800540 ? "Correct" : "ERROR") + ": sum_of_first_n_primes(1131) => "+sum);
  }

  public static function main()
  {
    flash.Lib.current.addChild(new Test());
  }
}
