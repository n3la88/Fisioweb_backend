using Dapper;
using MySql.Data.MySqlClient;
using System.Data;

namespace FisioWebAPI.Model
{
    public class RazaModel
    {
        //================================================================================
        //=============Metodo para consultar razas======================================
        //================================================================================
        public List<RazaOBJ> ConsultarRazas(IConfiguration _config, int id_especie)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var razas = contexto.Query<RazaOBJ>("ConsultarRazas", new {@id_especie = id_especie }, commandType: CommandType.StoredProcedure).ToList();
                return razas;
            }
        }

    }
}
