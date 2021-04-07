using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Demo.DAL.Interface;
using Demo.Domain.Request.User;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DemoAPI.Controllers
{
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository userRepository;

        public UserController(IUserRepository userRepository)
        {
            this.userRepository = userRepository;
        }
        [HttpGet("api/user/gets")]
        public async Task<OkObjectResult> Gets()
        {
            var users = await userRepository.Gets();
            return Ok(users);
        }
        [HttpGet("api/user/get/{id}")]
        public async Task<OkObjectResult> Get(int id)
        {
            var user = await userRepository.Get(id);
            return Ok(user);
        }
        [HttpPost]
        [Route("api/user/save")]
        public async Task<OkObjectResult> SaveCourse(SaveUserReq request)
        {
            var result = await userRepository.Save(request);
            return Ok(result);
        }
    }
}
