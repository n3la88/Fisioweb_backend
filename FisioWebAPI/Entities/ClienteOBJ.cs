namespace FisioWebAPI.Entities
{
    public class ClienteOBJ
    {
        public int id_cliente { get; set; } = 0;
        public string nombre_cliente { get; set; } = string.Empty;
        public string apellido1_cliente { get; set; } = string.Empty;
        public string apellido2_cliente { get; set; } = string.Empty;
        public int telefono_cliente { get; set; } = 0;
        public int id_usuario { get; set; } = 0;
        public string cedula_cliente { get; set; } = string.Empty;

    }

    public class ClienteUsuarioOBJ
    {
        public string correo_usuario { get; set; } = string.Empty;
        public int id_cliente { get; set; } = 0;
        public string nombre_cliente { get; set; } = string.Empty;
        public string apellido1_cliente { get; set; } = string.Empty;
        public string apellido2_cliente { get; set; } = string.Empty;
        public int telefono_cliente { get; set; } = 0;
        public int id_usuario { get; set; } = 0;
        public string cedula_cliente { get; set; } = string.Empty;
        public int id_estado { get; set; } = 0;

    }

}



