using BilCoAPI.Core.Models.Entities;
using BilCoAPI.Core.Models.Entities.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Core.Models.DTOs
{
    public class SavedPostDTO
    {
        public Guid Id { get; set; }
        public Post Post { get; set; }
    }
}
