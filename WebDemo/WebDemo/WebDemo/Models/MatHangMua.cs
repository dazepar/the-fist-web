using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebDemo.Models
{
    public class MatHangMua
    {
        private DoAnWebEntities1 db = new DoAnWebEntities1();
        public int MaPhim { get; set; }
        public string TenPhim { get; set; }
        public string AnhBia { get; set; }
        public double DonGia { get; set; }
        public int SoLuong { get; set; }
        public double ThanhTien()
        {
            return SoLuong * DonGia;
        }
        public MatHangMua(int MaPhim)
        {
            this.MaPhim = MaPhim;

            //Tìm phim trong CSDL có mã id cần và gán cho mặt hàng được mua
            var phim = db.PHIMs.Single(s => s.MaPhim == this.MaPhim);
            this.TenPhim = phim.TenPhim;
            this.AnhBia = phim.HinhMinhHoa;
            this.DonGia = double.Parse(phim.DonGia.ToString());
            this.SoLuong = 1; //Số lượng mua ban đầu của một mặt hàng là 1 (cho lần click đầu)
        }
    }
}