@echo off
setlocal enabledelayedexpansion

set "inputString=strCodeItemCode"

:: Initialize the dictionary
set "productDict="

:: Define the regular expression pattern
set "pattern=T-(\d+)\(([^)]+)\)"

:: Use findstr to extract matching parts of the input string
for /f "tokens=2,3 delims=()" %%a in ('echo !inputString! ^| findstr /r /c:"!pattern!"') do (
    set "productCode=T-%%a"
    set "storeCodes=%%b"
    
    :: Split storeCodes into an array
    for %%s in (!storeCodes:/= !) do (
        set "productDict[%%s]=!productCode!"
    )
)

:: Print the dictionary
for /f "tokens=1,* delims==" %%s in ('set productDict[') do (
    echo %%s: %%t
)

endlocal
