using BilCoAPI.Core.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using BilCoAPI.Core.Models.DTOs;
using Azure.Core;
using Microsoft.AspNetCore.Http.HttpResults;
using BilCoAPI.Core.Models.APIRequests;
using BilCoAPI.Core.Models.Entities.Identity;
using AutoMapper;
using BilCoAPI.Core.Models.Entities;
using BilCoAPI.Utility;
using Microsoft.EntityFrameworkCore;
using BilCoAPI.Core;
using static Chat;

namespace BilCoAPI.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AuthController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private readonly IAuthService _service;
    private readonly IUserImageService _userImageService;
    private readonly IMapper _mapper;
    private readonly UserManager<User> _userManager;
    private readonly BilCoDbContext _bilCoDbContext;

    public AuthController(
        IAuthService service, IConfiguration configuration, IMapper mapper, UserManager<User> userManager, IUserImageService userImageService, BilCoDbContext bilCoDbContext)
    {
        _service = service;
        _configuration = configuration;
        _mapper = mapper;
        _userManager = userManager;
        _userImageService = userImageService;
        _bilCoDbContext = bilCoDbContext;
    }

    [HttpGet("/messages/{receiverUserId}/{senderUserId}")]
    public async Task<IEnumerable<Message>> GetMessageHistory(Guid receiverUserId, Guid senderUserId)
    {
        return await _bilCoDbContext.Messages.Where(m => m.ReceiverUserId == receiverUserId && m.SenderUserId == senderUserId || m.ReceiverUserId == senderUserId && m.SenderUserId == receiverUserId)
            .OrderBy(m => m.SentTime)
            .ToListAsync();
    }

    public class ChatDTO
    {
        public Guid UserId { get; set; }
        public string Name { get; set; }
        public string? ProfileImageUrl { get; set; }
    }

    [HttpGet("/userchats/{id}")]
    public async Task<IEnumerable<ChatDTO>> GetChatPartners(Guid id)
    {
        var chatPartnersQuery = await _bilCoDbContext.Messages
            .Where(m => m.SenderUserId == id || m.ReceiverUserId == id)
            .Select(m => m.SenderUserId == id ? m.ReceiverUserId : m.SenderUserId)
            .Distinct().Join(_bilCoDbContext.Users, userId => userId, user => user.Id,
                (userId, user) => new ChatDTO{ UserId = userId, Name = user.FirstName + " " + user.LastName, ProfileImageUrl = ""}).ToListAsync();

        for (int i = 0; i < chatPartnersQuery.Count; i++)
        {
            //get image for each user from blob
            var userImage = await _userImageService.GetByIdAsync(chatPartnersQuery[i].UserId);
            if (userImage != null)
            {
                chatPartnersQuery[i].ProfileImageUrl = userImage.ImageUrl;
            }
        }

        return chatPartnersQuery;
    }


    [HttpPost("register")]
        public async Task<User> Register([FromBody] CreateUserDTO user)
        {
            if (user != null)
            {
                var createdUser = new User();
                _mapper.Map(user, createdUser);
                
                createdUser.Email = user.UserName;
                //createdUser.Id = Guid.NewGuid();
                

            var result = await _service.CreateUser(createdUser, user.Password);
                if (result.Succeeded)
                {
                    return createdUser;
                }
                else
                throw new Exception("coudl not create user");
        }
            else
                throw new Exception("bad request");
        }

        [HttpPost("authorize")]
        public async Task<AuthorizeDTO> Authorize([FromBody] AuthorizeRequest authorizeRequest)
        {
            var user = await _service.GetUserByEmailAddressAsync(authorizeRequest.UserName);
            if (user != null)
            {
                if (user.Enabled)
                {
                    if (await _service.CheckPasswordAsync(user, authorizeRequest.Password))
                    {
                        if (_configuration["Authentication:Key"] != null &&
                            _configuration["Authentication:Issuer"] != null && _configuration["Authentication:Audience"] != null)
                        {
                            // access token
                            var key = _configuration["Authentication:Key"] ?? string.Empty;
                            var issuer = _configuration["Authentication:Issuer"] ?? string.Empty;
                            var audience = _configuration["Authentication:Audience"] ?? string.Empty;
                            var accessTokenExpires = DateTime.UtcNow.AddDays(12);
                            var accessToken =
                                await _service.CreateAccessTokenAsync(key, issuer, audience, user, accessTokenExpires);

                            // refresh token
                            var refreshToken = _service.CreateRefreshToken();
                            var refreshTokenExpires = DateTime.UtcNow.AddDays(90);
                            await _service.UpdateRefreshTokenOfUserAsync(user, refreshToken, refreshTokenExpires);
                            
                            return new AuthorizeDTO
                            {
                                UserId = user.Id,
                                AccessToken = accessToken,
                                RefreshToken = refreshToken,
                                RefreshTokenExpires = refreshTokenExpires,
                                IsAuthorized = true
                            };
                        }
                        else
                            return new AuthorizeDTO
                            {
                                UserId = user.Id,
                                AccessToken = "",
                                RefreshToken = "",
                                RefreshTokenExpires = DateTime.Now,
                                IsAuthorized = false
                            };
                }
                    else
                        return new AuthorizeDTO
                        {
                            UserId = user.Id,
                            AccessToken = "",
                            RefreshToken = "",
                            RefreshTokenExpires = DateTime.Now,
                            IsAuthorized = false
                        };
            }
                else
                return new AuthorizeDTO
                {
                    UserId = user.Id,
                    AccessToken = "",
                    RefreshToken = "",
                    RefreshTokenExpires = DateTime.Now,
                    IsAuthorized = false
                };
        }   
            else
            return new AuthorizeDTO
            {
                UserId = Guid.NewGuid(),
                AccessToken = "",
                RefreshToken = "",
                RefreshTokenExpires = DateTime.Now,
                IsAuthorized = false
            };
    }

        [HttpPost("refresh")]
        public async Task<AuthorizeDTO> Refresh([FromBody] RefreshRequest refreshRequest)
        {
            var user = await _service.GetUserByIdAsync(refreshRequest.UserId);
            if (user != null)
            {
                if (user.Enabled)
                {
                    if (user.RefreshToken == refreshRequest.RefreshToken &&
                        user.RefreshTokenExpires >= DateTime.UtcNow)
                    {
                        if (_configuration["Authentication:Key"] != null &&
                            _configuration["Authentication:Issuer"] != null && _configuration["Authentication:Audience"] != null)
                        {
                            // access token
                            var key = _configuration["Authentication:Key"] ?? string.Empty;
                            var issuer = _configuration["Authentication:Issuer"] ?? string.Empty;
                            var audience = _configuration["Authentication:Audience"] ?? string.Empty;
                            var accessTokenExpires = DateTime.UtcNow.AddHours(1);
                            var accessToken =
                                await _service.CreateAccessTokenAsync(key, issuer, audience, user, accessTokenExpires);

                            // refresh token
                            var refreshToken = _service.CreateRefreshToken();
                            var refreshTokenExpires = DateTime.UtcNow.AddHours(8);
                            await _service.UpdateRefreshTokenOfUserAsync(user, refreshToken, refreshTokenExpires);

                            return new AuthorizeDTO
                            {
                                UserId = user.Id,
                                AccessToken = accessToken,
                                RefreshToken = refreshToken,
                                RefreshTokenExpires = refreshTokenExpires,
                                IsAuthorized = true
                            };
                        }
                        else
                            throw new Exception("Authentication:Key or Authentication:Issuer is not configured"); //TODO better way to do this?
                    }
                    else
                        throw new Exception("Refresh Token Incorrect or Expired");
                }
                else
                    throw new Exception("User Disabled");
            }
            else
                throw new Exception("User Not Found");
        }

        [HttpPost("revoke")]
        public async Task<IActionResult> Revoke(Guid userId)
        {
            await _service.RevokeUser(userId);

            return Ok();
        }

        [HttpGet("{id}")]
        public async Task<UserDTO> Get(Guid id)
        {
            var item = await _userManager.FindByIdAsync(id.ToString());
        if (item != null)
            {
                //map item to itemDTO
                var itemDTO = _mapper.Map<UserDTO>(item);
                var image = await _userImageService.GetByIdAsync(id);
                if (image != null)
                {
                    var userImage = new UserImage();
                    userImage.UserId = id;
                    userImage.Id = image.Id;
                    userImage.ImageUrl = image.ImageUrl;
                    itemDTO.UserImage = userImage;
                }
                return itemDTO;
            }
            throw new Exception("Not Found");
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put(Guid id, [FromBody] UpdateUserDTO itemDTO)
        {
            // TODO take as bool if the image changed, if so upload new image and update userimage if not dont
            var itemToBeUpdated = await _userManager.FindByIdAsync(id.ToString());
            var oldUserImage = await _userImageService.GetByIdAsync(id);

            if (itemToBeUpdated != null)
            {
                _mapper.Map(itemDTO, itemToBeUpdated);

                if (itemDTO.Password != null)
                {
                    var token = await _userManager.GeneratePasswordResetTokenAsync(itemToBeUpdated);
                    await _userManager.ResetPasswordAsync(itemToBeUpdated, token, itemDTO.Password);
                }

                if (oldUserImage != null)
                {
                    await BlobUtility.DeleteImageAsync(oldUserImage.ImageUrl);
                }

                if (itemDTO.ProfileImage != null)
                {
                    var userImage = new UserImage();
                    userImage.Id = Guid.NewGuid();
                    userImage.UserId = id;
                    userImage.ImageUrl = await BlobUtility.UploadImageAsync(itemDTO.ProfileImage);
                    await _userImageService.CreateAsync(userImage);
                }
                else
                {
                itemToBeUpdated.UserImage = null;
                }

                itemToBeUpdated.Id = id;

                await _userManager.UpdateAsync(itemToBeUpdated);

                return Ok();
            }
            return NotFound();
        }
}
