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
using Azure.Storage.Blobs;
using Swashbuckle.AspNetCore.Annotations;
using Swashbuckle.AspNetCore.Filters;
using System.Diagnostics;
using BilCoAPI.Utility;
using Binbin.Linq;

namespace BilCoAPI.Controllers;

[ApiController]
[Route("posts")]
public class PostController : Controller
{
    private readonly IPostService _service;
    private readonly IMapper _mapper;

    public PostController(
        IPostService service, IMapper mapper)
    {
        _service = service;
        _mapper = mapper;
    }
    [HttpGet]
    public async Task<IEnumerable<PostDTO>?> Get()
    {
        var items = await _service.Get();

        //map items to itemDTOS
        var itemDTOS = _mapper.Map<IEnumerable<PostDTO>>(items);

        return itemDTOS;
    }

    [HttpGet("Fuzzy")]
    public async Task<ListingResponse<PostDTO>> Get(Guid? UserId, int? startIndex = 0, int? count= null, string? tags = null, int? minPrice =null, int? maxPrice = null, string? searchTitle = null, int? postType = null, int? lostItemState = null)
    {
        var predicate = PredicateBuilder.True<Post>();

        if (tags != null)
        {
            predicate = PredicateBuilder.False<Post>();
            var tagsToMatch = tags.Split(',').Select(p => p.Trim()).ToList();

            // Select Notes that contain any search Tags
            foreach (var searchTag in tagsToMatch)
            {
                var tag = searchTag;
                predicate = predicate.Or(post => post.Tags != null && post.Tags.Contains(tag));
            }
            
        }

        if (postType != null)
            predicate = predicate.And(post => post.PostType.Equals(postType));

        if (UserId != null)
            predicate = predicate.And(post => post.UserId.Equals(UserId));

        if(minPrice != null)
            predicate = predicate.And(post => post.Price != null && post.Price >= minPrice);
        if (maxPrice != null)
            predicate = predicate.And(post => post.Price != null && post.Price <= maxPrice);
        if (lostItemState != null)
            predicate = predicate.And(post => post.LostItemState != null && post.LostItemState == lostItemState);

        // join with PostImages table with includes and include the image where order == 0 as a thumbnail
        var includes = new Expression<Func<Post, object>>[] { p => p.PostImages.Where(pi => pi.Order == 0) };

        IEnumerable<Post> items;
        if (searchTitle != null)
        {
            double minimumSimilarity = 0.1;
            predicate = predicate.And(p => EF.Functions.TrigramsSimilarity(p.Title, searchTitle) >= minimumSimilarity);
            
            // Sort on similarity
            items = await _service.Get(predicate: predicate, sortExpression:p => EF.Functions.TrigramsSimilarityDistance(p.Title, searchTitle), includeProperties: includes, startIndex: startIndex, itemCount: count);
        }
        else
        {
            // Sort on created date by default
            items = await _service.Get(predicate: predicate, sortClause: "Created DESC", includeProperties: includes, startIndex: startIndex, itemCount: count);
        }
        int totalCount = await _service.GetCountAsync(predicate: predicate);
        
        //map items to itemDTOS
        var itemDTOS = _mapper.Map<IEnumerable<PostDTO>>(items);
        
        return 
            new ListingResponse<PostDTO>
            {
                Data = itemDTOS,
                TotalCount = totalCount,
                StartIndex = startIndex,
                DataCount = itemDTOS.Count(),
            };
    }

    [HttpGet("{id}")]
    public async Task<PostDetailsDTO?> GetDetailed(Guid id)
    {
        var item = await _service.GetDetailedByIdAsync(id);
        if (item != null)
        {
            //map item to itemDTO
            var itemDTO = _mapper.Map<PostDetailsDTO>(item);

            return itemDTO;
        }
        else
            throw new Exception("Not Found");
    }

    [HttpPost]
    //consumes multipart formdata

    public async Task<Post?> Post([FromBody] CreatePostDTO itemDTO)
    {
        //map dto to item
        var item =new Post();

        //Additional properties that should be set after the mapping such as Id and created DateTime
        item.Id = Guid.NewGuid();
        item.Created = DateTime.UtcNow;
        item.Active = true;
        item.UserId = itemDTO.UserId;
        item.Title = itemDTO.Title;
        item.Price = itemDTO.Price;
        item.PostType = itemDTO.PostType;
        item.Tags = itemDTO.Tags;
        item.Body = itemDTO.Body;
        item.LostItemState = itemDTO.LostItemState;
        item.Location = itemDTO.Location;
        item.BorrowDay = itemDTO.BorrowDay;
        
        var images = new List<PostImage>();
        if (itemDTO.PostImages != null)
        {
            int i = 0;
            foreach (var image in itemDTO.PostImages)
            {
                images.Add(new PostImage
                {
                    Id = Guid.NewGuid(),
                    ImageUrl = await BlobUtility.UploadImageAsync(image),
                    Order = i,
                    PostId = item.Id,
                });
                i++;
            }
        }
        
        item.PostImages = images;

        return await _service.CreateAsync(item);
    }


    [HttpPut("{id}")]
    public async Task<IActionResult> Put(Guid id, [FromBody] UpdatePostDTO itemDTO)
    {
        var itemToBeUpdated = await _service.GetDetailedByIdAsync(id);
        var oldImages = itemToBeUpdated.PostImages;
        if (itemToBeUpdated != null)
        {
            DateTime created = itemToBeUpdated.Created ?? DateTime.UtcNow;
            _mapper.Map(itemDTO,itemToBeUpdated);

            itemToBeUpdated.LostItemState = itemDTO.LostItemState;

            if (itemDTO.PostImages != null)
            {
                var images = new List<PostImage>();

                // Delete all existing images
                foreach (var image in itemToBeUpdated.PostImages)
                {
                    await BlobUtility.DeleteImageAsync(image.ImageUrl);
                }

                // Add all new
                int i = 0;
                foreach (var image in itemDTO.PostImages)
                {
                    images.Add(new PostImage
                    {
                        Id = Guid.NewGuid(),
                        ImageUrl = await BlobUtility.UploadImageAsync(image),
                        Order = i,
                        PostId = itemToBeUpdated.Id,
                    });
                    i++;
                }
                itemToBeUpdated.PostImages = images;
            }
            else
            {
                itemToBeUpdated.PostImages = oldImages;
            }

            itemToBeUpdated.Id = id;
            itemToBeUpdated.Created = created;

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
            var item = await _service.GetDetailedByIdAsync(id);

            foreach(var image in item.PostImages)
            {
                await BlobUtility.DeleteImageAsync(image.ImageUrl);
            }

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