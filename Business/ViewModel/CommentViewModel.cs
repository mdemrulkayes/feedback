using System;
using System.Collections.Generic;
using System.Text;
using DataAccess.Data;

namespace Business.ViewModel
{
    public class CommentViewModel
    {
        public int Id { get; set; }
        public int PostId { get; set; }
        public string CommentText { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public int TotalLike { get; set; }
        public int TotalDislike { get; set; }
    }
}
