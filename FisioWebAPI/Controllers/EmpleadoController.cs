using FisioWebAPI.Model;
using Microsoft.AspNetCore.Mvc;

namespace FisioWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmpleadoController : Controller
    {
        private IConfiguration _config;
        EmpleadoModel modelEmpleado = new EmpleadoModel();

        public EmpleadoController(IConfiguration config)
        {
            _config = config;
        }


        [HttpPost]
        [Route("RegistrarEmpleado")]
        public ActionResult<EmpleadoOBJ> RegistrarEmpleado([FromBody] EmpleadoOBJ obj)
        {
            try
            {
                return Ok(modelEmpleado.RegistrarEmpleado(_config, obj));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("ConsultarEmpleadoPorCorreo")]
        public ActionResult<List<ClienteUsuarioOBJ>> ConsultarEmpleadoPorCorreo(string correo_usuario)
        {
            try
            {
                return Ok(modelEmpleado.ConsultarEmpleadoPorCorreo(_config, correo_usuario));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


    }
}
