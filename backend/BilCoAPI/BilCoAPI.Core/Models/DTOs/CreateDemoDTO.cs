using BilCoAPI.Core.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Core.Models.DTOs
{
    public class CreateDemoDTO
    {
        public string? Name { get; set; }
        public Guid? ParentId { get; set; }
    }
}
