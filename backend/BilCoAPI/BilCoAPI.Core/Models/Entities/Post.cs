using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BilCoAPI.Core.Models.Entities.Identity;

namespace BilCoAPI.Core.Models.Entities
{
    public class Post
    {
        public Guid Id { get; set; }
        public bool Active { get; set; }
        public int PostType { get; set; } = 0; 
        public int? Price { get; set; }
        public Guid UserId { get; set; }
        public virtual User User { get; set; }
        public string? Tags { get; set; }
        public string Title { get; set; }
        public string? Body { get; set; }
        public virtual ICollection<PostImage>? PostImages { get; set; }
        public DateTime? Created { get; set; }
        public int? LostItemState { get; set; }// 0:pending 1:accepted 2:rejected | complete
        public String? Location { get; set; }
        public int? BorrowDay { get; set; }
    }
}
