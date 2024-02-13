namespace FisioWebAPI.Entities
{
    public class MascotaOBJ
    {
        public int id_mascota { get; set; } = 0;
        public string nombre_mascota { get; set; } = string.Empty;
        public int edad_mascota { get; set; } = 0;
        public string detalles_mascota { get; set; } = string.Empty;
        public int id_raza { get; set; } = 0;
        public int id_cliente { get; set; } = 0;
        public int id_especie { get; set; } = 0;
        public string descripcion_especie { get; set; } = string.Empty;
        public string descripcion_raza { get; set; } = string.Empty;
    }


    public class MascotaRazaOBJ
    {
        public int id_mascota { get; set; } = 0;
        public string nombre_mascota { get; set; } = string.Empty;
        public int edad_mascota { get; set; } = 0;
        public string detalles_mascota { get; set; } = string.Empty;
        public int id_raza { get; set; } = 0;
        public int id_cliente { get; set; } = 0;
        public int id_especie { get; set; } = 0;
        public string descripcion_especie { get; set; } = string.Empty;
        public string descripcion_raza { get; set; } = string.Empty;


    }

}
