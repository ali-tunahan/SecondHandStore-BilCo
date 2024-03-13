using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BilCoAPI.Core.Models.Entities.Identity;

namespace BilCoAPI.Core.Models.Entities
{
    public class Message
    {
        public Guid Id { get; set; }
        public Guid SenderUserId { get; set; }
        //public virtual User SenderUser { get; set; }
        public Guid ReceiverUserId { get; set; }
        //public virtual User ReceiverUser { get; set; }
        public string Text { get; set; }
        public DateTime SentTime { get; set; }
    }
}
