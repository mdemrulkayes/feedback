using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Business.Core;
using DataAccess.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FeedbackSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : ControllerBase
    {
        private readonly ICommentRepository _commentRepository;

        public CommentController(ICommentRepository commentRepository)
        {
            _commentRepository = commentRepository;
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] Comment comment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            return Ok(await _commentRepository.CreateCommentAsync(comment));
        }

        [HttpGet]
        public async Task<IActionResult> Get([FromQuery]int pageNumber = 1, [FromQuery] int pageSize = 10, [FromQuery] string post = null)
        {
            try
            {
                var data = await _commentRepository.GetAllCommentsAsync(pageNumber, pageSize, post);
               return Ok(data);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
            
        }
    }
}
