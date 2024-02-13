namespace FisioWebAPI.Entities
{
    public class BitacoraOBJ
    {
        public int id_error_p { get; set; } = 0;
        public string codigo_error_p { get; set; } = string.Empty;
        public string error_descripcion_p { get; set; } = string.Empty;
        public DateTime fecha_error_p { get; set; } = DateTime.MinValue;
        public string origen_error_p { get; set; } = String.Empty;
        public int id_usuario_p { get; set; } = 0;
    }
}
