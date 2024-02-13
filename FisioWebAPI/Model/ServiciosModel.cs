using Dapper;
using MySql.Data.MySqlClient;
using System.Data;

namespace FisioWebAPI.Model
{
    public class ServiciosModel
    {
        public List<ServiciosObj> ConsultarServicios(IConfiguration _config)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var servicios = contexto.Query<ServiciosObj>("ConsultarServicios", new { }, commandType: CommandType.StoredProcedure).ToList();
                return servicios;
            }
        }

        public ServiciosObj RegistrarServicio(IConfiguration _config, ServiciosObj obj)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var servicios = contexto.Query<ServiciosObj>("RegistrarServicio", new
                {
                    obj.servicio_descripcion,
                    obj.servicio_detalle
                }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return (servicios != null ? servicios : new ServiciosObj());
            }
        }

        public ServiciosObj? ActualizarServicio(IConfiguration _config, ServiciosObj obj)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var servicios = contexto.Query<ServiciosObj>("ActualizarServicio", new
                {
                    @id_servicio_p = obj.id_servicio,
                    @servicio_descripcion_p = obj.servicio_descripcion,
                    @servicio_detalle_p = obj.servicio_detalle,

                }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return (servicios != null ? servicios : new ServiciosObj());
            }
        }

        public ServiciosObj BorrarServicio(IConfiguration _config, int id)
        {
            string conn = _config.GetSection("ConnectionStrings:DefaultConnection").Value;

            using (var contexto = new MySqlConnection(conn))
            {
                var servicios = contexto.Query<ServiciosObj>("BorrarServicio", new { id },
                commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (servicios != null ? servicios : new ServiciosObj());
            }
        }


        public ServiciosObj ConsultarServicioPorId(IConfiguration _config, int id_servicio_p)
        {
            string conn = _config.GetSection("ConnectionStrings:DefaultConnection").Value;

            using (var contexto = new MySqlConnection(conn))
            {
                var servicio = contexto.Query<ServiciosObj>("ConsultarServicioPorId", new { id_servicio_p },
                                                          commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (servicio != null ? servicio : new ServiciosObj());
            }
        }


    }
}
