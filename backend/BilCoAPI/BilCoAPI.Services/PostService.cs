using BilCoAPI.Data.Repositories.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using BilCoAPI.Core.Services;
using BilCoAPI.Core.Models.Entities;
using Microsoft.EntityFrameworkCore;
using AutoMapper;

namespace BilCoAPI.Services;

public class PostService : IPostService
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public PostService(IUnitOfWork unitOfWork, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    public Task<IEnumerable<Post>> Get(Expression<Func<Post, bool>>? predicate = null,
        Expression<Func<Post, double>>? sortExpression = null, string? sortClause = null, int? startIndex = null,
        int? itemCount = null, params Expression<Func<Post, object>>[] includeProperties)
    {
        return _unitOfWork.Posts.Get(predicate:predicate, sortExpression:sortExpression, sortClause: sortClause, startIndex:startIndex, itemCount:itemCount,includeProperties:includeProperties);
    }

    public async Task<int> GetCountAsync(Expression<Func<Post, bool>>? predicate = null)
    {
        return await _unitOfWork.Posts.CountAsync(predicate);
    }

    public async Task<Post?> GetDetailedByIdAsync(Guid id)
    {
        Expression<Func<Post, object>>[] includeProperties = {
            p => p.PostImages,
            p => p.User,
        };
        return  (await _unitOfWork.Posts.Get(predicate: p => p.Id.Equals(id), includeProperties: includeProperties)).FirstOrDefault();
    }

    public async Task<Post?> GetByIdAsync(Guid id)
    {
        return await _unitOfWork.Posts.GetByIdAsync(id);
    }

    public async Task<Post> CreateAsync(Post item)
    {
        item.Id = Guid.NewGuid();

        await _unitOfWork.Posts.AddAsync(item);
        await _unitOfWork.SaveChangesAsync();
        return item;
    }

    public async Task UpdateAsync()
    {
        await _unitOfWork.SaveChangesAsync();
    }

    public async Task DeleteAsync(Post item)
    {
        _unitOfWork.Posts.Remove(item);

        await _unitOfWork.SaveChangesAsync();
    }
}