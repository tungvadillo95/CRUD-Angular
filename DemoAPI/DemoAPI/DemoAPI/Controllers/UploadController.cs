using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DemoAPI.Controllers
{
    [ApiController]
    public class UploadController : ControllerBase
    {
        private readonly IHttpContextAccessor contextAccessor;

        public UploadController(IHttpContextAccessor contextAccessor)
        {
            this.contextAccessor = contextAccessor;
        }
        [Route("api/upload/SaveFile")]
        [HttpPost]
        public string SaveFile()
        {
            try
            {
                var httpRequest = contextAccessor.HttpContext.Request.Form;
                var postedFile = httpRequest.Files[0];
                string filename = postedFile.FileName;
                return filename;
            }
            catch (Exception)
            {

                return "anonymous.png";
            }
        }
    }
}
