using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using FisioWebAPI.Entities;
using FisioWebAPI.Model;
using MimeKit;

namespace FisioWebAPI.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class CorreoController : ControllerBase
    {
        private readonly IEmailService _emailService; 
       
        public CorreoController (IEmailService emailService)
        {
            _emailService = emailService;
        }

        //========================================================
        //LLamamos el IEmailService para enviar un correo
        [HttpPost]

        public IActionResult sendEmail(CorreoObj request)
        {
            _emailService.sendEmail(request);
            return Ok();
        }


    }
}
