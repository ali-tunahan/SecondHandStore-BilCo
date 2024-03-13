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

public class UserImageService : IUserImageService
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public UserImageService(IUnitOfWork unitOfWork, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    public async Task CreateAsync(UserImage item)
    {
         await _unitOfWork.UserImages.AddAsync(item);
    }

    public async Task DeleteAsync(UserImage item)
    {
        _unitOfWork.UserImages.Remove(item);
    }

    public async Task<UserImage?> GetByIdAsync(Guid id)
    {
         return (await _unitOfWork.UserImages.Get(predicate: p => p.UserId.Equals(id))).FirstOrDefault();
    }
}