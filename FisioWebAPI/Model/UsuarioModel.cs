using Dapper;
using FisioWebAPI.Entities;
using MySql.Data.MySqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace FisioWebAPI.Model
{
    public class UsuarioModel
    {
        public UsuarioObj? IniciarSesion(IConfiguration _config, UsuarioObj obj)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var usuario = contexto.Query<UsuarioObj>("IniciarSesion", new { obj.correo_usuario, obj.contrasena_usuario }, commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (usuario != null ? usuario : null);
            }
        }

        public List<UsuarioObj> ConsultarUsuarios(IConfiguration _config)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var usuarios = contexto.Query<UsuarioObj>("ConsultarUsuarios", new { }, commandType: CommandType.StoredProcedure).ToList();
                return usuarios;
            }
        }

        public UsuarioObj ConsultarUsuarioPorCorreo(IConfiguration _config, string correo)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var usuario = contexto.Query<UsuarioObj>("ConsultarUsuarioPorCorreo", new { correo }, commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (usuario != null ? usuario : new UsuarioObj());
            }
        }

        public UsuarioObj RegistrarUsuario(IConfiguration _config, UsuarioObj obj)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var usuario = contexto.Query<UsuarioObj>("RegistrarUsuario", new
                {
                    obj.correo_usuario,
                    obj.contrasena_usuario,
                    obj.id_usuario,
                    obj.id_rol
                }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return (usuario != null ? usuario : new UsuarioObj());
            }
        }

        public UsuarioObj? CambiarContrasena(IConfiguration _config, UsuarioObj obj)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var usuario = contexto.Query<UsuarioObj>("CambiarContrasena",
                    new
                    {
                        @id_usuario = obj.id_usuario,
                        @contrasena_usuario = obj.contrasena_usuario
                    },
                    commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (usuario != null ? usuario : new UsuarioObj());
            }
        }

        public UsuarioObj? ActualizarEstadoUsuario(IConfiguration _config, UsuarioObj obj)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var usuario = contexto.Query<UsuarioObj>("ActualizarEstadoUsuario",
                    new
                    {
                        @id_usuario_p = obj.id_usuario,
                    },
                    commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (usuario != null ? usuario : new UsuarioObj());
            }
        }

        public UsuarioObj? RecuperarContrasena(IConfiguration _config, string correo_usuario, string contrasena_usuario)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var usuario = contexto.Query<UsuarioObj>("RecuperarContrasena",
                    new
                    {
                        @correo_usuario = correo_usuario,
                        @contrasena_usuario = contrasena_usuario
                    },
                    commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (usuario != null ? usuario : new UsuarioObj());
            }
        }



    }
}
