using BilCoAPI.Core.Models.Entities.Identity;

namespace BilCoAPI.Core.Models.Entities
{
    public class UserImage : ImageFile
    {
        public Guid UserId { get; set; }
    }
}