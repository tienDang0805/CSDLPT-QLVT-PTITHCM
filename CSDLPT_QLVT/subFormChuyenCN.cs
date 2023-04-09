using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSDLPT_QLVT
{
    public partial class subFormChuyenCN : Form
    {
        public subFormChuyenCN()
        {
            InitializeComponent();
        }

        private void subFormChuyenCN_Load(object sender, EventArgs e)
        {
            cmbChiNhanh1.DataSource = Program.dbs_dspm.DataSource;
            cmbChiNhanh1.DisplayMember = "TENCN";
            cmbChiNhanh1.ValueMember = "TENSERVER";
            cmbChiNhanh1.SelectedIndex = Program.mChinhanh;

        }
        public delegate void MyDelegate(string chiNhanh);
        public MyDelegate chuyenChiNhanh1;

        private void btnChuyen_Click(object sender, EventArgs e)
        {
            if (cmbChiNhanh1.Text.Trim().Equals(""))
            {
                MessageBox.Show("Vui lòng chọn chi nhánh", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            FormNhanVien.serverMoi = cmbChiNhanh1.SelectedValue.ToString();
            // Chi nhánh được chọn là chi nhánh đang đăng nhập
            if (FormNhanVien.serverMoi.Equals(Program.servername))
            {
                MessageBox.Show("Hãy chọn chi nhánh khác chi nhánh bạn đang đăng nhập", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            DialogResult dr = MessageBox.Show("Hành động này không thế hoàn tác.\nBạn có chắc chắn muốn chuyển nhân viên này không?", "Thông báo",
                        MessageBoxButtons.OKCancel, MessageBoxIcon.Question);

            // người dùng chọn cancel thì return không làm gì cả
            if (dr != DialogResult.OK) return;

            this.Dispose();
        }
    }
}
