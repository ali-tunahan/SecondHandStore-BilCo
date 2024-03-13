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

namespace BilCoAPI.Services;

public class DemoService : IDemoService
{
    private readonly IUnitOfWork _unitOfWork;

    public DemoService(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public Task<IEnumerable<Demo>> Get(Expression<Func<Demo, bool>>? predicate = null, Expression<Func<Demo, double>>? sortExpression = null, string? sortClause = null, int? startCount = null, int? itemCount = null, params Expression<Func<Demo, object>>[] includeProperties)
    {
        return _unitOfWork.Demos.Get(predicate:predicate, sortExpression:sortExpression, sortClause: sortClause, startIndex:startCount, itemCount:itemCount,includeProperties:includeProperties);
    }
    public async Task<int> GetCountAsync(Expression<Func<Demo, bool>>? predicate = null)
    {
        return await _unitOfWork.Demos.CountAsync(predicate);
    }

    public async Task<Demo> GetByIdAsync(Guid id)
    {
        return await _unitOfWork.Demos.GetByIdAsync(id);
    }

    public async Task<Demo> CreateAsync(Demo demo)
    {
        demo.Id = Guid.NewGuid();

        await _unitOfWork.Demos.AddAsync(demo);
        await _unitOfWork.SaveChangesAsync();
        return demo;
    }

    public async Task UpdateAsync(Demo demo, Demo demoToBeUpdated)
    {
        demoToBeUpdated.Name = demo.Name;

        await _unitOfWork.SaveChangesAsync();
    }

    public async Task DeleteAsync(Demo demo)
    {
        _unitOfWork.Demos.Remove(demo);

        await _unitOfWork.SaveChangesAsync();
    }
}