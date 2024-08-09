
# Instalacion de EF Core
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.SqlServer

# EntityFramework command for scaffolding the database using (DB First)
dotnet-ef dbcontext scaffold "Server=SERVER;Database=APDatadb;Trusted_Connection=True;TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer -o Models

# EntityFramework command for scaffolding the database using (DB First) includes the -f (Force generation)
dotnet-ef dbcontext scaffold "Server=SERVER;Database=APDatadb;Trusted_Connection=True;TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer -o Models -f