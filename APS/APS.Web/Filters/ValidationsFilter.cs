using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace APS.Web.Filters;

[AttributeUsage(AttributeTargets.Property | AttributeTargets.Field | AttributeTargets.Parameter, AllowMultiple = false)]
public class ValidationsFilter : Attribute
{
    public ValidationsFilter() { }

    public bool IsValid(string pass)
    {
        if (string.IsNullOrEmpty(pass)) return false;
        if (pass.Length < 8) return false;
        var regex = new Regex(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{16,}$"); 
        if (!regex.IsMatch(pass)) return false;

        return true;
    }
}
