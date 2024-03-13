using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Core.Models.Entities.Identity
{
    public sealed class Role : IdentityRole<Guid>
    {
        public override string? Name { get; set; }
        public string? Privileges { get; set; }
    }

}
