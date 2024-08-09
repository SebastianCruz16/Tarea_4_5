using APS.Data;
using APS.Data.Models;
using APS.Web.Filters;
using Microsoft.EntityFrameworkCore;

namespace APS.Web.Architecture;

internal static class RepositoryConfiguration
{
    internal static void Register(IServiceCollection serviceCollection)
    {
        serviceCollection.AddScoped<ISecurityRepository, SecurityRepository>();
        serviceCollection.AddDbContext<ApdatadbContext>(options
            => options.UseSqlServer("Server =192.168.100.60, 1433; Database = APDatadb; User Id = sa; Password = Ufide2024; TrustServerCertificate = True; "));
    }
}
