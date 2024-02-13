using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using FisioWebAPI.Entities;
using FisioWebAPI.Model;
using MySql.Data.MySqlClient;
using System.Data;

namespace FisioWebAPI.Controllers
{
    /******************************
    ===============================
     Autor: Ing. Oscar Sanchez Boza
    ===============================
    ******************************/

    [Route("api/[controller]")]
    [ApiController]
    public class MascotaController : ControllerBase
    {
        private IConfiguration _config;
        MascotaModel mascotas = new MascotaModel();

        //=============================================
        //Constructor para la inyeccion de dependencias
        //=============================================
        public MascotaController(IConfiguration config)
        {
            _config = config;
        }

        //========================================================
        //LLamamos el metodo para consultar una mascota por id
        [HttpGet]
        [Route("ConsultarMascota")]
        public ActionResult<MascotaOBJ> ConsultarMascota(int id_mascota)
        {
            try
            {
                return Ok(mascotas.ConsultarMascota(_config, id_mascota));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpGet]
        [Route("ConsultarMascotaYRaza")]
        public ActionResult<MascotaRazaOBJ> ConsultarMascotaYRaza(int id_mascota)
        {
            try
            {
                return Ok(mascotas.ConsultarMascotaYRaza(_config, id_mascota));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        //======================================================
        //LLamamos el metodo para consultar mascotas============
        [HttpGet]
        [Route("ConsultarMascotas")]
        public ActionResult<List<MascotaOBJ>> ConsultarMascotas()
        {
            try
            {
                return Ok(mascotas.ConsultarMascotas(_config));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("ConsultarMascotasPorCliente")]
        public ActionResult<List<MascotaOBJ>> ConsultarMascotasPorCliente(int id_cliente)
        {
            try
            {
                return Ok(mascotas.ConsultarMascotasPorCLiente(_config, id_cliente));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //========================================================
        //LLamamos el metodo para consultar lista de mascotas y su respectiva raza por ID de Cliente
        [HttpGet]
        [Route("ConsultarMascotasYRaza")]
        public ActionResult<MascotaRazaOBJ> ConsultarMascotasYRaza(int id_cliente)
        {
            try
            {
                return Ok(mascotas.ConsultarMascotasYRaza(_config, id_cliente));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //======================================================
        //LLamamos el metodo para Registrar mascotas============
        [HttpPost]
        [Route("RegistrarMascota")]
        public ActionResult<MascotaOBJ> RegistrarMascota([FromBody] MascotaOBJ objMascota)
        {
            try
            {
                return Ok(mascotas.RegistrarMascota(_config, objMascota));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //======================================================
        //LLamamos el metodo para Actualizar mascotas===========
        [HttpPut]
        [Route("ActualizarMascota")]
        public ActionResult<MascotaOBJ>ActualizarMascotas(MascotaOBJ mascotaObj)
        {
            try
            {
                return Ok(mascotas.ActualizarMascota(_config, mascotaObj));
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //======================================================
        //LLamamos el metodo para Borrar una mascota por ID=====
        [HttpDelete]
        [Route("BorrarMascota")]
        public ActionResult<MascotaOBJ> BorrarMascotas(int id_mascota)
        {
            try
            {
                return Ok(mascotas.BorrarMascota(_config, id_mascota));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
