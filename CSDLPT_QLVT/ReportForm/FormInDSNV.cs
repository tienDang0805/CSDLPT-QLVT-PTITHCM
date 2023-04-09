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
    public partial class FormInDSNV : Form
    {
        public FormInDSNV()
        {
            InitializeComponent();
        }
        string chiNhanh = "";
        private void FormInDSNV_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dS.NhanVien2' table. You can move, or remove it, as needed.


            // TODO: This line of code loads data into the 'dS.SP_Report_DSNV' table. You can move, or remove it, as needed.

            // TODO: This line of code loads data into the 'dS.V_DSPM' table. You can move, or remove it, as needed.
           
            cmbChiNhanh.DataSource = Program.dbs_dspm;  // sao chép bds_dspm đã load ở form đăng nhập qua
            cmbChiNhanh.DisplayMember = "TENCN";
            cmbChiNhanh.ValueMember = "TENSERVER";
            cmbChiNhanh.SelectedIndex = Program.mChinhanh;
            if (Program.mGroup == "CONGTY")
                cmbChiNhanh.Enabled = true;  // bật tắt theo phân quyền
            else cmbChiNhanh.Enabled = false;
            chiNhanh = cmbChiNhanh.Text;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
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
                MessageBox.Show("Lỗi kết nối về chi nhánh mới", "", MessageBoxButtons.OK);
            else{
                
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Xrpt_ReportDSNV reportDSNV = new Xrpt_ReportDSNV();
            ReportPrintTool rpt = new ReportPrintTool(reportDSNV);
            reportDSNV.lblChiNhanh.Text = chiNhanh;
            reportDSNV.ShowPreviewDialog();
        }
    }
}
