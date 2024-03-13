using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using Azure.Core;
using BilCoAPI.Core.Models.DTOs;
using BilCoAPI.Core.Models.Entities.Identity;
using BilCoAPI.Core.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;

namespace BilCoAPI.Services;

public sealed class AuthService : IAuthService
{
    private readonly UserManager<User> _userManager;

    public AuthService(UserManager<User> userManager)
    {
        _userManager = userManager;
    }

    public async Task<IdentityResult> CreateUser(User user, string password)
    {
        return await _userManager.CreateAsync(user,password);
    }

    public async Task<User?> GetUserByEmailAddressAsync(string emailAddress)
    {
        return await _userManager.FindByEmailAsync(emailAddress);
    }

    public async Task<User?> GetUserByIdAsync(Guid userId)
    {
        return await _userManager.FindByIdAsync(userId.ToString());
    }

    public async Task<bool> CheckPasswordAsync(User user, string password)
    {
        return await _userManager.CheckPasswordAsync(user, password);
    }

    public async Task<string> CreateAccessTokenAsync(string key, string issuer, string audience, User user, DateTime expires)
    {
        var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
        var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

        var roleNames = await _userManager.GetRolesAsync(user);

        var claims = new[] {
                            new Claim(JwtRegisteredClaimNames.Sub, user.Id.ToString()),
                            new Claim(JwtRegisteredClaimNames.Email, user.Email ?? string.Empty),
                            new Claim(JwtRegisteredClaimNames.GivenName, $"{user.FirstName} {user.LastName}"),
                            new Claim("roles", string.Join(",", roleNames))
                        };

        var token = new JwtSecurityToken(issuer, audience:audience, claims, expires: expires, signingCredentials: credentials);

        return new JwtSecurityTokenHandler().WriteToken(token);
    }

    public string CreateRefreshToken()
    {
        return Convert.ToBase64String(RandomNumberGenerator.GetBytes(32));
    }

    public async Task UpdateRefreshTokenOfUserAsync(User user, string token, DateTime expires)
    {
        user.RefreshToken = token;
        user.RefreshTokenExpires = expires;
        await _userManager.UpdateAsync(user);
    }

    public async Task RevokeUser(Guid userId)
    {
        var user = await _userManager.FindByIdAsync(userId.ToString());
        if (user != null)
        {
            user.RefreshToken = string.Empty;
            user.RefreshTokenExpires = null;

            await _userManager.UpdateAsync(user);
        }
        else
            throw new Exception("User Not Found");
    }
}
