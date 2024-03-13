using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Linq.Dynamic.Core;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using BilCoAPI.Core;
using System.Threading;

namespace BilCoAPI.Data.Repositories.Concrete;

public class GenericRepository<TEntity> : IGenericRepository<TEntity> where TEntity : class
{
    protected readonly DbContext _dbContext;

    public GenericRepository(DbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task AddAsync(TEntity entity)
    {
        await _dbContext.Set<TEntity>().AddAsync(entity);
    }

    public async Task AddRangeAsync(IEnumerable<TEntity> entities)
    {
        await _dbContext.Set<TEntity>().AddRangeAsync(entities);
    }

    public async Task<IEnumerable<TEntity>> Get(Expression<Func<TEntity, bool>>? predicate = null, Expression<Func<TEntity, double>>? sortExpression = null, string? sortClause = null, int? startIndex = null, int? itemCount = null, params Expression<Func<TEntity, object>>[] includeProperties)
    {
        var query = _dbContext.Set<TEntity>().AsQueryable();
        
        if (includeProperties != null)
        {
            foreach (var includeProperty in includeProperties)
            {
                query = query.Include(includeProperty);
            }
        }
        if (predicate != null)
        {
            query = query.Where(predicate);
        }
        
        if (sortExpression != null)
        {
            query = query.OrderBy(sortExpression);
        }
        else if (!string.IsNullOrWhiteSpace(sortClause))
        {
            query = query.OrderBy(sortClause);
        }
        if (startIndex != null && startIndex >= 0)
        {
            query = query.Skip(startIndex.Value);
        }
        if (itemCount != null)
        {
            query = query.Take(itemCount.Value);
        }

        return await query.ToListAsync();
    }

    public ValueTask<TEntity> GetByIdAsync(Guid id)
    {
        return _dbContext.Set<TEntity>().FindAsync(id);
    }

    public void Remove(TEntity entity)
    {
        _dbContext.Set<TEntity>().Remove(entity);
    }

    public void Update(TEntity entity)
    {
        _dbContext.Set<TEntity>().Attach(entity);
        _dbContext.Entry<TEntity>(entity).State = EntityState.Modified;
    }

    public void RemoveRange(IEnumerable<TEntity> entities)
    {
        _dbContext.Set<TEntity>().RemoveRange(entities);
    }

    public Task<TEntity> SingleOrDefaultAsync(Expression<Func<TEntity, bool>> predicate)
    {
        return _dbContext.Set<TEntity>().SingleOrDefaultAsync(predicate);
    }

    public async Task<int> CountAsync(Expression<Func<TEntity, bool>>? predicate = null)
    {
        if (predicate == null)
            return await _dbContext.Set<TEntity>().CountAsync();

        return await _dbContext.Set<TEntity>().Where(predicate).CountAsync();
    }
}