@echo off
setlocal enabledelayedexpansion

:: Check if the file argument is provided
if "%~1"=="" (
    echo Usage: replace-class.bat "C:\path\to\YourFile.cs"
    exit /b
)

:: Store the first argument as the filename
set "filename=%~1"

:: Check if the file exists
if not exist "%filename%" (
    echo File not found: %filename%
    exit /b
)

:: Call the PowerShell script to perform the regex replacement
powershell -ep Bypass -File "replace_class.ps1" -filePath "%filename%"

echo Replacement complete.