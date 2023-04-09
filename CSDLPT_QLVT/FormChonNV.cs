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
    public partial class FormChonNV : Form
    {
        public FormChonNV()
        {
            InitializeComponent();
        }

        private void nhanVienBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsNV.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void FormChonNV_Load(object sender, EventArgs e)
        {
            dS.EnforceConstraints = false; //không kiểm tra khóa ngoại trên dataset này

            // TODO: This line of code loads data into the 'qLVTDataSet.NhanVien' table. You can move, or remove it, as needed.
            this.nhanVienTableAdapter.Connection.ConnectionString = Program.connstr;
            this.nhanVienTableAdapter.Fill(this.dS.NhanVien);

        }

        private void btnChon_Click(object sender, EventArgs e)
        {
            DataRowView drv = ((DataRowView)bdsNV[bdsNV.Position]);
            if (drv["TrangThaiXoa"].ToString().Equals("1"))
            {
                MessageBox.Show("Nhân viên này đã bị xóa!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            FormTaoTaiKhoan.nhanVien = drv["MANV"].ToString();
            FormTaoTaiKhoan.TenNV = drv["Ho"].ToString() + drv["TEN"].ToString();
            this.Dispose();
        }
    }
}
