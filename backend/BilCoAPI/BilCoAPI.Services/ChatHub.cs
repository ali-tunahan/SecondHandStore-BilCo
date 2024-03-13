using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using System.Collections.Concurrent;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using BilCoAPI.Core;
using BilCoAPI.Core.Models.Entities;
using BilCoAPI.Core.Models.Entities.Identity;
using Microsoft.EntityFrameworkCore;

//[Authorize]
public class Chat : Hub
{
    protected readonly BilCoDbContext _bilCoDbContext;

    public Chat(BilCoDbContext bilCoDbContext)
    {
        _bilCoDbContext = bilCoDbContext;
    }

    public async Task SendMessageToSpecificUser(string senderUserId, string recieverUserId, string message)
    {
        var messageDTO = new Message(){
            Id = Guid.NewGuid(),
            Text = message,
            SentTime = DateTime.UtcNow,
            SenderUserId = new Guid(senderUserId),
            ReceiverUserId = new Guid(recieverUserId)
        };

        await _bilCoDbContext.Messages.AddAsync(messageDTO);
        await _bilCoDbContext.SaveChangesAsync();

        await Clients.User(recieverUserId).SendAsync("ReceiveMessageBySpecificUser", messageDTO);
    }


    
}





