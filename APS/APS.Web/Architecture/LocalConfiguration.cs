using APS.Web.Filters;

namespace APS.Web.Architecture;

internal static class LocalConfiguration
{
    internal static void Register(IServiceCollection serviceCollection)
    {
        serviceCollection.AddScoped<CustomAuthorizationFilter>();
    }
}
