using FisioWebAPI.Entities;

namespace FisioWebAPI.Services.EmailService
{
    public interface IEmailService
    {
        void sendEmail(CorreoObj request);

    }
}
