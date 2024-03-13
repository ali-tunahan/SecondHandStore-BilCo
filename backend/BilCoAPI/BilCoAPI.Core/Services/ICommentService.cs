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

public interface ICommentService
{
    Task<IEnumerable<Comment>> Get(Expression<Func<Comment, bool>>? predicate = null, Expression<Func<Comment, double>>? sortExpression = null, string? sortClause = null, int? startCount = null, int? itemCount = null, params Expression<Func<Comment, object>>[] includeProperties);
    Task<int> GetCountAsync(Expression<Func<Comment, bool>>? predicate =null);
    Task<Comment> GetByIdAsync(Guid id);
    Task<Comment> CreateAsync(Comment item);
    Task UpdateAsync();
    Task DeleteAsync(Comment item);
}