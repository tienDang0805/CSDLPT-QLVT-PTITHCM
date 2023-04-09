using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSDLPT_QLVT
{
    public partial class FormNhanVien : Form
    {
        int position = 0;
        string maCN = "";
        Stack undoList = new Stack();
        string tenServerChuyenToi = "";
        public static String serverMoi = "";
        string serverNameHT = "";
        public FormNhanVien()
        {
            InitializeComponent();
        }

        private void barButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)//btnXoa
        {
            string maNV = "";

            if (cbTrangThaiXoa.Checked == true)
            {
                MessageBox.Show("Nhân viên đã bị xóa, đang ở chi nhánh khác", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (bdsDH.Count > 0)
            {
                MessageBox.Show("Không thể xóa nhân viên vì đã lập đơn đặt hàng", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (bdsPN.Count > 0)
            {
                MessageBox.Show("Không thể xóa nhân viên vì đã lập phiếu nhập", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (bdsPX.Count > 0)
            {
                MessageBox.Show("Không thể xóa nhân viên vì đã lập phiếu xuất", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            DateTime ngaySinh = (DateTime)((DataRowView)bdsNhanVien[bdsNhanVien.Position])["NGAYSINH"];
            txtNgaysinh.Properties.Mask.EditMask = "dd-MM-yyyy";
            txtNgaysinh.Properties.Mask.UseMaskAsDisplayFormat = true;
            int trangThai = (cbTrangThaiXoa.Checked == true) ? 1 : 0;
            string StrLenhUndo = "Insert into dbo.NhanVien (MANV,HO,TEN,DIACHI,NGAYSINH,LUONG,MACN,TrangThaiXoa) Values (" +txtMaNV.Text+",'"+txtHo.Text+"','" + txtTen.Text + "','" + txtDiaChi.Text + "','" + ngaySinh.ToString("yyyy-MM-dd") + "'," + txtLuong.Value+ ",'" + txtCN.Text.Trim() + "',"+ trangThai+")";
            undoList.Push(StrLenhUndo);
            Console.WriteLine(StrLenhUndo);
            DialogResult dr = MessageBox.Show("Bạn có thực sự muốn xóa nhân viên này không?", "Xác nhận",
                MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (dr == DialogResult.OK)
            {
                try
                {
                    maNV = ((DataRowView)bdsNhanVien[bdsNhanVien.Position])["MANV"].ToString();
                    Program.mlogin = Program.remoteLogin;
                    Program.password = Program.remotePassword;
                    if (Program.KetNoi() == 0)
                        MessageBox.Show("Lỗi kết nối về chi nhánh mới", "", MessageBoxButtons.OK);

                    if (Program.username == maNV) {
                        MessageBox.Show("Không thể xóa chính mình ", "", MessageBoxButtons.OK);
                        return;
                    }
                    String strLenh = "DECLARE @return_value int " +
                                 "EXEC @return_value = [dbo].[Xoa_Login] " +
                                    "@USRNAME=N'"+maNV+"'"+
                                 "SELECT 'Return Value' = @return_value";
                    Program.myReader = Program.ExecSqlDataReader(strLenh);
                    SqlDataReader myReader = null;
                    
                    bdsNhanVien.RemoveCurrent();
                    btnUndo.Enabled = true;
                    this.nhanVienTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.nhanVienTableAdapter.Update(this.dS.NhanVien); // update về csdl sau
                    MessageBox.Show("Xóa nhân viên thành công!", "Thông báo",
                       MessageBoxButtons.OK, MessageBoxIcon.Information);

                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xảy ra trong quá trình xóa. Vui lòng thử lại!\n" + ex.Message, "Thông báo lỗi",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                    this.nhanVienTableAdapter.Fill(this.dS.NhanVien);
                    bdsNhanVien.Position = bdsNhanVien.Find("MANV", maNV);
                    undoList.Pop();
                    return;
                }
            }
            if (bdsNhanVien.Count == 0)
            {
                btnXoa.Enabled = false;
                MessageBox.Show("Danh sách trống!", "Thông báo lỗi",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void barButtonItem3_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void FormNhanVien_Load(object sender, EventArgs e)
        {
             dS.EnforceConstraints = false;
            this.nhanVienTableAdapter.Connection.ConnectionString = Program.connstr;
            this.nhanVienTableAdapter.Fill(this.dS.NhanVien);

            this.datHangTableAdapter.Connection.ConnectionString = Program.connstr;
            this.datHangTableAdapter.Fill(this.dS.DatHang);

            this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
            this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);

            this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connstr;
            this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat);

            maCN = ((DataRowView)bdsNhanVien[0])["MACN"].ToString(); // Lúc đúng lúc sai, tìm cách khác.
            cmbChiNhanh.DataSource = Program.dbs_dspm;  // sao chép bds_dspm đã load ở form đăng nhập  qua
            cmbChiNhanh.DisplayMember = "TENCN";
            cmbChiNhanh.ValueMember = "TENSERVER";
            cmbChiNhanh.SelectedIndex = Program.mChinhanh;
            //Phan Quyen
            if (Program.mGroup == "CONGTY")
            {
                cmbChiNhanh.Enabled = true;  // bật tắt theo phân quyền
                btnChuyenCN.Enabled= btnThoatThem.Enabled=btnThem.Enabled = btnXoa.Enabled = btnGhi.Enabled = btnThoatThem.Enabled = btnUndo.Enabled = false;

            }
            else {
                cmbChiNhanh.Enabled = false;  
                btnThem.Enabled = btnXoa.Enabled = btnThoatThem.Enabled = btnUndo.Enabled = true;
            }
            btnThoatThem.Enabled = btnGhi.Enabled=false;




        }
        private void reload() {
            try
            {
                this.nhanVienTableAdapter.Fill(this.dS.NhanVien);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi Reload :" + ex.Message, "", MessageBoxButtons.OK);
                return;
            }
        }
        private void nhanVienBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsNhanVien.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void dIACHILabel_Click(object sender, EventArgs e)
        {

        }

        private void dIACHITextEdit_EditValueChanged(object sender, EventArgs e)
        {

        }

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            position = bdsNhanVien.Position;
            PanelThongTinNV.Enabled = true;
            bdsNhanVien.AddNew();
            txtCN.Text = maCN;
            txtNgaysinh.EditValue = "";
            cbTrangThaiXoa.Checked = false;
            cbTrangThaiXoa.Enabled = false;

            btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = nhanVienGridControl.Enabled = false;
            btnGhi.Enabled = btnUndo.Enabled = btnThoatThem.Enabled=true;
        }

        private void btnUndo_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (btnThem.Enabled == false)
            {
                bdsNhanVien.CancelEdit();
                bdsNhanVien.RemoveCurrent(); // xóa record đang thêm dở dang đi
                nhanVienGridControl.Enabled = true;
                PanelThongTinNV.Enabled = false;
                btnThem.Enabled = btnXoa.Enabled =  btnReload.Enabled = btnThoat.Enabled  = true;
                btnGhi.Enabled = false;
                if (undoList.Count == 0)
                {
                    btnUndo.Enabled = false;
                }

                return;
            }
            if (undoList.Count == 0)
            {
                MessageBox.Show("Không còn thao tác nào để khôi phục", "Thông báo", MessageBoxButtons.OK);
                btnUndo.Enabled = false;
                return;
            }
            bdsNhanVien.CancelEdit();
            String strLenhUndo = undoList.Pop().ToString();
            if (strLenhUndo.Contains("sp_ChuyenChiNhanh"))
            {
               
                Program.servername = tenServerChuyenToi;
                Program.mlogin = Program.remoteLogin;
                Program.password = Program.remotePassword;

                if (Program.KetNoi() == 0)
                {
                    MessageBox.Show("Lỗi kết nối về chi nhánh mới", "Error", MessageBoxButtons.OK);
                    return;
                }

                int n = Program.ExecSqlNonQuery(strLenhUndo);

                if (n == 0)
                {
                    MessageBox.Show("Chuyển nhân viên trở lại thành công", "Thông báo", MessageBoxButtons.OK);
                    this.nhanVienTableAdapter.Fill(this.dS.NhanVien);
                }
                else
                    MessageBox.Show("Chuyển nhân viên thất bại!", "Thông báo", MessageBoxButtons.OK);

                Program.servername = Program.serverNameHT;
                Program.mlogin = Program.mloginDN;
                Program.password = Program.passwordDN;
                if (Program.KetNoi() == 0)
                {
                    MessageBox.Show("Lỗi kết nối về chi nhánh mới", "Error", MessageBoxButtons.OK);
                    return;
                }
            }
            else
            {
                if (Program.KetNoi() == 0)
                    return;
                int n = Program.ExecSqlNonQuery(strLenhUndo);
                reload();
                bdsNhanVien.Position = position;
            }

            // Nếu sau khi undo mà danh sách undoList trống thì disable nút undo đi
            if (undoList.Count == 0)
            {
                btnUndo.Enabled = false;
                return;
            }
        }

        private void btnReload_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                this.nhanVienTableAdapter.Fill(this.dS.NhanVien);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi Reload :" + ex.Message, "", MessageBoxButtons.OK);
                return;
            }
        }

        private void btnGhi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            String strLenhUndo = "";
            if (ValidateChildren(ValidationConstraints.Enabled))
            {
                int viTriMaNV = bdsNhanVien.Find("MANV", txtMaNV.Text);
                if (viTriMaNV != -1)
                {
                    MessageBox.Show("Mã nhân viên này đã được sử dụng!", "Thông báo", MessageBoxButtons.OK);

                    return;
                }

                String strLenh = "DECLARE @return_value int " +
                                 "EXEC @return_value = [dbo].[SP_CHECKID_TRACUU] " +
                                 txtMaNV.Text.Trim() + ", 'MANV' " +
                                 "SELECT 'Return Value' = @return_value";
                Program.myReader = Program.ExecSqlDataReader(strLenh);
                if (Program.myReader == null) return;

                Program.myReader.Read();
                int result = int.Parse(Program.myReader.GetValue(0).ToString());
                Program.myReader.Close();

                if (result == 1)
                {
                    MessageBox.Show("Mã nhân viên này đã được sử dụng!", "Thông báo", MessageBoxButtons.OK);
                    Console.WriteLine("Mã nhân viên này đã được sử dụng!");
                    return;
                }
                try
                {
                    bdsNhanVien.EndEdit(); // kết thúc quá trình hiệu chỉnh và ghi vào BindingSource
                    bdsNhanVien.ResetCurrentItem(); // đưa thông tin vào grid
                    this.nhanVienTableAdapter.Connection.ConnectionString = Program.connstr; // đường kết nối đã đăng nhập
                    this.nhanVienTableAdapter.Update(this.dS.NhanVien); // update xuống csdl

                    MessageBox.Show("Ghi nhân viên thành công!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    btnUndo.Enabled = true;
                    //undoList.Push(strLenhUndo);
                    //checkThem = 0;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xảy ra trong quá trình ghi nhân viên. Vui lòng thử lại!\n" + ex.Message, "Thông báo lỗi",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                    // Khi Update database lỗi thì xóa record vừa thêm trong bds
                    //bdsNV.RemoveCurrent();

                    return;
                }
            }
            strLenhUndo = "DELETE DBO.NHANVIEN WHERE MANV = " + txtMaNV.Text.Trim();
            undoList.Push(strLenhUndo);
            btnThem.Enabled = btnXoa.Enabled  = btnReload.Enabled = btnThoat.Enabled = true;
            btnGhi.Enabled = false;
            nhanVienGridControl.Enabled = true;
            PanelThongTinNV.Enabled = true;
        }

        private void btnInDSNV_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void cmbChiNhanh_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Trường hợp chưa kịp chọn CN, thuộc tính index ở combobox sẽ thay đổi
            // "System.Data.DataRowView" sẽ xuất hiện và tất nhiên hệ thống sẽ không thể
            // nhận diện được tên server "System.Data.DataRowView".
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
            else
            {
                this.nhanVienTableAdapter.Connection.ConnectionString = Program.connstr;
                this.nhanVienTableAdapter.Fill(this.dS.NhanVien);
                this.datHangTableAdapter.Connection.ConnectionString = Program.connstr;
                this.datHangTableAdapter.Fill(this.dS.DatHang);
                this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
                this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);
                //maCN = ((DataRowView)bdsNhanVien[0])["MACN"].ToString();
            }
        }

        private void btnHieuChinh_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = nhanVienGridControl.Enabled = true;
            btnGhi.Enabled = PanelThongTinNV.Enabled=false;
            reload();
        }

        private void PanelThongTinNV_Paint(object sender, PaintEventArgs e)
        {

        }

        private void barButtonItem2_ItemClick_1(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            int trangThaiXoa = int.Parse(((DataRowView)(bdsNhanVien[bdsNhanVien.Position]))["TrangThaiXoa"].ToString());
            string maNV = ((DataRowView)(bdsNhanVien[bdsNhanVien.Position]))["MANV"].ToString();
            if (maNV == Program.username)
            {
                MessageBox.Show("Không thể chuyển chính người đang đăng nhập!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // Nhân viên đã bị xóa
            if (trangThaiXoa == 1)
            {
                MessageBox.Show("Nhân viên này không có ở chi nhánh này", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            Form f = this.CheckExists(typeof(subFormChuyenCN));
            if (f != null)
            {
                f.Activate();
            }
            subFormChuyenCN form = new subFormChuyenCN();
            form.ShowDialog();

            if (!serverMoi.Equals(""))
                chuyenChiNhanh(serverMoi);
        }
        private Form CheckExists(Type ftype)
        {
            foreach (Form f in this.MdiChildren)
                if (f.GetType() == ftype)
                    return f;
            return null;
        }
        public void chuyenChiNhanh(String server)
        {
            String maChiNhanhMoi = "";

            if (server.Contains("1"))
                maChiNhanhMoi = "CN2";

            else if (server.Contains("2"))
                maChiNhanhMoi = "CN1";

            else
            {
                MessageBox.Show("Mã chi nhánh không hợp lệ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            int position = bdsNhanVien.Position;
            String maNhanVien = ((DataRowView)bdsNhanVien[position])["MANV"].ToString();

            // tạo chuỗi lệnh để chuyển nhân viên đến chi nhánh mới
            String strLenh = "EXEC sp_ChuyenChiNhanh " + maNhanVien + ",'" + maChiNhanhMoi + "'";
            int n = Program.ExecSqlNonQuery(strLenh);
            if (n == 0)
            {

                MessageBox.Show("Chuyển chi nhánh thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                //btnUndo.Enabled = true;
                this.nhanVienTableAdapter.Fill(this.dS.NhanVien);
                return;
            }
        }

        private void txtMaNV_Validating(object sender, CancelEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtMaNV.Text))
            {
                e.Cancel = true;
                txtMaNV.Focus();
                errorProvider1.SetError(txtMaNV, "Mã nhân viên không được để trống!");
            }
            else if (txtMaNV.Text.Trim().Contains(" "))
            {
                e.Cancel = true;
                txtMaNV.Focus();
                errorProvider1.SetError(txtMaNV, "Mã nhân viên không được chứa khoảng trắng!");
            }
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(txtMaNV, "");
            }
        }

        private void txtMaNV_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void txtLuong_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
            (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // only allow one decimal point
            if ((e.KeyChar == '.') && ((sender as TextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }
        }

        private void txtHo_Validating(object sender, CancelEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtHo.Text))
            {
                e.Cancel = true;
                txtHo.Focus();
                errorProvider1.SetError(txtHo, "Họ nhân viên không được để trống!");
            }
            else if (txtHo.Text.Trim().Any(ch => !Char.IsLetterOrDigit(ch)))
            {
                e.Cancel = true;
                txtHo.Focus();
                errorProvider1.SetError(txtHo, "Họ nhân viên không được chứa ký tự đặc biệt!");
            }
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(txtHo, "");
            }
        }

        private void txtTen_Validating(object sender, CancelEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTen.Text))
            {
                e.Cancel = true;
                txtTen.Focus();
                errorProvider1.SetError(txtTen, "Tên nhân viên không được để trống!");
            }
            else if (txtTen.Text.Trim().Any(ch => !Char.IsLetterOrDigit(ch)))
            {
                e.Cancel = true;
                txtTen.Focus();
                errorProvider1.SetError(txtTen, "Tên nhân viên không được chứa ký tự đặc biệt!");
            }
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(txtTen, "");
            }
        }
        private static int CalculateAge(DateTime dateOfBirth)
        {
            int age = 0;
            age = DateTime.Now.Year - dateOfBirth.Year;
            if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
                age = age - 1;

            return age;
        }
        private void txtDiaChi_Validating(object sender, CancelEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDiaChi.Text))
            {
                e.Cancel = true;
                txtDiaChi.Focus();
                errorProvider1.SetError(txtDiaChi, "Địa chỉ không được để trống!");
            }
            
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(txtDiaChi, "");
            }
        }

        private void txtNgaysinh_Validating(object sender, CancelEventArgs e)
        {
            if (CalculateAge(txtNgaysinh.DateTime) > 60)
            {
                e.Cancel = true;
                txtNgaysinh.Focus();
                errorProvider1.SetError(txtNgaysinh, "Ngày sinh không hợp lệ!");
            }
            else if (CalculateAge(txtNgaysinh.DateTime) < 18)
            {
                e.Cancel = true;
                txtNgaysinh.Focus();
                errorProvider1.SetError(txtNgaysinh, "Nhân viên phải lớn hơn hoặc bằng 18 tuổi!");
            }
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(txtNgaysinh, "");
            }
        }

        private void txtNgaysinh_EditValueChanged(object sender, EventArgs e)
        {

        }
    }
}
