namespace FisioWebAPI.Entities
{
        public class EmpleadoOBJ
        { 
            public int id_empleado { get; set; } = 0;
            public string nombre_empleado { get; set; } = string.Empty;
            public string apellido1_empleado { get; set; } = string.Empty;
            public string apellido2_empleado { get; set; } = string.Empty;
            public string puesto_empleado { get; set; } = string.Empty;
            public int id_usuario { get; set; } = 0;
            public int telefono_empleado { get; set; } = 0;
            public string cedula_empleado { get; set; } = string.Empty;

        }


    public class EmpleadoUsuarioOBJ
    {
        public string correo_usuario { get; set; } = string.Empty;
        public int id_empleado { get; set; } = 0;
        public string nombre_empleado { get; set; } = string.Empty;
        public string apellido1_empleado { get; set; } = string.Empty;
        public string apellido2_empleado { get; set; } = string.Empty;
        public string puesto_empleado { get; set; } = string.Empty;
        public int id_usuario { get; set; } = 0;
        public int telefono_empleado { get; set; } = 0;
        public string cedula_empleado { get; set; } = string.Empty;

    }
    

}
