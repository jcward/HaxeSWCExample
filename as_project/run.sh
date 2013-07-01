# compile and run in flash debug player
$AIR_HOME/bin/mxmlc -source-path+=. -library-path+=../bin/hxlib.swc -optimize=true -debug ASMain.as -output ASMain.swf && \
(flashplayerdebugger ASMain.swf & \
 tail -n 0 -f ~/.macromedia/Flash_Player/Logs/flashlog.txt)
