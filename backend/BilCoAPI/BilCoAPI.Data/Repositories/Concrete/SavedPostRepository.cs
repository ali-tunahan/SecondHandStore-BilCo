using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BilCoAPI.Core;
using BilCoAPI.Core.Models.Entities;
using BilCoAPI.Data.Repositories.Abstract;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace BilCoAPI.Data.Repositories.Concrete;

public class SavedPostRepository : GenericRepository<SavedPost>, ISavedPostRepository
{
    public SavedPostRepository(BilCoDbContext dbContext) : base(dbContext)
    {
    }
}