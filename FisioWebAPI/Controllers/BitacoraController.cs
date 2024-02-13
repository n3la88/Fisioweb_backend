using FisioWebAPI.Model;
using Microsoft.AspNetCore.Mvc;
using static Org.BouncyCastle.Math.EC.ECCurve;

namespace FisioWebAPI.Controllers
{
    [Route("api/[controller]")]
    public class BitacoraController : Controller
    {
        BitacoraModel model = new BitacoraModel();
        private IConfiguration _config;

        public BitacoraController(IConfiguration config)
        {
            _config = config;
        }

        [HttpPost]
        [Route("RegistrarBitacora")]
        public ActionResult<BitacoraOBJ> RegistrarBitacora([FromBody]BitacoraOBJ bita)
        {
            try
            {
                return Ok(model.DatosBitacora(_config, bita));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
