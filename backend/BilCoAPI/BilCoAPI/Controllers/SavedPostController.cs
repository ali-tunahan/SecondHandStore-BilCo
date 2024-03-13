using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using BilCoAPI.Core.Services;
using BilCoAPI.Core.Models.Entities;
using AutoMapper;
using BilCoAPI.Core;
using BilCoAPI.Core.Models.DTOs;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Linq.Expressions;
using BilCoAPI.Core.Models.Entities.Identity;
using Microsoft.AspNetCore.Identity;

namespace BilCoAPI.Controllers;

[ApiController]
[Route("savedposts")]
public class SavedPostController : Controller
{
    private readonly ISavedPostService _service;
    private UserManager<User> _userManager;
    private readonly IMapper _mapper;

    public SavedPostController(
        ISavedPostService service, IMapper mapper, UserManager<User> userManager) 
    {
        _service = service;
        _mapper = mapper;
        _userManager = userManager;
    }
    [HttpGet]
    public async Task<List<SavedPostDTO>> Get(Guid UserId)
    {
        var user = _userManager.Users.Where(u => u.Id == UserId).Include(u => u.SavedPosts)
            .ThenInclude(sp => sp.Post).FirstOrDefault();

        List<SavedPostDTO> items = new List<SavedPostDTO>();
        foreach (var savedPost in user.SavedPosts)
        {
            items.Add( new SavedPostDTO
            {
                Id = savedPost.Id,
                Post = savedPost.Post
            });
        }

        return items;
    }


    [HttpPost]
    public async Task<SavedPost?> Post(Guid UserId, Guid PostId)
    {
        var item = new SavedPost();
        item.Id = Guid.NewGuid();
        item.UserId = UserId;
        item.PostId = PostId;

        return await _service.CreateAsync(item);
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(Guid id)
    {
        if (id != Guid.Empty)
        {
            var item = await _service.GetByIdAsync(id);
            if (item != null)
            {
                await _service.DeleteAsync(item);

                return Ok();
            }
            else
                return NotFound();
        }
        else
            return BadRequest();
    }
}