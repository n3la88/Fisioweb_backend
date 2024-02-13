using Dapper;
using MySql.Data.MySqlClient;
using System.Data;

namespace FisioWebAPI.Model
{
    public class CitaModel
    {
        public CitaOBJ RegistrarCita(IConfiguration _config, CitaOBJ obj)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var cita = contexto.Query<CitaOBJ>("RegistrarCita", new
                {
                    obj.id_cita,
                    obj.descripcion_cita,
                    obj.horaInicio_cita,
                    obj.horaFin_cita,
                    obj.id_estado,
                    obj.id_empleado,
                    obj.id_mascota,
                    obj.id_servicio
                }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return (cita != null ? cita : new CitaOBJ());
            }
        }

        public CitaOBJ ConsultarCita(IConfiguration _config, int id_mascota)
        {
            using(var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var cita = contexto.Query<CitaOBJ>("ConsultarCita", new { id_mascota }, commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (cita != null ? cita : new CitaOBJ());
            }
        }

        public List<CitaOBJ> ConsultarCitas(IConfiguration _config)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var cita = contexto.Query<CitaOBJ>("ConsultarCitas", new {}, commandType: CommandType.StoredProcedure).ToList();
                return cita;
            }
        }

    }
}
