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
[Route("demos")]
public class DemoController : Controller
{
    private readonly IDemoService _service;
    private readonly IMapper _mapper;

    public DemoController(
        IDemoService service, IMapper mapper)
    {
        _service = service;
        _mapper = mapper;
    }

    [Authorize]
    [HttpGet]
    public async Task<IActionResult> Get()
    {
        var items = await _service.Get();

        //map items to itemDTOS
        var itemDTOS = _mapper.Map<IEnumerable<DemoDTO>>(items);

        return Ok(itemDTOS);
    }

    [HttpGet("Fuzzy")]  
    public async Task<IActionResult> Get(string searchTerm, int? startIndex = null, int? count= null, double minimumSimilarity = 0.1)
    {
        var items = await _service.Get(predicate:p =>EF.Functions.TrigramsSimilarity(p.Name,searchTerm)>= minimumSimilarity, sortExpression: p=>EF.Functions.TrigramsSimilarityDistance(p.Name,searchTerm), startCount:startIndex,itemCount:count);
        var totalCount = await _service.GetCountAsync(predicate:p =>EF.Functions.TrigramsSimilarity(p.Name,searchTerm)>= minimumSimilarity);

        //map items to itemDTOS
        var itemDTOS = _mapper.Map<IEnumerable<DemoDTO>>(items);
        

        return Ok(
            new ListingResponse<DemoDTO>
            {
                Data = itemDTOS,
                TotalCount = totalCount,
                StartIndex = startIndex,
                DataCount = itemDTOS.Count(),
            }
            );
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> Get(Guid id)
    {
        var item = await _service.GetByIdAsync(id);
        if (item != null)
        {
            //map item to itemDTO
            var itemDTO = _mapper.Map<DemoDTO>(item);

            return Ok(itemDTO);
        }
        else
            return NotFound();
    }

    [HttpPost]
    public async Task<IActionResult> Post([FromBody] CreateDemoDTO itemDTO)
    {
        //map dto to item
        var item = _mapper.Map<Demo>(itemDTO);

        //Additional properties that should be set after the mapping such as Id and created DateTime
        item.Id = Guid.NewGuid();
        item.Created = DateTime.UtcNow;

        return Ok(await _service.CreateAsync(item));
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Put(Guid id, [FromBody] CreateDemoDTO itemDTO)
    {
        var itemToBeUpdated = await _service.GetByIdAsync(id);
        if (itemToBeUpdated != null)
        {
            var item = _mapper.Map<Demo>(itemDTO);

            await _service.UpdateAsync(item, itemToBeUpdated);

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