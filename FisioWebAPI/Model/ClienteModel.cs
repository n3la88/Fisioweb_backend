using Dapper;
using FisioWebAPI.Entities;
using MySql.Data.MySqlClient;
using System.Data;
using System.Data.SqlClient;

namespace FisioWebAPI.Model
{
    public class ClienteModel
    {
  
        public List<ClienteUsuarioOBJ> ConsultarClientes(IConfiguration _config)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var clientes = contexto.Query<ClienteUsuarioOBJ>("ConsultarClientes", new { }, commandType: CommandType.StoredProcedure).ToList();
                return clientes;
            }
        }

        public ClienteUsuarioOBJ ConsultarClientePorID(IConfiguration _config, int id_usuario)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var usuario = contexto.Query<ClienteUsuarioOBJ>("ConsultarClientePorID", new { id_usuario }, commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (usuario != null ? usuario : new ClienteUsuarioOBJ());
            }
        }

        public ClienteUsuarioOBJ ConsultarClientePorCorreo(IConfiguration _config, string correo_usuario)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var usuario = contexto.Query<ClienteUsuarioOBJ>("ConsultarClientePorCorreo", new { correo_usuario }, commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (usuario != null ? usuario : new ClienteUsuarioOBJ());
            }
        }

        public ClienteOBJ RegistrarCliente(IConfiguration _config, ClienteOBJ obj)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var usuario = contexto.Query<ClienteOBJ>("RegistrarCliente", new
                {
                    obj.id_cliente,
                    obj.nombre_cliente,
                    obj.apellido1_cliente,
                    obj.apellido2_cliente,
                    obj.telefono_cliente,
                    obj.id_usuario,
                    obj.cedula_cliente,
                }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return (usuario != null ? usuario : new ClienteOBJ());
            }
        }

        public ClienteUsuarioOBJ ActualizarCliente(IConfiguration _config, ClienteUsuarioOBJ obj)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var usuario = contexto.Query<ClienteUsuarioOBJ>("ActualizarCliente", new
                {
                    obj.id_usuario,
                    obj.nombre_cliente,
                    obj.apellido1_cliente,
                    obj.apellido2_cliente,
                    obj.telefono_cliente,
                    obj.cedula_cliente,
                    obj.correo_usuario,
                    obj.id_estado
                }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return (usuario != null ? usuario : new ClienteUsuarioOBJ());
            }
        }


    }


}
