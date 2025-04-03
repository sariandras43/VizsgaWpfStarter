@echo off
setlocal

echo Telepítés és PATH beállítása...

dotnet tool list -g | findstr /C:"dotnet-ef" >nul
if %errorlevel% neq 0 (
    echo dotnet-ef nincs telepítve. Telepítés...
    dotnet tool install --global dotnet-ef --version 8.0.11
) else (
    echo dotnet-ef már telepítve van.
)

set DOTNET_TOOLS_PATH=%USERPROFILE%\.dotnet\tools
echo %PATH% | findstr /C:"%DOTNET_TOOLS_PATH%" >nul
if %errorlevel% neq 0 (
    echo Hozzáadás a PATH-hoz...
    setx PATH "%DOTNET_TOOLS_PATH%;%PATH%" /M
    echo PATH frissítve! Indítsd újra a terminált.
) else (
    echo PATH már tartalmazza a dotnet tools mappát.
)

echo dotnet-ef verzió ellenőrzése...
dotnet-ef --version

echo Kész!
pause
