using BilCoAPI.Core.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Core.Models.DTOs
{
    public class CreatePostImageDTO:CreateImageFileDTO
    {
        public int Order { get; set; }
    }
}
