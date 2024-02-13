using FisioWebAPI.Entities;
using FisioWebAPI.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FisioWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CitaController : Controller
    {
        private IConfiguration _config;
        CitaModel mod = new CitaModel();

        public CitaController(IConfiguration config)
        {
            _config = config;
        }

        [HttpPost]
        [Route("RegistrarCita")]
        public ActionResult<CitaOBJ> RegistrarCita([FromBody] CitaOBJ obj)
        {
            try
            {
                return Ok(mod.RegistrarCita(_config, obj));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("ConsultarCita")]
        public ActionResult ConsultarCita(int id_mascota)
        {
            try
            {
                return Ok(mod.ConsultarCita(_config, id_mascota));
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("ConsultarCitas")]
        public ActionResult ConsultarCitas()
        {
            try
            {
                return Ok(mod.ConsultarCitas(_config));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
