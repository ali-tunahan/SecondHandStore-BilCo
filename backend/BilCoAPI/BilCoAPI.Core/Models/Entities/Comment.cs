using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BilCoAPI.Core.Models.Entities.Identity;

namespace BilCoAPI.Core.Models.Entities
{
    public class Comment
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public virtual User? User { get; set; }
        public Guid CommentedToUserId { get; set; }
        public virtual User CommentedToUser { get; set; }
        public string? Text { get; set; }
        public DateTime Created { get; set; }
        public DateTime? Updated { get; set; } // Null if never updated
    }
}
