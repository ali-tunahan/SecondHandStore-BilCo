﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using BilCoAPI.Core.Models.Entities;
using Microsoft.EntityFrameworkCore;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace BilCoAPI.Core.Services;

public interface ISavedPostService
{
    Task<IEnumerable<SavedPost>> Get(Expression<Func<SavedPost, bool>>? predicate = null, Expression<Func<SavedPost, double>>? sortExpression = null, string? sortClause = null, int? startCount = null, int? itemCount = null, params Expression<Func<SavedPost, object>>[] includeProperties);
    Task<int> GetCountAsync(Expression<Func<SavedPost, bool>>? predicate =null);
    Task<SavedPost?> GetByIdAsync(Guid id);
    Task<SavedPost> CreateAsync(SavedPost item);
    Task UpdateAsync();
    Task DeleteAsync(SavedPost item);
}