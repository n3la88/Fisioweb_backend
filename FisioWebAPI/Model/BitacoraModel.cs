using Dapper;
using MySql.Data.MySqlClient;
using System.Data;

namespace FisioWebAPI.Model
{
    public class BitacoraModel
    {

        public BitacoraOBJ? DatosBitacora(IConfiguration _config, BitacoraOBJ bita)
        {
            
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var datosBitacora = contexto.Query<BitacoraOBJ>("DatosBitacora", new
                {
                    bita.id_error_p,
                    bita.codigo_error_p,
                    bita.error_descripcion_p,
                    bita.fecha_error_p,
                    bita.origen_error_p,
                    bita.id_usuario_p
                },
                    commandType: CommandType.StoredProcedure).FirstOrDefault();

                return (datosBitacora != null ? datosBitacora : new BitacoraOBJ());
            }
        }
    }
}
