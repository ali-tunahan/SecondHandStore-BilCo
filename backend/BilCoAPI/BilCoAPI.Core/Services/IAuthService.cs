
using BilCoAPI.Core.Models.Entities.Identity;
using Microsoft.AspNetCore.Identity;

namespace BilCoAPI.Core.Services;

public interface IAuthService
{
    Task<IdentityResult> CreateUser(User user, string password);
    Task<User?> GetUserByEmailAddressAsync(string emailAddress);
    Task<User?> GetUserByIdAsync(Guid userId);
    Task<bool> CheckPasswordAsync(User user, string password);

    Task<string> CreateAccessTokenAsync(string key, string issuer,string audience, User user, DateTime expires);
    string CreateRefreshToken();
    Task UpdateRefreshTokenOfUserAsync(User user, string token, DateTime expires);
    Task RevokeUser(Guid userId);
}
