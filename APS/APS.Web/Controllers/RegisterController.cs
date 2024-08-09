using APS.Security;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using APS.Web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages;

namespace APS.Web.Controllers
{
    public class RegisterController(ISecurityService service) : Controller
    {
        private readonly ISecurityService _service = service;

        public IActionResult Index()
        {
            return View("/Views/Accounts/Register.cshtml");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new Data.Models.User { Username = model.Username, Email = model.Email, Password = model.Password };
                bool userExists = await _service.AuthUserByEmailAsync(user);

                if (userExists)
                {
                    ModelState.AddModelError(string.Empty, "Email already in use.");
                    return View(model);
                }

                bool result = await _service.RegisterUserAsync(user);

                if (result)
                {
                    TempData["SuccessMessage"] = "Registration successful! Please log in.";
                    return RedirectToAction("Index", "Home");
                }

                ModelState.AddModelError(string.Empty, "Registration failed.");
            }
            return View(model);
        }
    }
}
