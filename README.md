# HaxeSWCExample

This project is a simple example of how to build a SWC from Haxe 3 source code and use it in an AS3 project.  This is an interesting workflow mostly because the Haxe compiler and syntax results in optimizations that make code (especially algorithms) run much faster in the Flash VM.

The trickiest part about this Haxe->SWC workflow is that there apparently needs to be a dummy Main class, and that dummy Main class needs to be linked into AS3.

### Usage:

Step 1: Compile the Haxe library to a SWC:

Requires haxe compiler in your path.

```
> ./compile.sh
# aka:  haxe -main hxlib.DummyMain --macro "include('hxlib')" -swf hxlib.swc
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

### Verification

It's a good idea to setup library verification testcases, since Haxe compiled to SWC is difficult (at best) to compile once linked into your AS3 application.  I've included a small testcase:

Requires haxe compiler and flashplayerdebugger in your path.

```
> ./test.sh
# aka:  haxe -main Test -debug -swf test.swf && flashplayerdebugger test.swf
```
