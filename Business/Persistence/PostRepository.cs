using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Business.Core;
using DataAccess.Data;

namespace Business.Persistence
{
    public class PostRepository: IPostRepository
    {
        private readonly CoreDbContext _coreDbContext;

        public PostRepository(CoreDbContext coreDbContext)
        {
            _coreDbContext = coreDbContext;
        }

        public async Task<Post> CreatePostAsync(Post post)
        {
            var result = await _coreDbContext.Posts.AddAsync(post);
            await _coreDbContext.SaveChangesAsync();
            return result.Entity;
        }
    }
}
