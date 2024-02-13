using Dapper;
using MySql.Data.MySqlClient;
using System.Data;

namespace FisioWebAPI.Model
{
    public class EspeciesModel
    {
        //================================================================================
        //=============Metodo para consultar razas======================================
        //================================================================================
        public List<EspeciesOBJ> ConsultarEspecies(IConfiguration _config)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var especies = contexto.Query<EspeciesOBJ>("ConsultarEspecies", new { }, commandType: CommandType.StoredProcedure).ToList();
                return especies;
            }
        }

    }
}
