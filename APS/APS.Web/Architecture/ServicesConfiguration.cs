using APS.Security;
using APS.Web.Filters;

namespace APS.Web.Architecture;

internal static class ServicesConfiguration
{
    internal static void Register(IServiceCollection serviceCollection)
    {
        serviceCollection.AddScoped<ISecurityService, SecurityService>();
    }
}
