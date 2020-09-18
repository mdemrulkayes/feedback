using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Data
{
    public class BaseModel
    {
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public string CreatedBy { get; set; }
    }
}
