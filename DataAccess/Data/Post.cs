using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DataAccess.Data
{
    public class Post: BaseModel
    {
        public Post()
        {
            this.Comments = new HashSet<Comment>();
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required]
        public string PostText { get; set; }

        public virtual ICollection<Comment> Comments { get; set; }
    }
}
