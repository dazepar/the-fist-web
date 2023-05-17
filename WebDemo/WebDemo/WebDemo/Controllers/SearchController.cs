using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebDemo.Models;

namespace WebDemo.Controllers
{
    public class SearchController : Controller
    {
        // GET: Search
        private DoAnWebEntities1 db = new DoAnWebEntities1();

        public ActionResult Index(string keyword)
        {
            var Phim = db.PHIMs.Include(p => p.THELOAI);
            if (!String.IsNullOrEmpty(keyword))
            {
                keyword = keyword.Trim().ToLower();
                Phim = Phim.Where(p => p.TenPhim.ToLower().Contains(keyword));
            }
            return View(Phim.ToList());
        }
    }
}