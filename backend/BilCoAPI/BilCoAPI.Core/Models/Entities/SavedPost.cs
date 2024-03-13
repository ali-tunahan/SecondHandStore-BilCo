using BilCoAPI.Core.Models.Entities.Identity;

namespace BilCoAPI.Core.Models.Entities
{
    public class SavedPost
    {
        public Guid Id { get; set; }
        public Guid PostId { get; set; }
        public virtual Post Post { get; set; }
        public Guid UserId { get; set; }
        public virtual User User { get; set; }
    }
}