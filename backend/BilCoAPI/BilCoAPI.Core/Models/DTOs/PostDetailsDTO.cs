using BilCoAPI.Core.Models.Entities;
using BilCoAPI.Core.Models.Entities.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Core.Models.DTOs
{
    public class PostDetailsDTO
    {
        public Guid Id { get; set; }
        public bool Active { get; set; }
        public int PostType { get; set; }
        public int? Price { get; set; }
        public string? Tags { get; set; }
        public string Title { get; set; }
        public string? Body { get; set; }
        public ICollection<PostImage>? PostImages { get; set; }
        // Navigation property for the one-to-many relationship with comments
        public ICollection<CommentDTO>? Comments { get; set; }
        public Guid UserId { get; set; }
        public DateTime? Created { get; set; }
        public int? LostItemState { get; set; }// 0:pending 1:accepted 2:rejected | complete
        public String? Location { get; set; }
        public int? BorrowDay { get; set; }
    }
}
