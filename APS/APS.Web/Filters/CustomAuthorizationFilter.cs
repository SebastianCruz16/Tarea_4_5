using APS.Web.Controllers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Security.Claims;

namespace APS.Web.Filters;

public class CustomAuthorizationFilter : IAuthorizationFilter
{
    public void OnAuthorization(AuthorizationFilterContext context) // Se ejecuta cada vez que se requiere autorización para una acción o controlador.
    {
        var user = context.HttpContext.User;
        if (!user.Identity.IsAuthenticated)
        {
            // Verify if the user is logged in
            //context.Result = new RedirectToActionResult("Index", "Login", null);
            //TODO: Testing
            context.Result = new RedirectToActionResult("Index", "Login", null);
        }
    }
}