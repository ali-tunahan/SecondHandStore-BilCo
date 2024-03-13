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

public interface IUserImageService
{
    Task<UserImage?> GetByIdAsync(Guid id);
    Task CreateAsync(UserImage item);
    Task DeleteAsync(UserImage item);
}