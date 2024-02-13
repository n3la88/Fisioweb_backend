using FisioWebAPI.Model;
using Microsoft.AspNetCore.Mvc;
using static Org.BouncyCastle.Math.EC.ECCurve;

namespace FisioWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RazaController : ControllerBase
    {
        private IConfiguration _config;
        RazaModel razas = new RazaModel();

        public RazaController(IConfiguration config)
        {
            _config = config;
        }
        //======================================================
        //LLamamos el metodo para consultar mascotas============
        [HttpGet]
        [Route("ConsultarRazas")]
        public ActionResult<List<RazaOBJ>> ConsultarRazas(int id_especie)
        {
            try
            {
                return Ok(razas.ConsultarRazas(_config, id_especie));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
