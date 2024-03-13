using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Services
{
    public class CustomUserProvider : IUserIdProvider
    {

        public string? GetUserId(HubConnectionContext connection)
        {
            var userId = connection.GetHttpContext()?.Request.Query["userId"];

            if (string.IsNullOrEmpty(userId))
            {
                connection.User.AddIdentity(new System.Security.Claims.ClaimsIdentity(
                    new[] { new System.Security.Claims.Claim("UserId", userId) }
                    ));
            }

            return userId;
        }

    }
}
