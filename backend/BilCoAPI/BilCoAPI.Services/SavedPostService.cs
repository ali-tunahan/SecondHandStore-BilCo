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

public class SavedPostService : ISavedPostService
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public SavedPostService(IUnitOfWork unitOfWork, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    public Task<IEnumerable<SavedPost>> Get(Expression<Func<SavedPost, bool>>? predicate = null,
        Expression<Func<SavedPost, double>>? sortExpression = null, string? sortClause = null, int? startCount = null,
        int? itemCount = null, params Expression<Func<SavedPost, object>>[] includeProperties)
    {
        return _unitOfWork.SavedPosts.Get(predicate:predicate, sortExpression:sortExpression, sortClause: sortClause, startIndex:startCount, itemCount:itemCount,includeProperties:includeProperties);
    }

    public async Task<int> GetCountAsync(Expression<Func<SavedPost, bool>>? predicate = null)
    {
        return await _unitOfWork.SavedPosts.CountAsync(predicate);
    }

    public async Task<SavedPost?> GetByIdAsync(Guid id)
    {
        return await _unitOfWork.SavedPosts.GetByIdAsync(id);
    }

    public async Task<SavedPost> CreateAsync(SavedPost item)
    {
        item.Id = Guid.NewGuid();

        await _unitOfWork.SavedPosts.AddAsync(item);
        await _unitOfWork.SaveChangesAsync();
        return item;
    }

    public async Task UpdateAsync()
    {
        await _unitOfWork.SaveChangesAsync();
    }

    public async Task DeleteAsync(SavedPost item)
    {
        _unitOfWork.SavedPosts.Remove(item);

        await _unitOfWork.SaveChangesAsync();
    }
}