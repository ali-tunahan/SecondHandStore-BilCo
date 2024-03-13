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

public class CommentService : ICommentService
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public CommentService(IUnitOfWork unitOfWork, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    public Task<IEnumerable<Comment>> Get(Expression<Func<Comment, bool>>? predicate = null, Expression<Func<Comment, double>>? sortExpression = null, string? sortClause = null, int? startCount = null, int? itemCount = null, params Expression<Func<Comment, object>>[] includeProperties)
    {
        return _unitOfWork.Comments.Get(predicate:predicate, sortExpression:sortExpression, sortClause: sortClause, startIndex:startCount, itemCount:itemCount,includeProperties:includeProperties);
    }
    public async Task<int> GetCountAsync(Expression<Func<Comment, bool>>? predicate = null)
    {
        return await _unitOfWork.Comments.CountAsync(predicate);
    }

    public async Task<Comment> GetByIdAsync(Guid id)
    {
        return await _unitOfWork.Comments.GetByIdAsync(id);
    }

    public async Task<Comment> CreateAsync(Comment item)
    {
        item.Id = Guid.NewGuid();

        await _unitOfWork.Comments.AddAsync(item);
        await _unitOfWork.SaveChangesAsync();
        return item;
    }

    public async Task UpdateAsync()
    {
        await _unitOfWork.SaveChangesAsync();
    }

    public async Task DeleteAsync(Comment item)
    {
        _unitOfWork.Comments.Remove(item);

        await _unitOfWork.SaveChangesAsync();
    }
}