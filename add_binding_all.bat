@echo off
setlocal enabledelayedexpansion

:: Check if the directory argument is provided
if "%~1"=="" (
    echo Usage: process-directory.bat "C:\path\to\directory"
    exit /b
)

:: Store the first argument as the directory path
set "dirPath=%~1"

:: Check if the directory exists
if not exist "%dirPath%" (
    echo Directory not found: %dirPath%
    exit /b
)

:: Loop through each .cs file in the directory
for %%F in (%dirPath%\*.cs) do (
    echo Processing file: %%F
    call add_binding.bat "%%F"
)

echo All files processed.