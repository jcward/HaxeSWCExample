package
{
  import flash.display.MovieClip;
  import flash.display.Shape;
  import flash.display.Sprite;
  import flash.utils.getTimer;
  import flash.geom.Rectangle;

  import hxlib.Primes;
  import aslib.Primes;

  public class ASMain extends Sprite
  {
    public function ASMain():void
    {
      stage.scaleMode = 'noScale';
      stage.align = 'topLeft';
      stage.frameRate = 20;

      trace("Haxe swc test!");

      // new MovieClip is passed to haxe code to populate
      // the flash.Lib.current reference.  Note, if your
      // Haxe code uses flash.Lib.current.stage, you may
      // need to add this movieclip to the stage.
      var mc:MovieClip = new MovieClip();

      haxe.initSwc(mc); // For Haxe 3
      //haxe.init(mc); // For Haxe 2

      // Test the aslib
      var sum:uint;
      var t0:int = getTimer();
      sum = aslib.Primes.sum_of_first_n_primes(1131);
      trace("AS3 performance: "+(getTimer()-t0)+" ms, sum="+sum);

      // Test the hxlib
      t0 = getTimer();
      sum = hxlib.Primes.sum_of_first_n_primes(1131);
      trace("HX performance: "+(getTimer()-t0)+" ms, sum="+sum);
    }
  }
}
