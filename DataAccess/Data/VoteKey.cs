using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace DataAccess.Data
{
    public class VoteKey
    {
        [Key]
        public int Id { get; set; }
        public string Key { get; set; }
    }
}
