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

public interface IDemoService
{
    Task<IEnumerable<Demo>> Get(Expression<Func<Demo, bool>>? predicate = null, Expression<Func<Demo, double>>? sortExpression = null, string? sortClause = null, int? startCount = null, int? itemCount = null, params Expression<Func<Demo, object>>[] includeProperties);
    Task<int> GetCountAsync(Expression<Func<Demo, bool>>? predicate =null);
    Task<Demo> GetByIdAsync(Guid id);
    Task<Demo> CreateAsync(Demo item);
    Task UpdateAsync(Demo item, Demo itemToBeUpdated);
    Task DeleteAsync(Demo item);
}