using BilCoAPI.Core.Models.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Core.Models.DTOs
{
    public sealed class UpdateUserDTO
    {
        public Guid Id { get; set; }
        public bool Enabled { get; set; }
        public string? UserName { get; set; }
        public string? Password { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? PhoneNumber { get; set; }

        [NotMapped]
        public byte[]? ProfileImage { get; set; }
    }
}
