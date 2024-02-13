using Dapper;
using System.Data;
using System.Data.SqlClient;
using FisioWebAPI.Entities;
using MySql.Data.MySqlClient;

namespace FisioWebAPI.Model
{
    /******************************
    ===============================
     Autor: Ing. Oscar Sanchez Boza
    ===============================
    ******************************/

    public class MascotaModel
    {
        //================================================================================
        //=====Metodo para consultar todas las mascotas registradas en forma de List======
        //================================================================================
        public List<MascotaOBJ> ConsultarMascotas(IConfiguration _config)
        {
            string conn = _config.GetSection("ConnectionStrings:DefaultConnection").Value;

            using (var contexto = new MySqlConnection(conn))
            {
                var mascotas = contexto.Query<MascotaOBJ>("ConsultarMascotas", new {},
                                                          commandType:CommandType.StoredProcedure).ToList();
                return mascotas;
            }
        }


        public List<MascotaOBJ> ConsultarMascotasPorCLiente(IConfiguration _config, int id_cliente)
        {
            string conn = _config.GetSection("ConnectionStrings:DefaultConnection").Value;

            using (var contexto = new MySqlConnection(conn))
            {
                var mascotas = contexto.Query<MascotaOBJ>("ConsultarMascotasPorCLiente", new { id_cliente},
                                                          commandType: CommandType.StoredProcedure).ToList();
                return mascotas;
            }
        }


        public List<MascotaRazaOBJ> ConsultarMascotasYRaza(IConfiguration _config, int id_cliente)
        {
            string conn = _config.GetSection("ConnectionStrings:DefaultConnection").Value;

            using (var contexto = new MySqlConnection(conn))
            {
                var mascotas = contexto.Query<MascotaRazaOBJ>("VerMascotaYRaza", new { id_cliente },
                                                          commandType: CommandType.StoredProcedure).ToList();
                return mascotas;
            }
        }



        //================================================================================
        //=============Metodo para consultar una mascota por nombre y raza================
        //================================================================================
        public MascotaOBJ ConsultarMascota(IConfiguration _config, int id_mascota_p)
        {
            string conn = _config.GetSection("ConnectionStrings:DefaultConnection").Value;

            using(var contexto = new MySqlConnection(conn))
            {
                var mascota = contexto.Query<MascotaOBJ>("ConsultarMascota", new { id_mascota_p },
                                                          commandType:CommandType.StoredProcedure).FirstOrDefault();
                return (mascota != null ? mascota : new MascotaOBJ());
            }
        }


        public MascotaRazaOBJ ConsultarMascotaYRaza(IConfiguration _config, int id_mascota_p)
        {
            string conn = _config.GetSection("ConnectionStrings:DefaultConnection").Value;

            using (var contexto = new MySqlConnection(conn))
            {
                var mascota = contexto.Query<MascotaRazaOBJ>("ConsultarMascotaYRazaPorId", new { id_mascota_p },
                                                          commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (mascota != null ? mascota : new MascotaRazaOBJ());
            }
        }


        //================================================================================
        //=============Metodo para consultar una mascota por nombre y raza================
        //================================================================================
        public MascotaOBJ? RegistrarMascota(IConfiguration _config, MascotaOBJ objMascota)
        {
            using(var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var mascota = contexto.Query<MascotaOBJ>("RegistrarMascota", new
                {
                    objMascota.id_mascota,
                    objMascota.nombre_mascota,
                    objMascota.edad_mascota,
                    objMascota.detalles_mascota,
                    objMascota.id_raza,
                    objMascota.id_cliente
                }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return (mascota != null ? mascota : new MascotaOBJ());
            }
        }

            //================================================================================
            //============Metodo para Actualizar una mascota por el ID_MASCOTA================
            //================================================================================
            public MascotaOBJ? ActualizarMascota(IConfiguration _config, MascotaOBJ objMascota)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var mascota = contexto.Query<MascotaOBJ>("ActualizarMascota", new
                {
                    @id_mascota_p = objMascota.id_mascota,
                    @nombre_mascota_p = objMascota.nombre_mascota,
                    @edad_mascota_p = objMascota.edad_mascota,
                    @detalles_mascota_p = objMascota.detalles_mascota,
                    @id_raza_p = objMascota.id_raza,
                    @id_cliente_p = objMascota.id_cliente
                }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return (mascota != null ? mascota : new MascotaOBJ());
            }
        }

        //================================================================================
        //===============Metodo para Borrar una mascota por medio del ID==================
        //================================================================================
        public MascotaOBJ BorrarMascota(IConfiguration _config, int id)
        {
            string conn = _config.GetSection("ConnectionStrings:DefaultConnection").Value;

            using (var contexto = new MySqlConnection(conn))
            {
                var mascota = contexto.Query<MascotaOBJ>("BorrarMascota", new { id },
                                                          commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (mascota != null ? mascota : new MascotaOBJ());
            }
        }
        //================================================================================
        //=============Metodo para consultar razas======================================
        //================================================================================


    

    }
}
