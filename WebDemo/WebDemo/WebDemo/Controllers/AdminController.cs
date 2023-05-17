using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDemo.Models;

namespace WebDemo.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        private DoAnWebEntities1 db = new DoAnWebEntities1();
        public ActionResult Index()
        {
            return View(db.PHIMs.ToList());
        }
        public ActionResult HoaDon()
        {
            return View(db.DONDATHANGs.ToList());
        }
        public ActionResult CTDonHangID(int id)
        {
            var listOfBillbyCate = db.CTDONHANGs.Where(bill => bill.SoDH == id).ToList();
            return View("CTDonHang", listOfBillbyCate);
        }
        public ActionResult CTDonHang()
        {
            var bills=db.CTDONHANGs.ToList();
            return PartialView(bills);
        }
    }
}