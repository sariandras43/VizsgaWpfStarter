@echo off
set /p dbName="Add meg az adatbazis nevet: "

set connectionString=Server=localhost;Database=%dbName%;Uid=root;Pwd=;

dotnet tool install --global dotnet-ef --version 8.0.11
dotnet add package Microsoft.EntityFrameworkCore -v 8.0.11
dotnet add package Microsoft.EntityFrameworkCore.Design -v 8.0.11
dotnet add package Microsoft.EntityFrameworkCore.Tools -v 8.0.11
dotnet add package MySql.EntityFrameworkCore -v 8.0.11

dotnet ef dbcontext scaffold "%connectionString%" MySql.EntityFrameworkCore --output-dir Data
echo A scaffold parancs lefutott.