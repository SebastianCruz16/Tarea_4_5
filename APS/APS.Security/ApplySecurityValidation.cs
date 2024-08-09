using System.Net.Http.Headers;

namespace APS.Security;

public static class ApplySecurityValidation
{
    private static readonly string Subdomain = "mysupercomany";
    private static readonly string Domain = "org";

    public static bool Validate(string email) // xrussi.biz.info
    {
        // @mysupercompany.org
        if (!(email.IndexOf(".") > 1)) return false;
        var parts = email.Split('.');
        if (!parts[0].Equals(Subdomain) || !parts[1].Equals(Domain)) return false;
        return true;
    }
}
