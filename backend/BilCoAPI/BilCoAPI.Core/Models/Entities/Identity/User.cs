using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;


namespace BilCoAPI.Core.Models.Entities.Identity
{
    public enum UserType
    {
        User,
        LostandFoundAdmin,
        Organization,
        Admin
    }

    public class User : IdentityUser<Guid>
    {
        public bool Enabled { get; set; } = true;
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public UserType UserType { get; set; } = UserType.User;
        // Navigation property for the single profile image of a user 1:1
        public virtual UserImage? UserImage { get; set; }

        // Navigation property for all posts of a user 1:many
        public virtual ICollection<Post>? Posts { get; set; }

        // Navigation property for the many-to-many relationship with saved posts
        public virtual ICollection<SavedPost>? SavedPosts { get; set; }
        [InverseProperty("User")]
        public virtual ICollection<Comment>? CommentsMade { get; set; }

        // Navigation property for comments directed to the user
        public virtual ICollection<Comment>? CommentsReceived { get; set; }
        public string? RefreshToken { get; set; }
        public DateTime? RefreshTokenExpires { get; set; }
    }
}
