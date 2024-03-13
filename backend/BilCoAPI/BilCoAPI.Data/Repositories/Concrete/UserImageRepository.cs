using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BilCoAPI.Core;
using BilCoAPI.Core.Models.Entities;
using BilCoAPI.Core.Models.Entities.Identity;
using BilCoAPI.Data.Repositories.Abstract;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace BilCoAPI.Data.Repositories.Concrete;

public class UserImageRepository : GenericRepository<UserImage>, IUserImageRepository
{
    public UserImageRepository(BilCoDbContext dbContext) : base(dbContext)
    {
    }
}