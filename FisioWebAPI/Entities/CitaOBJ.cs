namespace FisioWebAPI.Entities
{
    public class CitaOBJ
    {
        public int id_cita { get; set; } = 0;
        public string descripcion_cita { get; set; } = string.Empty;
        public int id_mascota { get; set; } = 0;
        public int id_empleado { get; set; } = 0;
        public int id_servicio { get; set; } = 0;
        public int id_estado { get; set; } = 0;
        public DateTime horaInicio_cita { get; set; } = DateTime.MinValue;
        public DateTime horaFin_cita { get; set; } = DateTime.MinValue;


    }
}
