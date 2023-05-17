using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace WebDemo.Models
{
    public class PHIMsController : Controller
    {
        private DoAnWebEntities1 db = new DoAnWebEntities1();

        // GET: PHIMs
        public ActionResult Index()
        {
            var pHIMs = db.PHIMs.Include(p => p.THELOAI);
            return View(pHIMs.ToList());
        }
        public ActionResult LayTheLoai()
        {
            var dsTheLoai = db.THELOAIs.ToList();
            return PartialView(dsTheLoai);
        }
        public ActionResult SPTheoTheLoai(int id)
        {
            //Lấy các phim theo mã chủ đề được chọn
            var dsSachTheoTheLoai = db.PHIMs.Where(phim => phim.MaTL == id).ToList();
            //Trả về View để render các sách trên (tái sử dụng View Index ở trên, truyền vào danh sách)
              return View("Index", dsSachTheoTheLoai);
        }
        // GET: PHIMs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PHIM pHIM = db.PHIMs.Find(id);
            if (pHIM == null)
            {
                return HttpNotFound();
            }
            return View(pHIM);
        }

        // GET: PHIMs/Create
        public ActionResult Create()
        {
            ViewBag.MaTL = new SelectList(db.THELOAIs, "MaTL", "TenTL");
            return View();
        }

        // POST: PHIMs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = 
            "MaPhim,TenPhim,DonGia,MoTa,HinhMinhHoa,MaTL,NgayCapNhat,SoLuongBan,SoLanXem")] PHIM pHIM,
            HttpPostedFileBase ImagePro)
        {
            if (ModelState.IsValid)
            {
                if (ImagePro != null)
                {
                    //Lấy tên file của hình được up lên
                    var fileName = Path.GetFileName(ImagePro.FileName);
                    //Tạo đường dẫn tới file
                    var path = Path.Combine(Server.MapPath("~/Images"), fileName);
                    //Lưu tên
                    pHIM.HinhMinhHoa = fileName;
                    //Save vào Images Folder
                    ImagePro.SaveAs(path);
                }

                db.PHIMs.Add(pHIM);
                db.SaveChanges();
                return RedirectToAction("Index","Admin");
            }

            ViewBag.MaTL = new SelectList(db.THELOAIs, "MaTL", "TenTL", pHIM.MaTL);
            return View(pHIM);
        }

        // GET: PHIMs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PHIM pHIM = db.PHIMs.Find(id);
            if (pHIM == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaTL = new SelectList(db.THELOAIs, "MaTL", "TenTL", pHIM.MaTL);
            return View(pHIM);
        }

        // POST: PHIMs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaPhim,TenPhim,DonGia,MoTa,HinhMinhHoa,MaTL,NgayCapNhat,SoLuongBan,SoLanXem")] 
        PHIM pHIM, HttpPostedFileBase ImagePro)
        {
            if (ModelState.IsValid)
            {
                if (ImagePro != null)
                {
                    //Lấy tên file của hình được up lên
                    var fileName = Path.GetFileName(ImagePro.FileName);
                    //Tạo đường dẫn tới file
                    var path = Path.Combine(Server.MapPath("~/Images"), fileName);
                    //Lưu tên
                    pHIM.HinhMinhHoa = fileName;
                    //Save vào Images Folder
                    ImagePro.SaveAs(path);
                    db.SaveChanges();
                }
                db.Entry(pHIM).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index","Admin");
            }
            ViewBag.MaTL = new SelectList(db.THELOAIs, "MaTL", "TenTL", pHIM.MaTL);
            return View(pHIM);
        }

        // GET: PHIMs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PHIM pHIM = db.PHIMs.Find(id);
            if (pHIM == null)
            {
                return HttpNotFound();
            }
            return View(pHIM);
        }

        // POST: PHIMs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PHIM pHIM = db.PHIMs.Find(id);
            db.PHIMs.Remove(pHIM);
            db.SaveChanges();
            return RedirectToAction("Index","Admin");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
