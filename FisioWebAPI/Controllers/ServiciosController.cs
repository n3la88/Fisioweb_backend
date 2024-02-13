using FisioWebAPI.Model;
using Microsoft.AspNetCore.Mvc;

namespace FisioWebAPI.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class ServiciosController : ControllerBase
    {
        private IConfiguration _config;
        ServiciosModel servicios = new ServiciosModel();

        public ServiciosController(IConfiguration config)
        {
            _config = config;
        }


        [HttpGet]
        [Route("ConsultarServicios")]
        public ActionResult<List<ServiciosObj>> ConsultarSerivicios()
        {
            try
            {
                return Ok(servicios.ConsultarServicios(_config));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("ConsultarServicioPorId")]
        public ActionResult<List<ServiciosObj>> ConsultarServicio(int id_servicio)
        {
            try
            {
                return Ok(servicios.ConsultarServicioPorId(_config, id_servicio));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost]
        [Route("RegistrarServicio")]
        public ActionResult<ServiciosObj> RegistrarUsuario([FromBody] ServiciosObj obj)
        {
            try
            {
                return Ok(servicios.RegistrarServicio(_config, obj));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        [Route("ActualizarServicio")]
        public ActionResult<ServiciosObj> ActualizarServicio(ServiciosObj obj)
        {
            try
            {
                return Ok(servicios.ActualizarServicio(_config, obj));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete]
        [Route("BorrarServicio")]
        public ActionResult<ServiciosObj> BorrarServicio(int id_servicio)
        {
            try
            {
                return Ok(servicios.BorrarServicio(_config, id_servicio));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }



    }
}
