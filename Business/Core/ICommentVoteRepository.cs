using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using DataAccess.Data;

namespace Business.Core
{
    public interface ICommentVoteRepository
    {
        Task<CommentVote> AddLike(int commentId);
        Task<CommentVote> AddDislike(int commentId);
    }
}
