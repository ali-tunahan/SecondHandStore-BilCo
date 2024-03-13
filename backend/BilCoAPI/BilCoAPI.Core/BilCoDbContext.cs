using BilCoAPI.Core.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BilCoAPI.Core.Models.Entities.Identity;
using BilCoAPI.Core.Models.DTOs;
using BilCoAPI.Core.Models.Entities;

namespace BilCoAPI.Core;

public partial class BilCoDbContext : IdentityDbContext<User, Role, Guid>
{
    public BilCoDbContext(DbContextOptions<BilCoDbContext> options) : base(options)
    {
    }

    public DbSet<Demo> Demos { get; set; }

    // Entities
    public DbSet<Post> Posts { get; set; }
    public DbSet<Comment> Comments { get; set; }
    public DbSet<PostImage> PostImages { get; set; }
    public DbSet<UserImage> UserImages { get; set; }
    public DbSet<SavedPost> SavedPosts { get; set; }
    public DbSet<Message> Messages { get; set; }

}