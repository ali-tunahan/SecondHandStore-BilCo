using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Core;

public interface IGenericRepository<TEntity> where TEntity : class
{
    ValueTask<TEntity> GetByIdAsync(Guid id);
    Task<IEnumerable<TEntity>> Get(Expression<Func<TEntity, bool>>? predicate = null, Expression<Func<TEntity, double>>? sortExpression = null, string? sortClause = null, int? startIndex = null, int? itemCount = null, params Expression<Func<TEntity, object>>[] includeProperties);
    Task<TEntity> SingleOrDefaultAsync(Expression<Func<TEntity, bool>> predicate);
    Task AddAsync(TEntity entity);
    void Remove(TEntity entity);
    Task<int> CountAsync(Expression<Func<TEntity, bool>>? predicate=null);
}