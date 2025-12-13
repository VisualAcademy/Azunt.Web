using Azunt.Web.Billing.Domain;
using System.Threading.Tasks;

namespace Azunt.Web.Billing.Services;

public interface IEmailSender
{
    Task<bool> SendInvoiceEmailAsync(Invoice invoice, Customer customer, byte[] pdfBytes, string viewLink);
}
