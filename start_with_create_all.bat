@echo off
setlocal enabledelayedexpansion
set /p consoleProjectName="Add meg a konzolos projekt nevet: "
set /p desktopProjectName="Add meg az asztali projekt nevet: "
set /p dbName="Add meg az adatbazis nevet: "

dotnet new console -n %consoleProjectName%
dotnet new wpf -n %desktopProjectName%
cd %consoleProjectName%
dotnet new sln -n %consoleProjectName% 
dotnet sln %consoleProjectName%.sln add %consoleProjectName%.csproj
dotnet sln %consoleProjectName%.sln add "..\%desktopProjectName%\%desktopProjectName%.csproj"
cd "..\%desktopProjectName%"
echo A WPF es konzolos projekt letrejott es hozza lett adva a solutionhoz.

dotnet add package Microsoft.EntityFrameworkCore -v 8.0.11
dotnet add package Microsoft.EntityFrameworkCore.Design -v 8.0.11
dotnet add package Microsoft.EntityFrameworkCore.Tools -v 8.0.11
dotnet add package MySql.EntityFrameworkCore -v 8.0.11

dotnet ef dbcontext scaffold "Server=localhost;Database=%dbName%;Uid=root;Pwd=;" MySql.EntityFrameworkCore --output-dir Data

echo A scaffold parancs lefutott.

echo Masolasok folyamatban...

if exist "..\example.xaml" (
    copy /Y "..\example.xaml" "MainWindow.xaml"
    echo Az example.xaml tartalma sikeresen be lett masolva a MainWindow.xaml-be.
) else (
    echo Az example.xaml fájl nem található.
)

if exist "..\example.xaml.cs" (
    copy /Y "..\example.xaml.cs" "MainWindow.xaml.cs"
    echo Az example.xaml.cs tartalma sikeresen be lett masolva a MainWindow.xaml-be.
) else (
    echo Az example.xaml.cs fájl nem található.
)

if exist "..\Database.cs" (
    copy /Y "..\Database.cs" "Database.cs"
    echo A Database.cs tartalma sikeresen be lett masolva a MainWindow.xaml-be.
) else (
    echo A Database.cs fájl nem található.
)

echo A namespacek cserelese folyamatban a MainWindow.xaml fajlban...
powershell -ep Bypass -Command "(Get-Content 'MainWindow.xaml') -replace 'VizsgaWpfStarter.MainWindow', '%desktopProjectName%.MainWindow' | Set-Content 'MainWindow.xaml' -Encoding utf8"
powershell -ep Bypass -Command "(Get-Content 'MainWindow.xaml') -replace 'clr-namespace:VizsgaWpfStarter', 'clr-namespace:%desktopProjectName%' | Set-Content 'MainWindow.xaml' -Encoding utf8"
echo A namespacek cserelese sikeres volt a MainWindow.xaml fajlban.



echo A namespacek, importok cserelese folyamatban a MainWindow.xaml.cs fajlban...
powershell -ep Bypass -Command "(Get-Content 'MainWindow.xaml.cs') -replace 'VizsgaWpfStarter', '%desktopProjectName%' | Set-Content 'MainWindow.xaml.cs' -Encoding utf8"
echo A namespacek cserelese sikeres volt a MainWindow.xaml.cs fajlban.

echo A namespacek, importok cserelese folyamatban a Database.cs fajlban...
powershell -ep Bypass -Command "(Get-Content 'Database.cs') -replace 'VizsgaWpfStarter', '%desktopProjectName%' | Set-Content 'Database.cs' -Encoding utf8"
echo A namespacek cserelese sikeres volt a Database.cs fajlban.

set "firstChar=!dbName:~0,1!"
for %%A in ("a=A" "b=B" "c=C" "d=D" "e=E" "f=F" "g=G" "h=H" "i=I" "j=J" "k=K" "l=L" "m=M" "n=N" "o=O" "p=P" "q=Q" "r=R" "s=S" "t=T" "u=U" "v=V" "w=W" "x=X" "y=Y" "z=Z") do (
    set "map_%%~A"
)
set "upperFirst=!map_%firstChar%!"
if not defined upperFirst set "upperFirst=%firstChar%"
set "dbUpper=!upperFirst!!dbName:~1!"

echo A DbContextek cserelese folyamatban a Database.cs fajlban...
powershell -ep Bypass -Command "(Get-Content 'Database.cs') -replace 'new AppContext', 'new %dbUpper%Context' | Set-Content 'Database.cs' -Encoding utf8"
powershell -ep Bypass -Command "(Get-Content 'Database.cs') -replace 'static AppContext', 'static %dbUpper%Context' | Set-Content 'Database.cs' -Encoding utf8"
echo A DbContextek cserelese sikeres volt a Database.cs fajlban.

echo A DbContextek cserelese folyamatban a MainWindow.xaml.cs fajlban...
powershell -ep Bypass -Command "(Get-Content 'MainWindow.xaml.cs') -replace 'private AppContext', 'private %dbUpper%Context' | Set-Content 'MainWindow.xaml.cs' -Encoding utf8"

cd ..
