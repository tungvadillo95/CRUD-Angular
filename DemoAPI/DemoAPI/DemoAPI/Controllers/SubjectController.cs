using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Demo.DAL.Interface;
using Demo.Domain.Request.Subject;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DemoAPI.Controllers
{
    [ApiController]
    public class SubjectController : ControllerBase
    {
        private readonly ISubjectRepository subjectRepository;

        public SubjectController(ISubjectRepository subjectRepository)
        {
            this.subjectRepository = subjectRepository;
        }
        [HttpGet("api/subject/gets")]
        public async Task<OkObjectResult> Gets()
        {
            var subjects = await subjectRepository.Gets();
            return Ok(subjects);
        }
        [HttpGet("api/subject/get/{id}")]
        public async Task<OkObjectResult> Get(int id)
        {
            var subject = await subjectRepository.Get(id);
            return Ok(subject);
        }
        [HttpPost]
        [Route("api/subject/save")]
        public async Task<OkObjectResult> SaveCourse(SaveSubjectReq request)
        {
            var result = await subjectRepository.Save(request);
            return Ok(result);
        }
        [HttpPatch]
        [Route("api/subject/deleted/{id}")]
        public async Task<OkObjectResult> Deleted(int id)
        {
            var result = await subjectRepository.Deleted(id);
            return Ok(result);
        }
    }
}
