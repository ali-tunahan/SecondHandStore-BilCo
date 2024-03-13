using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Data.Repositories.Abstract;

public interface IUnitOfWork : IDisposable
{

    IDemoRepository Demos { get; }
    ICommentRepository Comments { get; }
    IPostRepository Posts { get; }
    ISavedPostRepository SavedPosts { get; }
    IUserImageRepository UserImages { get; }
    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
}