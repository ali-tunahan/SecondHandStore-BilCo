namespace BilCoAPI.Core.Models.Entities
{
    public class PostImage : ImageFile
    {
        public int Order { get; set; }
        public Guid PostId { get; set; }
    }
}