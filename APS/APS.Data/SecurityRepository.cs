using APS.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APS.Data;

public interface ISecurityRepository
{
    Task<bool> AuthenticateUserAsync(User user);
    Task<bool> AuthorizeUserAsync(User user);
    Task<bool> RegisterUserAsync(User user);

}

public class SecurityRepository(ApdatadbContext context) : Repository(context), ISecurityRepository
{
    public async Task<bool> AuthorizeUserAsync(User user)
    {
        return true;
    }

    public async Task<bool> AuthenticateUserAsync(User user)
    {
        static bool validate(User user, User found)
        {
            if (user == null || found == null)
                return false;

            var validations = new List<bool>
            {
                (user.Email == found.Email),
                (user.Password == found.Password),
                (!string.IsNullOrEmpty(user.Password))
            };

            return validations.All(x => x);
        }

        var foundUser = await Context.Users.SingleOrDefaultAsync(u => u.Email == user.Email);
        return validate(user, foundUser);
    }

    public async Task<bool> RegisterUserAsync(User user)
    {
        if (user == null || string.IsNullOrEmpty(user.Password))
            return false;

        var userExists = await Context.Users.AnyAsync(u => u.Email == user.Email);
        if (userExists)
            return false;

        Context.Users.Add(user);
        await Context.SaveChangesAsync();
        return true;
    }

}
