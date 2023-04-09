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
    public partial class FormTaoTaiKhoan : Form
    {
        public static String nhanVien = "";
        public static String TenNV = "";
        String role = "";
        public FormTaoTaiKhoan()
        {
            InitializeComponent();
        }

        private void FormTaoTaiKhoan_Load(object sender, EventArgs e)
        {
            txtMatKhau.UseSystemPasswordChar = true;
            txtMatKhauXacNhan.UseSystemPasswordChar = true;
            
            if (Program.mGroup == "CONGTY")
            {
                role = "CONGTY";
                radioButton_ChiNhanh.Visible = false;
                radioButton_User.Visible = false;
            }
        }

        private void btnTao_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNhanVien.Text))
            {
                MessageBox.Show("Vui lòng chọn nhân viên!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (ValidateChildren(ValidationConstraints.Enabled))
            {
                if (Program.mGroup != "CONGTY")
                    role = (radioButton_ChiNhanh.Checked == true) ? "CHINHANH" : "USER";

                String strLenh = string.Format("exec sp_TaoLogin '{0}', '{1}', '{2}', '{3}'",
                    txtLoginName.Text, txtMatKhau.Text, nhanVien, role);

                Program.myReader = Program.ExecSqlDataReader(strLenh);
                if (Program.myReader == null) return;

                Program.myReader.Close();
                MessageBox.Show("Tạo tài khoản cho nhân viên thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void btnChonNV_Click(object sender, EventArgs e)
        {
            FormChonNV form = new FormChonNV();
            form.ShowDialog();

            txtNhanVien.Text = TenNV;
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }
    }
}
