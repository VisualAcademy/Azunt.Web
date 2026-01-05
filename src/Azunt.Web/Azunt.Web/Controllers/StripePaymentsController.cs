using Microsoft.AspNetCore.Mvc;

namespace Azunt.Web.Controllers
{
    public class StripePaymentsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
