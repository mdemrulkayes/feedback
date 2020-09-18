using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DataAccess.Data
{
    public class CommentVote: BaseModel
    {
        [Key]
        public int Id { get; set; }
        public int CommentId { get; set; }
        public int VoteKeyId { get; set; }

        [ForeignKey("CommentId")]
        public Comment Comment { get; set; }
        [ForeignKey("VoteKeyId")]
        public VoteKey VoteKey { get; set; }
    }
}
