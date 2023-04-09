using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using CSDLPT_QLVT.ReportForm;

using System.Windows.Forms;

namespace CSDLPT_QLVT
{
    public partial class FormMain : DevExpress.XtraBars.Ribbon.RibbonForm
    {

        public FormMain()
        {
            InitializeComponent();

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            ribDanhMuc.Visible = ribNghiepVu.Visible = ribBaoCao.Visible = false;
            btnTaoTk.Enabled = btnDangXuat.Enabled = false;
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(FormNhanVien));
            if (frm != null) frm.Activate();
            else
            {
                FormNhanVien f = new FormNhanVien();
                f.MdiParent = this;
                f.Show();
            }
        }

        private void statusStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void toolStripStatusLabel1_Click(object sender, EventArgs e)
        {

        }

        private void btnlogin_Click(object sender, EventArgs e)
        {

        }

        private void barButtonItem3_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }



        private Form CheckExists(Type ftype)
        {
            foreach (Form f in this.MdiChildren)
                if (f.GetType() == ftype)
                    return f;
            return null;
        }

        private void barButtonItem4_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(FormDangNhap));
            if (frm != null) frm.Activate();
            else
            {
                FormDangNhap f = new FormDangNhap();
                f.MdiParent = this;
                f.Show();
            }
        }
        public void HienMenu()
        {
            ribDanhMuc.Visible = ribNghiepVu.Visible = ribBaoCao.Visible = true;
            //if trên Program.mGroup để bật tắt menu
            if (Program.mGroup.Equals("CONGTY") || Program.mGroup.Equals("CHINHANH"))
            {
                btnTaoTk.Enabled = true;
            }
            btnDangXuat.Enabled = true;
            btnDangNhap.Enabled = false;
            tsMaNV.Text = "Ma NV: " + Program.username;
            TsHoTen.Text = "Ho Ten: " + Program.mHoten;
            TsNhom.Text = "Nhom: " + Program.mGroup;
            //Phân quyền


        }
        private void TsHoTen_Click(object sender, EventArgs e)
        {

        }

        private void TsNhom_Click(object sender, EventArgs e)
        {

        }

        private void barButtonItem6_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            ribDanhMuc.Visible = ribNghiepVu.Visible = ribBaoCao.Visible = false;
            foreach (Form f in this.MdiChildren)
                f.Dispose();
            btnDangNhap.Enabled = true;
            btnTaoTk.Enabled= btnDangXuat.Enabled = false;
           
            Program.formchinh.tsMaNV.Text = "MANV";
            Program.formchinh.TsHoTen.Text = "HOTEN";
            Program.formchinh.TsNhom.Text = "NHOM";

        }

        private void btnKho_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(FormKho));
            if (frm != null) frm.Activate();
            else
            {
                FormKho f = new FormKho();
                f.MdiParent = this;
                f.Show();
            }
        }

        private void ribbonControl1_Click(object sender, EventArgs e)
        {

        }

        private void btnVatTu_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(FormVatTu));
            if (frm != null) frm.Activate();
            else
            {
                FormVatTu f = new FormVatTu();
                f.MdiParent = this;
                f.Show();
            }
        }

        private void barButtonItem4_ItemClick_1(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(subFormDDH));
            if (frm != null) frm.Activate();
            else
            {
                subFormDDH f = new subFormDDH();
                f.MdiParent = this;
                f.Show();
            }
        }

        private void barButtonItem5_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(subFormPhieuNhap));
            if (frm != null) frm.Activate();
            else
            {
                subFormPhieuNhap f = new subFormPhieuNhap();
                f.MdiParent = this;
                f.Show();
            }
        }

        private void barButtonItem6_ItemClick_1(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(subFormPhieuXuat));
            if (frm != null) frm.Activate();
            else
            {
                subFormPhieuXuat f = new subFormPhieuXuat();
                f.MdiParent = this;
                f.Show();
            }
        }

        private void barButtonItem7_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(FormInDSNV));
            if (frm != null) frm.Activate();
            else
            {
                FormInDSNV f = new FormInDSNV();
                f.MdiParent = this;
                f.Show();
            }
        }

        private void barButtonItem8_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(FormInDSVT));
            if (frm != null) frm.Activate();
            else
            {
                FormInDSVT f = new FormInDSVT();
                f.MdiParent = this;
                f.Show();
            }
        }

        private void btnTaoTk_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(FormTaoTaiKhoan));
            if (frm != null) frm.Activate();
            else
            {
                FormTaoTaiKhoan f = new FormTaoTaiKhoan();
                f.MdiParent = this;
                f.Show();
            }

        }

        private void barButtonItem9_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(DDH_Khong_PN));
            if (frm != null) frm.Activate();
            else
            {
                DDH_Khong_PN f = new DDH_Khong_PN();
                f.MdiParent = this;
                f.Show();
            }

        }

        /* private void barButtonItem7_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
         {
             Form frm = this.CheckExists(typeof(FormInDSNV));
             if (frm != null) frm.Activate();
             else
             {
                 FormInDSNV f = new FormInDSNV();
                 f.MdiParent = this;
                 f.Show();
             }
         }*/
    }
}
