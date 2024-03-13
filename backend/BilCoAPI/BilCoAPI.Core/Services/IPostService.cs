using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using BilCoAPI.Core.Models.Entities;
using Microsoft.EntityFrameworkCore;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace BilCoAPI.Core.Services;

public interface IPostService
{
    Task<IEnumerable<Post>> Get(Expression<Func<Post, bool>>? predicate = null, Expression<Func<Post, double>>? sortExpression = null, string? sortClause = null, int? startIndex = null, int? itemCount = null, params Expression<Func<Post, object>>[] includeProperties);
    Task<int> GetCountAsync(Expression<Func<Post, bool>>? predicate =null);
    Task<Post?> GetDetailedByIdAsync(Guid id);
    Task<Post?> GetByIdAsync(Guid id);
    Task<Post> CreateAsync(Post item);
    Task UpdateAsync();
    Task DeleteAsync(Post item);
}