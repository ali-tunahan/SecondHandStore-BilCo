using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Core.Models.APIRequests
{
    public sealed class AuthorizeRequest
    {
        public string UserName { get; set; }
        public string Password { get; set; }
    }
}
