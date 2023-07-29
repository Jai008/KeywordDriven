echo off
SET JAVA_HOME="deps\jdk1.8.0_60"
SET TODAY=%DATE:~7,2%-%DATE:~4,2%-%DATE:~10,4%_%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%
SET REPORT_PATH=Report
SET EXTENT_REPORT_PATH=%REPORT_PATH%\Extent_%TODAY%
SET EXTENT_IMAGES_PATH=%EXTENT_REPORT_PATH%\Images

IF NOT EXIST "%REPORT_PATH%" (
	echo Creating top level report directory at %REPORT_PATH%
	mkdir %REPORT_PATH%
) else (
echo Report directory at %REPORT_PATH% already existed !!
)
IF NOT EXIST "%EXTENT_REPORT_PATH%" (
	echo Creating report directory at %EXTENT_REPORT_PATH%
	mkdir %EXTENT_REPORT_PATH%
) else (
echo Report directory at %EXTENT_REPORT_PATH% already existed !!
)
IF NOT EXIST "%EXTENT_IMAGES_PATH%" (
	echo Creating Images directory at %EXTENT_IMAGES_PATH%
	mkdir %EXTENT_IMAGES_PATH%
) else (
	echo Images directory in %EXTENT_IMAGES_PATH% already existed !!
)
deps\apache-ant-1.9.7\bin\ant runtest junitreport -DStopOnError=true -DExtentPath=%EXTENT_REPORT_PATH%
