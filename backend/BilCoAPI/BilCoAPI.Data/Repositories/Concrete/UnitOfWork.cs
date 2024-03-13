using BilCoAPI.Data.Repositories.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BilCoAPI.Core;

namespace BilCoAPI.Data.Repositories.Concrete;

public class UnitOfWork : IUnitOfWork
{
    private readonly BilCoDbContext _context;

    private DemoRepository _demoRepository;
    private CommentRepository _commentRepository;
    private PostRepository _postRepository;
    private SavedPostRepository _savedPostRepository;
    private UserImageRepository _userImageRepository;
    public IDemoRepository Demos => _demoRepository;
    public ICommentRepository Comments => _commentRepository;
    public IPostRepository Posts => _postRepository;
    public ISavedPostRepository SavedPosts => _savedPostRepository;
    public IUserImageRepository UserImages => _userImageRepository;

    public UnitOfWork(BilCoDbContext context)
    {
        _context = context;

        _demoRepository = new DemoRepository(_context);
        _commentRepository = new CommentRepository(_context);
        _postRepository = new PostRepository(_context);
        _savedPostRepository = new SavedPostRepository(_context);
        _userImageRepository = new UserImageRepository(_context);
    }

    public async Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        return await _context.SaveChangesAsync(cancellationToken);
    }
    public void Dispose()
    {
        _context.Dispose();
    }   
}