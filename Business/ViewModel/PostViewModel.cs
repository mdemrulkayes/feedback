using System;
using System.Collections.Generic;
using System.Text;

namespace Business.ViewModel
{
    public class PostViewModel
    {
        public string PostText { get; set; }
        public List<CommentViewModel> Comments { get;set; }
    }
}
