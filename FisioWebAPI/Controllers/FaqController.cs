using FisioWebAPI.Model;
using Microsoft.AspNetCore.Mvc;

namespace FisioWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FaqController : ControllerBase
    {
            private IConfiguration _config;
            FaqModel faq = new FaqModel();

            public FaqController(IConfiguration config)
            {
                _config = config;
            }


            [HttpGet]
            [Route("ConsultarFAQ")]
            public ActionResult<List<FaqObj>> ConsultarFAQ()
            {
                try
                {
                    return Ok(faq.ConsultarFAQ(_config));
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }
            }


        [HttpGet]
        [Route("ConsultarFaqPorId")]
        public ActionResult<List<FaqObj>> ConsultarServicio(int id_ayuda)
        {
            try
            {
                return Ok(faq.ConsultarFaqPorId(_config, id_ayuda));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost]
            [Route("RegistrarFAQ")]
            public ActionResult<FaqObj> RegistrarFAQ([FromBody] FaqObj obj)
            {
                try
                {
                    return Ok(faq.RegistrarFAQ(_config, obj));
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }
            }

            [HttpPut]
            [Route("ActualizarFAQ")]
            public ActionResult<FaqObj> ActualizarFAQ(FaqObj obj)
            {
                try
                {
                    return Ok(faq.ActualizarFAQ(_config, obj));
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }
            }

            [HttpDelete]
            [Route("BorrarFAQ")]
            public ActionResult<FaqObj> BorrarFAQ(int id_ayuda)
            {
                try
                {
                    return Ok(faq.BorrarFAQ(_config, id_ayuda));
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }
            }



        }
}
