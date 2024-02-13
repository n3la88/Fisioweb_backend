using FisioWebAPI.Entities;
using Dapper;
using MySql.Data.MySqlClient;
using System.Data;

namespace FisioWebAPI.Model
{
    public class FaqModel
    {
        public List<FaqObj> ConsultarFAQ(IConfiguration _config)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var faq = contexto.Query<FaqObj>("ConsultarFAQ", new { }, commandType: CommandType.StoredProcedure).ToList();
                return faq;
            }
        }

        public FaqObj RegistrarFAQ(IConfiguration _config, FaqObj obj)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var faq = contexto.Query<FaqObj>("RegistrarFAQ", new
                {
                    obj.pregunta_titulo,
                    obj.pregunta_respuesta
                }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return (faq != null ? faq : new FaqObj());
            }
        }

        public FaqObj? ActualizarFAQ(IConfiguration _config, FaqObj obj)
        {
            using (var contexto = new MySqlConnection(_config.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var faq = contexto.Query<FaqObj>("ActualizarFAQ", new
                {
                    @id_ayuda_p = obj.id_ayuda,
                    @pregunta_titulo_p = obj.pregunta_titulo,
                    @pregunta_respuesta_p = obj.pregunta_respuesta,

                }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return (faq != null ? faq : new FaqObj());
            }
        }

        public FaqObj BorrarFAQ(IConfiguration _config, int id)
        {
            string conn = _config.GetSection("ConnectionStrings:DefaultConnection").Value;

            using (var contexto = new MySqlConnection(conn))
            {
                var faq = contexto.Query<FaqObj>("BorrarFAQ", new { id },
                commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (faq != null ? faq : new FaqObj());
            }
        }

        public FaqObj ConsultarFaqPorId(IConfiguration _config, int id_ayuda_p)
        {
            string conn = _config.GetSection("ConnectionStrings:DefaultConnection").Value;

            using (var contexto = new MySqlConnection(conn))
            {
                var faq = contexto.Query<FaqObj>("ConsultarFaqPorId", new { id_ayuda_p },
                                                          commandType: CommandType.StoredProcedure).FirstOrDefault();
                return (faq != null ? faq : new FaqObj());
            }
        }


    }
}
