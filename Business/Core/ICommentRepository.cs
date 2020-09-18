using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Business.ViewModel;
using DataAccess.Data;

namespace Business.Core
{
    public interface ICommentRepository
    {
        Task<Comment> CreateCommentAsync(Comment comment);
        Task<IEnumerable<PostViewModel>> GetAllCommentsAsync(int pageNumber, int pageSize, string post);
    }
}
