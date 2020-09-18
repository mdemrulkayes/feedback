using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Core;
using Business.ViewModel;
using DataAccess.Data;
using Microsoft.EntityFrameworkCore;
using VoteKey = Business.Common.VoteKey;

namespace Business.Persistence
{
    public class CommentRepository : ICommentRepository
    {
        private readonly CoreDbContext _coreDbContext;

        public CommentRepository(CoreDbContext coreDbContext)
        {
            _coreDbContext = coreDbContext;
        }

        public async Task<Comment> CreateCommentAsync(Comment comment)
        {
            var result = await _coreDbContext.Comments.AddAsync(comment);
            await _coreDbContext.SaveChangesAsync();
            return result.Entity;
        }

        public async Task<IEnumerable<PostViewModel>> GetAllCommentsAsync(int pageNumber, int pageSize, string post)
        {
            var data = new List<PostViewModel>();
            var query = await _coreDbContext.Comments
                .Include(x => x.Post)
                .Include(x => x.CommentVotes)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            if (!string.IsNullOrEmpty(post))
            {
                query = await _coreDbContext.Comments
                    .Where(x => x.Post.PostText.Contains(post))
                    .Include(x => x.Post)
                    .Include(x => x.CommentVotes)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToListAsync();
            }

            var groupedResult = query.GroupBy(x => x.Post.PostText).Select(x => new 
            {
                PostText = x.Key,
                Comments = x.ToList()
            });

            foreach (var commentGroup in groupedResult)
            {
                var allComments = new List<CommentViewModel>();
                foreach (var comment in commentGroup.Comments)
                {
                    
                    allComments.Add(new CommentViewModel()
                    {
                        Id = comment.Id,
                        PostId = comment.PostId,
                        CommentText = comment.CommentText,
                        CreatedAt = comment.CreatedAt,
                        CreatedBy = comment.CreatedBy,
                        TotalDislike = comment.CommentVotes.Count(x => x.VoteKeyId == (int)VoteKey.Dislike),
                        TotalLike = comment.CommentVotes.Count(x => x.VoteKeyId == (int)VoteKey.Like)
                    });
                }

                data.Add(new PostViewModel()
                {
                    PostText = commentGroup.PostText,
                    Comments = allComments
                });
            }

            return data;
        }
    }
}
