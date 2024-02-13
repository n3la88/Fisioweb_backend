using FisioWebAPI.Model;
using Microsoft.AspNetCore.Mvc;

namespace FisioWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EspeciesController : ControllerBase
    {
        private IConfiguration _config;
        EspeciesModel ModelEspecies = new EspeciesModel();

        public EspeciesController(IConfiguration config)
        {
            _config = config;
        }
        //======================================================
        //LLamamos el metodo para consultar mascotas============
        [HttpGet]
        [Route("ConsultarEspecies")]
        public ActionResult<List<RazaOBJ>> ConsultarEspecies()
        {
            try
            {
                return Ok(ModelEspecies.ConsultarEspecies(_config));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
