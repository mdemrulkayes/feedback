using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using DataAccess.Data;

namespace Business.Core
{
    public interface IPostRepository
    {
        Task<Post> CreatePostAsync(Post post);
    }
}
