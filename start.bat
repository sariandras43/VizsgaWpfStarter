dotnet add package Microsoft.EntityFrameworkCore -v 8.0.11
dotnet add package Microsoft.EntityFrameworkCore.Design -v 8.0.11
dotnet add package Microsoft.EntityFrameworkCore.Tools -v 8.0.11
dotnet add package MySql.EntityFrameworkCore -v 8.0.11

dotnet ef dbcontext scaffold "Server=localhost;Database=dbname;Uid=root;Pwd=;" MySql.EntityFrameworkCore --output-dir Data