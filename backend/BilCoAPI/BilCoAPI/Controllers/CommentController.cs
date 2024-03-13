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

namespace BilCoAPI.Controllers;

[ApiController]
[Route("comments")]
public class CommentController : Controller
{
    private readonly ICommentService _service;
    private readonly IMapper _mapper;

    public CommentController(
        ICommentService service, IMapper mapper)
    {
        _service = service;
        _mapper = mapper;
    }
    [HttpGet]
    public async Task<IEnumerable<CommentDTO>?> Get()
    {
        var items = await _service.Get();

        //map items to itemDTOS
        var itemDTOS = _mapper.Map<IEnumerable<CommentDTO>>(items);

        return itemDTOS;
    }

    [HttpGet("Fuzzy")]  
    public async Task<ListingResponse<CommentDTO>> Get(Guid CommentedToUserId, int? startIndex = null, int? count= null)
    {
        IEnumerable<Comment> items;
        int totalCount;
        
        items = await _service.Get(predicate: p => p.CommentedToUserId.Equals(CommentedToUserId), sortClause: "Created DESC", includeProperties: p => p.User);
        totalCount = await _service.GetCountAsync(predicate: p => p.CommentedToUserId.Equals(CommentedToUserId));
        
        //map items to itemDTOS
        var itemDTOS = _mapper.Map<IEnumerable<CommentDTO>>(items);

        return new ListingResponse<CommentDTO>
            {
                Data = itemDTOS,
                TotalCount = totalCount,
                StartIndex = startIndex,
                DataCount = itemDTOS.Count(),
            };
    }

    [HttpGet("{id}")]
    public async Task<CommentDTO> Get(Guid id)
    {
        var item = await _service.GetByIdAsync(id);
        if (item != null)
        {
            //map item to itemDTO
            var itemDTO = _mapper.Map<CommentDTO>(item);

            return itemDTO;
        }
        else
            throw new Exception("Bad Request");
    }

    [HttpPost]
    public async Task<Comment?> Post([FromBody] CreateCommentDTO itemDTO)
    {
        //map dto to item
        var item = _mapper.Map<Comment>(itemDTO);

        //Additional properties that should be set after the mapping such as Id and created DateTime
        item.Id = Guid.NewGuid();
        item.Created = DateTime.UtcNow;

        return await _service.CreateAsync(item);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Put(Guid id, [FromBody] CreateCommentDTO itemDTO)
    {
        var itemToBeUpdated = await _service.GetByIdAsync(id);
        if (itemToBeUpdated != null)
        {
            _mapper.Map(itemDTO, itemToBeUpdated);

            await _service.UpdateAsync();

            return Ok();
        }
        else
            return NotFound();
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