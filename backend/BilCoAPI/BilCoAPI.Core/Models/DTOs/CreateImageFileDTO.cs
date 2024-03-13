using BilCoAPI.Core.Models.Entities;
using BilCoAPI.Core.Models.Entities.Identity;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Core.Models.DTOs
{
    public class CreateImageFileDTO
    {
        [NotMapped]
        public String ImageUrl { get; set; }
    }
}
