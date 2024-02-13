using Dapper;
using MySql.Data.MySqlClient;
using System.Data;

namespace FisioWebAPI.Model
{
    public class EmpleadoModel
    {

        public EmpleadoOBJ RegistrarEmpleado(IConfiguration _config, EmpleadoOBJ obj)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var usuario = contexto.Query<EmpleadoOBJ>("RegistrarEmpleado", new
                {
                    obj.id_empleado,
                    obj.nombre_empleado,
                    obj.apellido1_empleado,
                    obj.apellido2_empleado,
                    obj.puesto_empleado,
                    obj.id_usuario,
                    obj.telefono_empleado,
                    obj.cedula_empleado,
                }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return (usuario != null ? usuario : new EmpleadoOBJ());
            }
        }

        public EmpleadoUsuarioOBJ ConsultarEmpleadoPorCorreo(IConfiguration _config, string correo_usuario)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var empleado = contexto.Query<EmpleadoUsuarioOBJ>("ConsultarEmpleadoPorCorreo", new { correo_usuario }, commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (empleado != null ? empleado : new EmpleadoUsuarioOBJ());
            }
        }



    }
}
