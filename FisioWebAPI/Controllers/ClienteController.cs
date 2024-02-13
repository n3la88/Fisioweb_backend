using FisioWebAPI.Entities;
using FisioWebAPI.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FisioWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClienteController : ControllerBase
    {
        private IConfiguration _config;
        ClienteModel mod = new ClienteModel();

        public ClienteController(IConfiguration config)
        {
            _config = config;
        }

        [HttpGet]
        [Route("ConsultarClientes")]
        public ActionResult<List<ClienteUsuarioOBJ>> ConsultarClientes()
        {
            try
            {
                return Ok(mod.ConsultarClientes(_config));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpGet]
        [Route("ConsultarClientePorID")]
        public ActionResult<List<ClienteUsuarioOBJ>> ConsultarClientePorID(int id_usuario)
        {
            try
            {
                return Ok(mod.ConsultarClientePorID(_config, id_usuario));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpGet]
        [Route("ConsultarClientePorCorreo")]
        public ActionResult<List<ClienteUsuarioOBJ>> ConsultarClientePorCorreo(string correo_usuario)
        {
            try
            {
                return Ok(mod.ConsultarClientePorCorreo(_config, correo_usuario));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost]
        [Route("RegistrarCliente")]
        public ActionResult<UsuarioObj> RegistrarCliente([FromBody] ClienteOBJ obj)
        {
            try
            {
                return Ok(mod.RegistrarCliente(_config, obj));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        [Route("ActualizarCliente")]
        public ActionResult ActualizarCliente([FromBody] ClienteUsuarioOBJ obj)
        {
            try
            {
                return Ok(mod.ActualizarCliente(_config, obj));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }





    }
}
