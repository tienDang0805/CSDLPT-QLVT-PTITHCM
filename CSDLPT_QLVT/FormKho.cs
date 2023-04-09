using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSDLPT_QLVT
{
    public partial class FormKho : Form
    {
        int position = 0;
        string maCN = "";
        
        public FormKho()
        {
            InitializeComponent();
        }

        private void khoBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsKho.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void FormKho_Load(object sender, EventArgs e)
        {
            dS.EnforceConstraints = false;
            this.khoTableAdapter.Connection.ConnectionString = Program.connstr;
            this.khoTableAdapter.Fill(this.dS.Kho);
            this.datHangTableAdapter.Connection.ConnectionString = Program.connstr;
            this.datHangTableAdapter.Fill(this.dS.DatHang);
            this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
            this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);
            this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connstr;
            this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat);

            if (Program.mGroup == "CONGTY")
            {
                btnThoatThem.Enabled = btnThem.Enabled = btnXoa.Enabled = btnGhi.Enabled = btnUndo.Enabled = false;
                txtTenKho.Enabled = txtMaKho.Enabled = txtDiaChi.Enabled = false;
            }
            else if (Program.mGroup == "CHINHANH" || Program.mGroup == "USER")
            {
                cmbChiNhanh.Enabled = txtMaKho.Enabled = false;
            }

            maCN = (((DataRowView)bdsKho[0])["MACN"].ToString()); // lúc đúng lúc sai

            this.cmbChiNhanh.DataSource = Program.dbs_dspm; // DataSource của comboBox_ChiNhanh tham chiếu đến bindingSource ở LoginForm
            cmbChiNhanh.DisplayMember = "TENCN";
            cmbChiNhanh.ValueMember = "TENSERVER";
            cmbChiNhanh.SelectedIndex = Program.mChinhanh;

            //Mặc định vừa vào groupbox không dx hiện để tránh lỗi sửa các dòng cũ chưa lưu đi qua dòng khác
            btnUndo.Enabled = false;
            //Program.flagCloseFormKho = true; //Khi load bật cho phép có thể đóng form

        }

        private void pNhapKho_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            position = bdsKho.Position;
            pNhapKho.Enabled = true;
            txtMaKho.Enabled = true;
            this.bdsKho.AddNew();
            txtCN.Text = maCN;
            btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = gcKho.Enabled = false;
            btnGhi.Enabled = btnUndo.Enabled = btnThoatThem.Enabled = true;
        }
        private void reload()
        {
            try
            {
                this.khoTableAdapter.Fill(this.dS.Kho);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi Reload :" + ex.Message, "", MessageBoxButtons.OK);
                return;
            }
        }
        private void btnThoatThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            
            btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = gcKho.Enabled = true;
            btnGhi.Enabled = pNhapKho.Enabled = false;
            
            reload();
        }

        private void btnGhi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (ValidateChildren(ValidationConstraints.Enabled))
            {
                String strLenh_Kho = "DECLARE @return_value int " +
                             "EXEC @return_value = [dbo].[SP_CHECKID_TRACUU] " +
                             txtMaKho.Text.Trim() + ", 'MAKHO' " +
                             "SELECT 'Return Value' = @return_value";
                try
                {
                    Program.myReader = Program.ExecSqlDataReader(strLenh_Kho);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Thực thi database thất bại!\n" + ex.Message, "Thông báo",
                            MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }


                Program.myReader.Read();
                int result_MaKho = int.Parse(Program.myReader.GetValue(0).ToString());
                Program.myReader.Close();
                String strLenh_tenKho = "DECLARE @return_value int " +
                                 "EXEC @return_value = [dbo].[SP_CHECKID_TRACUU] " +
                                 txtTenKho.Text.Trim() + ", 'TENKHO' " +
                                 "SELECT 'Return Value' = @return_value";
                try
                {
                    Program.myReader = Program.ExecSqlDataReader(strLenh_tenKho);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Thực thi database thất bại!\n" + ex.Message, "Thông báo",
                            MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }


                Program.myReader.Read();
                int result_tenKho = int.Parse(Program.myReader.GetValue(0).ToString());
                Program.myReader.Close();
                if (result_MaKho == 1)
                {
                    MessageBox.Show("Mã kho đã tồn tại vui lòng nhập lại !", "Thông báo", MessageBoxButtons.OK);

                    return;
                }
                if (result_tenKho == 1)
                {
                    MessageBox.Show("Tên kho đã tồn tại vui lòng nhập lại !", "Thông báo", MessageBoxButtons.OK);

                    return;
                }
                try
                {
                    bdsKho.EndEdit(); // kết thúc quá trình hiệu chỉnh và ghi vào BindingSource
                    bdsKho.ResetCurrentItem(); // đưa thông tin vào grid
                    this.khoTableAdapter.Connection.ConnectionString = Program.connstr; // đường kết nối đã đăng nhập
                    this.khoTableAdapter.Update(this.dS.Kho); // update xuống csdl

                    MessageBox.Show("Ghi thông tin kho thành công!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xảy ra trong quá trình ghi thông tin kho. Vui lòng thử lại!\n" + ex.Message, "Thông báo lỗi",
                           MessageBoxButtons.OK, MessageBoxIcon.Error);

                    reload();
                    return;
                }

            }
            btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = true;
            btnGhi.Enabled = false;
            gcKho.Enabled = true;
            pNhapKho.Enabled = true;
        }

        private void btnReload_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            reload();
        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (bdsKho.Count == 0)
                MessageBox.Show("Danh sách trống!", "Thông báo lỗi",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);

            string maKho = ((DataRowView)bdsKho[bdsKho.Position])["MAKHO"].ToString();
            if (datHangBindingSource.Count > 0)
            {
                MessageBox.Show("Không thể xóa vì kho đã được lập đơn đặt hàng", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (phieuNhapBindingSource.Count > 0)
            {
                MessageBox.Show("Không thể xóa vì nhân viên đã được lập phiếu nhập", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (phieuXuatBindingSource.Count > 0)
            {
                MessageBox.Show("Không thể xóa vì nhân viên đã được lập phiếu xuất", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            DialogResult dr = MessageBox.Show("Bạn có thực sự muốn xóa kho này không?", "Xác nhận", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (dr == DialogResult.OK)
            {
                try
                {
                    maKho = ((DataRowView)bdsKho[bdsKho.Position])["MAKHO"].ToString(); // giữ lại mã kho để phòng trường hợp xóa lỗi
                    bdsKho.RemoveCurrent(); // xóa trên máy hiện tại trước
                    this.khoTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.khoTableAdapter.Update(this.dS.Kho); // update về csdl sau
                    this.btnUndo.Enabled = true;
                    MessageBox.Show("Xóa kho thành công!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xảy ra trong quá trình xóa. Vui lòng thử lại!\n" + ex.Message, "Thông báo lỗi",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                    this.khoTableAdapter.Fill(this.dS.Kho); // trên màn hình đã xóa mà csdl chưa xóa nên phải tải lại dữ liệu
                    // lệnh Find trả về index của item trong danh sách với giá trị và tên cột được chỉ định
                    bdsKho.Position = bdsKho.Find("MAKHO", maKho); // sau khi fill xong thì con nháy đứng ở dòng đầu tiên nên mình đặt lại theo mã kho ban nãy muốn xóa
                    return;
                }
            }
        }

        private void txtMaKho_Validating(object sender, CancelEventArgs e)
        {

            var regexItem = new Regex("^[a-zA-Z0-9 ]*$");
            if (string.IsNullOrWhiteSpace(txtMaKho.Text))
            {
                
                e.Cancel = true;
                txtMaKho.Focus();
                errorProvider1.SetError(txtMaKho, "Mã kho không được để trống!");
                return;
            }
            else if (txtMaKho.Text.Trim().Contains(" "))
            {
               
                e.Cancel = true;
                txtMaKho.Focus();
                errorProvider1.SetError(txtMaKho, "Mã kho không được chứa khoảng trắng!");
                return;
            }
            else if (!regexItem.IsMatch(txtMaKho.Text.Trim()))
            {
                
                e.Cancel = true;
                txtMaKho.Focus();
                errorProvider1.SetError(txtMaKho, "Mã kho không được chứa ký tự đặc biệt!");
                return;
            }
            else if (txtMaKho.Text.Length > 4)
            {
               
                e.Cancel = true;
                txtMaKho.Focus();
                errorProvider1.SetError(txtMaKho, "Mã kho không được quá 4 kí tự!");
                return;
            }
            else
            {
            
                e.Cancel = false;
                errorProvider1.SetError(txtMaKho, "");
            }
        }

        private void txtTenKho_Validating(object sender, CancelEventArgs e)
        {
            var regexItem = new Regex("^[a-zA-Z0-9 ]*$");
            if (string.IsNullOrWhiteSpace(txtTenKho.Text))
            {
                
                e.Cancel = true;
                txtTenKho.Focus();
                errorProvider1.SetError(txtTenKho, "Tên kho không được để trống!");
            }
            else if (!regexItem.IsMatch(txtTenKho.Text.Trim()))
            {
               
                e.Cancel = true;
                txtTenKho.Focus();
                errorProvider1.SetError(txtTenKho, "Tên kho không được chứa ký tự đặc biệt!");
            }
            else
            {
                
                e.Cancel = false;
                errorProvider1.SetError(txtTenKho, "");
            }
        }

        private void txtDiaChi_Properties_Validating(object sender, CancelEventArgs e)
        {
            var regexItem = new Regex("^[a-zA-Z0-9 ]*$");
            if (string.IsNullOrWhiteSpace(txtDiaChi.Text))
            {
               
                e.Cancel = true;
                txtDiaChi.Focus();
                errorProvider1.SetError(txtDiaChi, "Tên kho không được để trống!");
            }
            else if (!regexItem.IsMatch(txtDiaChi.Text.Trim()))
            {
              
                e.Cancel = true;
                txtDiaChi.Focus();
                errorProvider1.SetError(txtDiaChi, "Tên kho không được chứa ký tự đặc biệt!");
            }
            else
            {
               
                e.Cancel = false;
                errorProvider1.SetError(txtDiaChi, "");
            }
        }

        private void cmbChiNhanh_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbChiNhanh.SelectedValue.ToString() == "System.Data.DataRowView") return;

            
            Program.servername = cmbChiNhanh.SelectedValue.ToString();

           
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
            else
            {
                this.khoTableAdapter.Connection.ConnectionString = Program.connstr;
                this.khoTableAdapter.Fill(this.dS.Kho);
                this.datHangTableAdapter.Connection.ConnectionString = Program.connstr;
                this.datHangTableAdapter.Fill(this.dS.DatHang);
                this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
                this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);
                this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connstr;
                this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat);
                //maCN = ((DataRowView)bdsNhanVien[0])["MACN"].ToString();
            }
        }
    }
}
