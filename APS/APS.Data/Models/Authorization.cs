using System;
using System.Collections.Generic;

namespace APS.Data.Models;

public partial class Authorization
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public string Pages { get; set; } = null!;

    public virtual User IdNavigation { get; set; } = null!;
}
