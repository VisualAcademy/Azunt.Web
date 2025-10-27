using Microsoft.AspNetCore.Mvc;

namespace Azunt.Web.Controllers
{
    public class AnalyticsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
