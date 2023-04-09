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
    public partial class FormVatTu : Form
    {
        int position = 0;
        public FormVatTu()
        {
            InitializeComponent();
        }

        private void vattuBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsVT.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }
        private void reload()
        {
            try
            {
                this.vattuTableAdapter.Fill(this.dS.Vattu);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi Reload :" + ex.Message, "", MessageBoxButtons.OK);
                return;
            }
        }
        private void FormVatTu_Load(object sender, EventArgs e)
        {
            // Không kiểm tra khóa ngoại (nếu không sẽ hiện bảng cảnh báo)
            dS.EnforceConstraints = false;

            // TODO: This line of code loads data into the 'dS.Vattu' table. You can move, or remove it, as needed.
            this.vattuTableAdapter.Connection.ConnectionString = Program.connstr;
            this.vattuTableAdapter.Fill(this.dS.Vattu);

            this.cTDDHTableAdapter.Connection.ConnectionString = Program.connstr;
            this.cTDDHTableAdapter.Fill(this.dS.CTDDH);

            this.cTPNTableAdapter.Connection.ConnectionString = Program.connstr;
            this.cTPNTableAdapter.Fill(this.dS.CTPN);

            this.cTPXTableAdapter.Connection.ConnectionString = Program.connstr;
            this.cTPXTableAdapter.Fill(this.dS.CTPX);

            if (Program.mGroup == "CONGTY")
            {
                btnThoatThem.Enabled= btnThem.Enabled = btnXoa.Enabled = btnGhi.Enabled = false;
            }

            txtMaVT.Enabled = btnUndo.Enabled = false;

        }

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            position = bdsVT.Position;
            pNhapVT.Enabled = true;
            txtMaVT.Enabled = true;
            this.bdsVT.AddNew();

            btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = gcVT.Enabled = false;
            btnGhi.Enabled = btnUndo.Enabled = btnThoatThem.Enabled = true;
        }

        private void btnGhi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (ValidateChildren(ValidationConstraints.Enabled))
            {
                int checkMaVT = bdsVT.Find("MAVT", txtMaVT.Text);
                if (checkMaVT != -1 && (checkMaVT != bdsVT.Position))
                {
                    MessageBox.Show("Mã vật tư trùng. Vui lòng chọn tên vật tư khác!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                int checkTenVT = bdsVT.Find("TENVT", txtTenVT.Text);
                if (checkTenVT != -1 && (checkTenVT != bdsVT.Position))
                {
                    MessageBox.Show("Tên  vật tư trùng. Vui lòng chọn tên vật tư khác!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                DialogResult dr = MessageBox.Show("Bạn có chắc muốn ghi dữ liệu vào Database không?", "Thông báo",
                        MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (dr == DialogResult.OK)
                {
                    try
                    {
                        bdsVT.EndEdit(); // kết thúc quá trình hiệu chỉnh và ghi vào BindingSource
                        bdsVT.ResetCurrentItem(); // đưa thông tin vào grid
                        this.vattuTableAdapter.Connection.ConnectionString = Program.connstr; // đường kết nối đã đăng nhập
                        this.vattuTableAdapter.Update(this.dS.Vattu); // update xuống csdl

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
                gcVT.Enabled = true;
                pNhapVT.Enabled = true;

            }
        }

        private void txtMaVT_Validating(object sender, CancelEventArgs e)
        {
            var regexItem = new Regex("^[a-zA-Z0-9 ]*$");

            if (string.IsNullOrWhiteSpace(txtMaVT.Text))
            {
                e.Cancel = true;
                txtMaVT.Focus();
                errorProvider1.SetError(txtMaVT, "Mã vật tư không được để trống!");
            }
            else if (txtMaVT.Text.Trim().Contains(" "))
            {
                e.Cancel = true;
                txtMaVT.Focus();
                errorProvider1.SetError(txtMaVT, "Mã vật tư không được chứa khoảng trắng!");
            }
            else if (!regexItem.IsMatch(txtMaVT.Text.Trim()))
            {

                e.Cancel = true;
                txtMaVT.Focus();
                errorProvider1.SetError(txtMaVT, "Mã Vật tư không được chứa ký tự đặc biệt!");
                return;
            }
            else if (txtMaVT.Text.Length > 4)
            {

                e.Cancel = true;
                txtMaVT.Focus();
                errorProvider1.SetError(txtMaVT, "Mã Vật tư không được quá 4 kí tự!");
                return;
            }
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(txtMaVT, "");
            }
        }

        private void txtTenVT_Validating(object sender, CancelEventArgs e)
        {
            var regexItem = new Regex("^[a-zA-Z0-9 ]*$");

            if (string.IsNullOrWhiteSpace(txtTenVT.Text))
            {
                e.Cancel = true;
                txtTenVT.Focus();
                errorProvider1.SetError(txtTenVT, "Tên vật tư không được để trống!");
            }
            else if (!regexItem.IsMatch(txtTenVT.Text.Trim()))
            {

                e.Cancel = true;
                txtTenVT.Focus();
                errorProvider1.SetError(txtTenVT, "Tên Vật tư không được chứa ký tự đặc biệt!");
                return;
            }
            else if (txtTenVT.Text.Length > 30)
            {

                e.Cancel = true;
                txtTenVT.Focus();
                errorProvider1.SetError(txtTenVT, "Tên Vật Tư không được quá 30 kí tự!");
                return;
            }
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(txtTenVT, "");
            }
        }

        private void txtDVT_Validating(object sender, CancelEventArgs e)
        {
            var regexItem = new Regex("^[a-zA-Z0-9 ]*$");
            if (string.IsNullOrWhiteSpace(txtDVT.Text))
            {
                e.Cancel = true;
                txtDVT.Focus();
                errorProvider1.SetError(txtDVT, "Đơn vị tính không được để trống!");
            }
            else if (!regexItem.IsMatch(txtDVT.Text.Trim()))
            {

                e.Cancel = true;
                txtDVT.Focus();
                errorProvider1.SetError(txtDVT, "Đơn vị tính không được chứa ký tự đặc biệt!");
                return;
            }
            else if (txtDVT.Text.Length > 15)
            {

                e.Cancel = true;
                txtDVT.Focus();
                errorProvider1.SetError(txtDVT, "Đơn vị tính không được quá 15 kí tự!");
                return;
            }
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(txtDVT, "");
            }
        }

        private void SLT_Validating(object sender, CancelEventArgs e)
        {
            if (SLT.Value == 0)
            {
                e.Cancel = true;
                SLT.Focus();
                errorProvider1.SetError(SLT, "Vui lòng chọn số lượng tồn!");
            }
            else if (SLT.Value < 0)
            {
                e.Cancel = true;
                SLT.Focus();
                errorProvider1.SetError(SLT, "Số lượng tồn phải là số dương!");
            }
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(SLT, "");
            }
        }

        private void btnThoatThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = gcVT.Enabled =pNhapVT.Enabled=true;
            btnGhi.Enabled  =btnThoatThem.Enabled= false;

            reload();
        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (bdsVT.Count == 0)
            {
                btnXoa.Enabled = false;
            }
            String maVT = "";
            DialogResult dr = MessageBox.Show("Bạn có chắc chắn muốn xóa vật tư này?", "Xác nhận",
                MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (dr == DialogResult.OK)
            {
                if (bdsCTDDH.Count > 0)
                {
                    MessageBox.Show("Không thể xóa vật tư này vì đã lập đơn đặt hàng", "Thông báo", MessageBoxButtons.OK);
                    return;
                }
                // đã có trong phiếu nhập
                if (bdsCTPN.Count > 0)
                {
                    MessageBox.Show("Không thể xóa vật tư này vì đã lập phiếu nhập", "Thông báo", MessageBoxButtons.OK);
                    return;
                }
                // đã có ở phiếu xuất
                if (bdsCTPX.Count > 0)
                {
                    MessageBox.Show("Không thể xóa vật tư này vì đã lập phiếu xuất", "Thông báo", MessageBoxButtons.OK);
                    return;
                }
                String strLenh = "DECLARE @return_value int " +
                               "EXEC @return_value = [dbo].[SP_CHECK_MAVT]" +
                               "'" + txtMaVT.Text.Trim() + "' " +
                               "SELECT 'Return Value' = @return_value";

                try
                {
                    Program.myReader = Program.ExecSqlDataReader(strLenh);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Thực thi database thất bại!\n" + ex.Message, "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                
                Program.myReader.Read();
                int result = int.Parse(Program.myReader.GetValue(0).ToString());// result ==2 đã tồn tại ở CN khác,result==0 chua ton tai
                Program.myReader.Close();
                if (Program.myReader == null) return;
                if (result == 2)
                {
                    MessageBox.Show("Vật tư đang được sử dụng ở chi nhánh khác!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (MessageBox.Show("Bạn có chắc chắn muốn xóa không ?", "Thông báo",
                MessageBoxButtons.OKCancel) == DialogResult.OK)
                {
                    try
                    {
                        // lưu lại vị trí xóa nếu xảy ra vấn đề nếu tí nữa chạy lỗi
                        position = bdsVT.Position;
                        // xóa trên view
                        bdsVT.RemoveCurrent();
                        // bước cập nhật thông tin
                        this.vattuTableAdapter.Connection.ConnectionString = Program.connstr;
                        this.vattuTableAdapter.Update(this.dS.Vattu);
                        MessageBox.Show("Xóa thành công ", "Thông báo", MessageBoxButtons.OK);
                        this.btnUndo.Enabled = true;
                        // lưu vị trí và câu lệnh hoàn tác
                      

                    }
                    catch (Exception ex)
                    {

                        MessageBox.Show("Lỗi xóa vật tư. Hãy thử lại\n" + ex.Message, "Thông báo", MessageBoxButtons.OK);
                        this.vattuTableAdapter.Fill(this.dS.Vattu);
                        // trở về vị trí nãy vừa bị lỗi
                        bdsVT.Position = position;
                        return;
                    }
                }
            }
        }

        private void btnReload_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            reload();
        }
    }
}
