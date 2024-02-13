namespace FisioWebAPI.Entities
{
    public class UsuarioObj
    {
        public int id_usuario { get; set; } = 0;
        public string correo_usuario { get; set; } = string.Empty;
        public string contrasena_usuario { get; set; } = string.Empty;
        public int id_rol { get; set; } = 0;
        public int id_estado { get; set; } = 0;

    }
}
