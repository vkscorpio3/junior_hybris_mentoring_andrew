@echo off

SET HYBRIS_PATH=D:\Hybris\b2c\

SET HYBRIS_CONFIG=%HYBRIS_PATH%\hybris\config
SET HYBRIS_EXTENSIONS=%HYBRIS_PATH%\hybris\bin\custom
SET EXTENSIONS=..\extensions

if exist "%HYBRIS_CONFIG%\localextensions.xml" (
	del /F %HYBRIS_CONFIG%\localextensions.xml
) else (
    echo localextensions.xml DOES NOT EXIST
)

if exist "%HYBRIS_CONFIG%\local.properties" (
    del /F %HYBRIS_CONFIG%\local.properties
) else (
    echo local.properties DOES NOT EXIST
)

MKLINK /H "%HYBRIS_CONFIG%\localextensions.xml" "localextensions.xml"
MKLINK /H "%HYBRIS_CONFIG%\local.properties" "local.properties"

if exist "%HYBRIS_EXTENSIONS%" (
    RMDIR /Q /S "%HYBRIS_EXTENSIONS%"
    MKLINK /J "%HYBRIS_EXTENSIONS%" "%EXTENSIONS%"
) else (
    MKLINK /J "%HYBRIS_EXTENSIONS%" "%EXTENSIONS%"
)

pause
