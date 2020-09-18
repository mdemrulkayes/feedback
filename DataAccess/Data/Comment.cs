using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DataAccess.Data
{
   public class Comment: BaseModel
    {
        public Comment()
        {
            this.CommentVotes = new HashSet<CommentVote>();
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required]
        public int PostId { get; set; }
        [Required]
        public string CommentText { get; set; }
        
        [ForeignKey("PostId")]
        public Post Post { get; set; }
        
        public virtual ICollection<CommentVote> CommentVotes { get; set; }
    }
}
