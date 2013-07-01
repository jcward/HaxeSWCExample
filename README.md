# HaxeSWCExample

This project is a simple example of how to build a SWC from Haxe 3 source code and use it in an AS3 project.  This is an interesting workflow mostly because the Haxe compiler and syntax results in optimizations that make code (especially algorithms) run much faster in the Flash VM.

### Usage:

Step 1: Compile the Haxe library to a SWC:

Requires haxe compiler in your path.

```
> ./compile.sh
# aka:  haxe --macro "include('hxlib')" -swf hxlib.swc
```

Step 2: Run the AS3 project

Requires mxmlc compiler and flashplayerdebug in your path, and mm.cfg setup to very the trace output.

```
> cd as_project
> ./run.sh
Haxe swc test!
AS3 performance: 216 ms, sum=4800540
HX performance: 53 ms, sum=4800540
```

Nice!  Virtually the same simple sum-of-first-N-primes algorithm runs 4x faster when compiled via Haxe.

Update: The 4X improvement is when run in the Flash runtime on desktop/web.  Oddly, when I tested the same code on mobile via AIR (both iOs cross-compiled and Android captive runtime), performance benefits were much less pronounced - 1.5X for a complex algorithm, inconsequential for the sum of primes algorithm...  Hmm, I wonder why...

### Verification

It's a good idea to setup library verification testcases, since Haxe compiled to SWC is difficult (at best) to compile once linked into your AS3 application.  I've included a small testcase:

Requires haxe compiler and flashplayerdebugger in your path.

```
> ./test.sh
# aka:  haxe -main Test -debug -swf test.swf && flashplayerdebugger test.swf
```

### Passing Objects to AS3

By the way, to return complex objects from Haxe to AS3, you may have to convert them into a type that AS3 can handle.  For example, if you have a `Map<String, Rectangle>`, you can provide a getter that will return a Flash `Object` (in Haxe, a `Dynamic`):

```
var _map:Map<String, Rectangle>;
public function get_placement():Dynamic {
  var rtn:Dynamic = {};
  var it:Iterator<String> = _map.keys();
  for (name in it) {
    untyped { rtn[name] =   _map[name]; }
  }
  return rtn;
}
```

