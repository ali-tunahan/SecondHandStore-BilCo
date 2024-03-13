using BilCoAPI.Core.Models.Entities;
using BilCoAPI.Core.Models.Entities.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Core.Models.DTOs
{
    public class CommentDTO
    {
        public Guid Id { get; set; }
        public  UserDTO User{ get; set; }
        public string? Text { get; set; }
        public DateTime Created { get; set; }
        public DateTime? Updated { get; set; } // Null if never updated
    }
}
