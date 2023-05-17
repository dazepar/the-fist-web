using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDemo.Models;

namespace WebDemo.Controllers
{
    public class HomeController : Controller
    {
        private DoAnWebEntities1 db = new DoAnWebEntities1();
        public ActionResult Index()
        {
            return View(db.PHIMs.ToList());
        }
        public ActionResult ThongTinWeb()
        {
            return View();
        }
    }
}