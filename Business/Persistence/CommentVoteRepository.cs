using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Business.Core;
using DataAccess.Data;
using VoteKey = Business.Common.VoteKey;

namespace Business.Persistence
{
    public class CommentVoteRepository : ICommentVoteRepository
    {
        private readonly CoreDbContext _coreDbContext;

        public CommentVoteRepository(CoreDbContext coreDbContext)
        {
            _coreDbContext = coreDbContext;
        }

        public async Task<CommentVote> AddDislike(int commentId)
        {
            var commentDetails = await _coreDbContext.Comments.FindAsync(commentId);
            if (commentDetails != null)
            {
                var result = await _coreDbContext.CommentVotes.AddAsync(new CommentVote()
                {
                    CommentId = commentDetails.Id,
                    VoteKeyId = (int) VoteKey.Dislike, // user id can not be inserted because we are not implementing authentication system
                });
                await _coreDbContext.SaveChangesAsync();
                return result.Entity;
            }

            return null;
        }

        public async Task<CommentVote> AddLike(int commentId)
        {
            var commentDetails = await _coreDbContext.Comments.FindAsync(commentId);
            if (commentDetails != null)
            {
                var result = await _coreDbContext.CommentVotes.AddAsync(new CommentVote()
                {
                    CommentId = commentDetails.Id,
                    VoteKeyId = (int)VoteKey.Like, // user id can not be inserted because we are not implementing authentication system
                });
                await _coreDbContext.SaveChangesAsync();
                return result.Entity;
            }

            return null;
        }
    }
}
