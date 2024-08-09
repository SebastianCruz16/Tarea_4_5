using APS.Security;
using APS.Web.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using System.Net;
using APS.Data.Models;

namespace APS.Web.Controllers
{
    public class LoginController(ISecurityService service) : Controller
    {
        private readonly ISecurityService _service = service;

        public IActionResult Index()
        {
            return View("/Views/Accounts/Login.cshtml");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                bool result = await _service.AuthUserByEmailAsync(new Data.Models.User { Email = model.Email, Password = model.Password });
                // Este método busca al usuario en la base de datos y verifica que la contraseña sea correcta.

                if (result)
                {
                    // si el resultado es exitoso se crea una lista de claims.
                    var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, model.Email),
                        // Un claim es una declaración sobre el usuario, como su nombre, rol, etc.
                        // Aquí, estamos añadiendo un claim con el tipo ClaimTypes.Name y el valor del correo electrónico del usuario.
                    };

                    var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));
                    // Esto establece las cookies de autenticación y asegura que el usuario esté autenticado para futuras solicitudes.

                    return RedirectToAction("Index", "Home");
                }

                ModelState.AddModelError(string.Empty, "Invalid login attempt.");
            }

            return View("/Views/Accounts/Login.cshtml", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            //HttpContext.Session.Clear(); // Limpiar la sesión al cerrar sesión
            return RedirectToAction("Index", "Login");
        }
    }
}    
