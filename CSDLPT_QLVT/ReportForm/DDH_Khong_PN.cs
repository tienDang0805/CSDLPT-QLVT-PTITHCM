using DevExpress.XtraReports.UI;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSDLPT_QLVT.ReportForm
{
    public partial class DDH_Khong_PN : Form
    {
        String chiNhanh;
        public DDH_Khong_PN()
        {
            InitializeComponent();
        }

        private void DDH_Khong_PN_Load(object sender, EventArgs e)
        {
            cmbChiNhanh.DataSource = Program.dbs_dspm;  // sao chép bds_dspm đã load ở form đăng nhập qua
            cmbChiNhanh.DisplayMember = "TENCN";
            cmbChiNhanh.ValueMember = "TENSERVER";
            cmbChiNhanh.SelectedIndex = Program.mChinhanh;

            if (Program.mGroup == "CONGTY")
                cmbChiNhanh.Enabled = true;  // bật tắt theo phân quyền
            else cmbChiNhanh.Enabled = false;
            chiNhanh = cmbChiNhanh.Text;
        }

        private void cmbChiNhanh_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbChiNhanh.SelectedValue.ToString() == "System.Data.DataRowView") return;

            // Lấy tên server
            Program.servername = cmbChiNhanh.SelectedValue.ToString();


            // Nếu tên server khác với tên server ngoài đăng nhập, thì ta phải sử dụng HTKN
            if (cmbChiNhanh.SelectedIndex != Program.mChinhanh)
            {
                Program.mlogin = Program.remoteLogin;
                Program.password = Program.remotePassword;
            }
            else
            {
                Program.mlogin = Program.mloginDN;
                Program.password = Program.passwordDN;
            }

            if (Program.KetNoi() == 0)
                MessageBox.Show("Lỗi kết nối về chi nhánh mới", "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            else
            {
                chiNhanh = cmbChiNhanh.Text;
            }
        }

        private void btnPreview_Click(object sender, EventArgs e)
        {
            Xrpt_DDH_Khong_PN rp = new Xrpt_DDH_Khong_PN();
            ReportPrintTool rpt = new ReportPrintTool(rp);
            rp.lbChiNhanh.Text = chiNhanh;
            rp.ShowPreviewDialog();
        }
    }
}
