using System;
using System.Collections.Generic;

namespace APS.Data.Models;

public partial class User
{
    public int UserId { get; set; }

    public string Username { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string Email { get; set; } = null!;

    public DateTime? CreatedAt { get; set; }

    public string? Description { get; set; }

    public bool? IsAuthorized { get; set; }

    public virtual ICollection<Account> Accounts { get; set; } = new List<Account>();

    public virtual Authorization? Authorization { get; set; }

    public virtual ICollection<Notification> Notifications { get; set; } = new List<Notification>();
}
