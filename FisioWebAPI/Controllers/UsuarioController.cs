using FisioWebAPI.Entities;
using FisioWebAPI.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FisioWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private IConfiguration _config;
        UsuarioModel mod = new UsuarioModel();

        public UsuarioController(IConfiguration config)
        {
            _config = config;
        }

        //Falta crear token
        [HttpPost]
        [Route("Autenticar")]
        public ActionResult<UsuarioObj> AutenticarUsuario([FromBody] UsuarioObj obj)
        {
            try
            {
                var respuesta = mod.IniciarSesion(_config, obj);          
                if (respuesta == null)
                {
                    return Unauthorized("Acceso Denegado");
                }
                else
                { 
                    return Ok(respuesta);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("ConsultarUsuarios")]
        public ActionResult<List<UsuarioObj>> ConsultarUsuarios()
        {
            try
            {
                return Ok(mod.ConsultarUsuarios(_config));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("ConsultarUsuario")]
        public ActionResult<UsuarioObj> ConsultarUsuarioPorCorreo(string correo)
        {
            try
            {
                return Ok(mod.ConsultarUsuarioPorCorreo(_config, correo));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        [Route("RegistrarUsuario")]
        public ActionResult<UsuarioObj> RegistrarUsuario([FromBody] UsuarioObj obj)
        {
            try
            {
                return Ok(mod.RegistrarUsuario(_config, obj));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost]
        [Route("CambiarClave")]
        public ActionResult<UsuarioObj> CambiarContrasena([FromBody] UsuarioObj obj)
        {
            try
            {
                return Ok(mod.CambiarContrasena(_config, obj));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        [Route("ActualizarEstadoUsuario")]
        public ActionResult<UsuarioObj> ActualizarEstadoUsuario([FromBody] UsuarioObj obj)
        {
            try
            {
                return Ok(mod.ActualizarEstadoUsuario(_config, obj));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        [Route("RecuperarContrasena")]
        public ActionResult<UsuarioObj> RecuperarContrasena([FromBody] UsuarioObj obj)
        {
            try
            {
                return Ok(mod.RecuperarContrasena(_config, obj.correo_usuario,obj.contrasena_usuario));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
