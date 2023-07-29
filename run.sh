export JAVA_HOME="deps\jdk1.8.0_60"
TODAY=`date +%d-%m-%Y_%H-%M-%S`
REPORT_PATH=Report
EXTENT_REPORT_PATH="$REPORT_PATH"/Extent_$TODAY
EXTENT_IMAGES_PATH="$EXTENT_REPORT_PATH"/Images

if [ ! -d "$REPORT_PATH" ]; then
	echo Creating top level report directory at $REPORT_PATH
	mkdir $REPORT_PATH
else
echo Report directory at $REPORT_PATH already existed !!
fi
if [ ! -d "$EXTENT_REPORT_PATH" ]; then
	echo Creating report directory at $EXTENT_REPORT_PATH
	mkdir $EXTENT_REPORT_PATH
else
echo Report directory at %EXTENT_REPORT_PATH% already existed !!
fi
if [ ! -d "$EXTENT_IMAGES_PATH" ]; then
	echo Creating Images directory at $EXTENT_IMAGES_PATH
	mkdir $EXTENT_IMAGES_PATH
else
	echo Images directory in %EXTENT_IMAGES_PATH% already existed !!
fi

deps/apache-ant-1.9.7/bin/ant -f build_Linux.xml runtest junitreport -DStopOnError=false -DExtentPath='Extent_$TODAY'
