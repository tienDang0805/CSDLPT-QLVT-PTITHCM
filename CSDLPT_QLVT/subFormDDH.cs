using DevExpress.XtraEditors;
using DevExpress.XtraGrid;
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
    public partial class subFormDDH : Form
    {
        int checkThem = 0;
        int position = 0; // vị trí trên grid view
        int cheDo = 1; // 1: thao tác trên đơn hàng, 2: thao tác trên chi tiết đơn hàng

        BindingSource bds = null;
        GridControl gc = null;
        PanelControl info = null;
        public subFormDDH()
        {
            InitializeComponent();
        }

        private void datHangBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsDDH.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void subFormDDH_Load(object sender, EventArgs e)
        {
            
            
            dS.EnforceConstraints = false; //không kiểm tra khóa ngoại trên dataset này

            
            this.vattuTableAdapter.Connection.ConnectionString = Program.connstr;
            this.vattuTableAdapter.Fill(this.dS.Vattu);

            
            this.khoTableAdapter.Connection.ConnectionString = Program.connstr;
            this.khoTableAdapter.Fill(this.dS.Kho);

            
            this.datHangTableAdapter.Connection.ConnectionString = Program.connstr;
            this.datHangTableAdapter.Fill(this.dS.DatHang);

           
            this.cTDDHTableAdapter.Connection.ConnectionString = Program.connstr;
            this.cTDDHTableAdapter.Fill(this.dS.CTDDH);

           
            this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
            this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);

            cmbChiNhanh.DataSource = Program.dbs_dspm;  // sao chép bds_dspm đã load ở form đăng nhập qua
            cmbChiNhanh.DisplayMember = "TENCN";
            cmbChiNhanh.ValueMember = "TENSERVER";
            cmbChiNhanh.SelectedIndex = Program.mChinhanh;
            Console.WriteLine("Don dat hang");
            cheDo = 1;
            bds = bdsDDH;
            gc = gcDDH;
            info = pNhapDDH;

            if (Program.mGroup == "CONGTY")
            {
                cmbChiNhanh.Enabled = btnReload.Enabled = true;  // bật tắt theo phân quyền
                btnThem.Enabled = btnXoa.Enabled = btnGhi.Enabled = btnUndo.Enabled = false;

            }
            else
            {
                cmbChiNhanh.Enabled = btnUndo.Enabled = btnGhi.Enabled = false;
                btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = true;
            }
            btnDDH.Enabled = false;
        }

        private void gcCTDDH_Click(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void cmbKho_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbKho.SelectedValue == null) return;

            txtMaKho.Text = cmbKho.SelectedValue.ToString();
        }

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (cheDo == 2)
            {
                if (txtMaNV.Text != Program.username)
                {
                    
                    XtraMessageBox.Show("Không thể thêm chi tiết đơn hàng trên phiếu người khác lập", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    btnThoatThem.Enabled=btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = gcCTDDH.Enabled = pNhapCTDDH.Enabled = gcDDH.Enabled = pNhapDDH.Enabled = true;
                    btnGhi.Enabled = btnThoatThem.Enabled = false;
                    btnCTDDH.Enabled = true;
                    btnDDH.Enabled = false;
                    cheDo = 1;
                    return;
                }

                if (bdsPN.Count > 0)
                {
                    
                 
                    btnThoatThem.Enabled = btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = gcCTDDH.Enabled = pNhapCTDDH.Enabled = gcDDH.Enabled = pNhapDDH.Enabled = true;
                    btnGhi.Enabled = btnThoatThem.Enabled = false;
                    XtraMessageBox.Show("Không thể sửa vì đơn hàng đã được lập phiếu nhập", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    cheDo = 1;
                    return;
                }
            }
           
           

            // đặt các giá trị mặc định
            if (cheDo == 1)
            {
                position = bdsDDH.Position;
                pNhapDDH.Enabled = true;
                bdsDDH.AddNew();
                txtMaDDH.Text = "";
                txtNgay.EditValue = DateTime.Now; // ngày hiện hành
                txtNgay.Enabled = false;

                txtNhaCC.Text = "";
                txtMaNV.Text = Program.username;
                txtMaNV.Enabled = false;

                btnThoatThem.Enabled = gcDDH.Enabled = pNhapDDH.Enabled = true;
               gcCTDDH.Enabled = pNhapCTDDH.Enabled = false;
            }
            else if (cheDo == 2)
            {
                position = bdsCTDDH.Position;
                pNhapCTDDH.Enabled = true;
                bdsCTDDH.AddNew();
                txtMaDDH1.Text = txtMaDDH.Text;
                txtSoLuong.Value = 0;
                txtDonGia.Value = 0;
                gcDDH.Enabled = pNhapDDH.Enabled = false;
                btnThoatThem.Enabled=gcCTDDH.Enabled = pNhapCTDDH.Enabled = true;
            }

            // vô hiệu hóa các nút chức năng
            btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = false;
            btnGhi.Enabled = btnUndo.Enabled = true;
            gc.Enabled = false;
        }

        private void mANVTextEdit_EditValueChanged(object sender, EventArgs e)
        {

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
                XtraMessageBox.Show("Lỗi kết nối về chi nhánh mới", "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            else
            {
                this.vattuTableAdapter.Connection.ConnectionString = Program.connstr;
                this.vattuTableAdapter.Fill(this.dS.Vattu);
                this.khoTableAdapter.Connection.ConnectionString = Program.connstr;
                this.khoTableAdapter.Fill(this.dS.Kho);
                this.datHangTableAdapter.Connection.ConnectionString = Program.connstr;
                this.datHangTableAdapter.Fill(this.dS.DatHang);
                this.cTDDHTableAdapter.Connection.ConnectionString = Program.connstr;
                this.cTDDHTableAdapter.Fill(this.dS.CTDDH);
                this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
                this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);

            }
        }

        private void btnGhi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (ValidateChildren(ValidationConstraints.Enabled))
            {
                try { 
                //bds.EndEdit(); // kết thúc quá trình hiệu chỉnh và ghi vào BindingSource
               // bds.ResetCurrentItem(); // đưa thông tin vào grid
                    if (cheDo == 1)
                    {
                        String strLenh = "DECLARE @return_value int " +
                                        "EXEC @return_value = [dbo].[sp_Kiem_Tra_MasoDDH] '" +
                                        txtMaDDH.Text.Trim() + "' " +
                                        "SELECT 'Return Value' = @return_value";
                        Program.myReader = Program.ExecSqlDataReader(strLenh);
                        if (Program.myReader == null) return;

                        Program.myReader.Read();
                        int result = int.Parse(Program.myReader.GetValue(0).ToString());
                        Program.myReader.Close();

                        if (result == 1)
                        {
                            XtraMessageBox.Show("Mã đơn hàng này đã được sử dụng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            txtMaDDH.Focus();
                            return;
                        }
                        bdsDDH.EndEdit(); // kết thúc quá trình hiệu chỉnh và ghi vào BindingSource
                        bdsDDH.ResetCurrentItem(); // đưa thông tin vào grid

                        this.datHangTableAdapter.Connection.ConnectionString = Program.connstr; // đường kết nối đã đăng nhập
                        this.datHangTableAdapter.Update(this.dS.DatHang); // update xuống csdl

                    }
                    else {
                        String strLenh = "DECLARE @return_value int " +
                                "EXEC @return_value = [dbo].[sp_Kiem_Tra_CTDDH] '" +
                                txtMaDDH.Text.Trim() + "', '" + txtMaVT.Text.Trim() + "' " +
                                "SELECT 'Return Value' = @return_value";
                        Program.myReader = Program.ExecSqlDataReader(strLenh);
                        if (Program.myReader == null) return;

                        Program.myReader.Read();
                        int result = int.Parse(Program.myReader.GetValue(0).ToString());
                        Program.myReader.Close();
                        if (result == 1)
                        {
                            XtraMessageBox.Show("Vật tư này đã có trong đơn đặt hàng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            return ;
                        }
                        bdsCTDDH.EndEdit(); // kết thúc quá trình hiệu chỉnh và ghi vào BindingSource
                        bdsCTDDH.ResetCurrentItem();
                        this.cTDDHTableAdapter.Connection.ConnectionString = Program.connstr; // đường kết nối đã đăng nhập
                        this.cTDDHTableAdapter.Update(this.dS.CTDDH); // update xuống csdl
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xảy ra trong quá trình ghi thông tin kho. Vui lòng thử lại!\n" + ex.Message, "Thông báo lỗi",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);

                    reload();
                    return;
                }
            }
            btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = gcCTDDH.Enabled = pNhapCTDDH.Enabled = gcDDH.Enabled = pNhapDDH.Enabled = true;
            btnGhi.Enabled = btnThoatThem.Enabled = false;
        }

        private void btnCTDDH_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            cheDo = 2;
            //bds = bdsCTDDH;
            //gc = gcCTDDH;
           // info = pNhapCTDDH;
            pNhapCTDDH.Enabled = false;
            btnCTDDH.Enabled= gcDDH.Enabled = pNhapDDH.Enabled = false;
            btnReload.Enabled=   btnGhi.Enabled = btnDDH.Enabled = gcCTDDH.Enabled =true;
        }

        private void btnDDH_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            cheDo = 1;
            //bds = bdsDDH;
            //gc = gcDDH;
           // info = pNhapDDH;
            btnReload.Enabled = btnCTDDH.Enabled = gcDDH.Enabled = pNhapDDH.Enabled = true;
            btnDDH.Enabled = gcCTDDH.Enabled = pNhapCTDDH.Enabled = false;
        }
        private void reload()
        {
            try
            {
                this.vattuTableAdapter.Fill(this.dS.Vattu);
                this.khoTableAdapter.Fill(this.dS.Kho);
                this.datHangTableAdapter.Fill(this.dS.DatHang);
                this.cTDDHTableAdapter.Fill(this.dS.CTDDH);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi Reload :" + ex.Message, "", MessageBoxButtons.OK);
                return;
            }
        }
        private void btnThoatThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = gcCTDDH.Enabled = pNhapCTDDH.Enabled =gcDDH.Enabled=pNhapDDH.Enabled= true;
            btnGhi.Enabled = btnThoatThem.Enabled = false;

            reload();
        }

        private void cmbVatTu_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbVatTu.SelectedValue == null) return;

            txtMaVT.Text = cmbVatTu.SelectedValue.ToString();
        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (cheDo == 1)
            {
                if (txtMaNV.Text != Program.username)
                {
                    XtraMessageBox.Show("Không thể xóa đơn hàng người khác lập", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (bdsCTDDH.Count > 0)
                {
                    XtraMessageBox.Show("Không thể xóa vì đơn hàng đã được lập chi tiết đơn đặt hàng", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                if (bdsPN.Count > 0)
                {
                    XtraMessageBox.Show("Không thể xóa vì đơn hàng đã được lập phiếu nhập", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                DateTime ngay = (DateTime)((DataRowView)bds[bds.Position])["NGAY"];
                
            }
            if (cheDo == 2)
            {
                if (txtMaNV.Text != Program.username)
                {
                    XtraMessageBox.Show("Không thể xóa chi tiết đơn hàng trên phiếu người khác lập", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                if (bdsPN.Count > 0)
                {
                    XtraMessageBox.Show("Không thể sửa vì đơn hàng đã được lập phiếu nhập", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                

            }
            DialogResult dr = XtraMessageBox.Show("Bạn có thực sự muốn xóa không?", "Xác nhận", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (dr == DialogResult.OK)
            {
                int currentPosition = -1;
                try
                {
                    currentPosition = bds.Position; // giữ lại vị trí grid để phòng trường hợp xóa lỗi
                    bds.RemoveCurrent(); // xóa trên máy hiện tại trước
                    if (cheDo == 1)
                    {
                        this.datHangTableAdapter.Connection.ConnectionString = Program.connstr; // đường kết nối đã đăng nhập
                        this.datHangTableAdapter.Update(this.dS.DatHang); // update xuống csdl
                    }
                    else
                    {
                        this.cTDDHTableAdapter.Connection.ConnectionString = Program.connstr; // đường kết nối đã đăng nhập
                        this.cTDDHTableAdapter.Update(this.dS.CTDDH); // update xuống csdl   
                    }
                    this.btnUndo.Enabled = true;

                    XtraMessageBox.Show("Xóa thành công!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    XtraMessageBox.Show("Lỗi xảy ra trong quá trình xóa. Vui lòng thử lại!\n" + ex.Message, "Thông báo lỗi",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                    if (cheDo == 1)
                        this.datHangTableAdapter.Fill(this.dS.DatHang); // trên màn hình đã xóa mà csdl chưa xóa nên phải tải lại dữ liệu
                    if (cheDo == 1)
                        this.cTDDHTableAdapter.Fill(this.dS.CTDDH);
                    // lệnh Find trả về index của item trong danh sách với giá trị và tên cột được chỉ định
                    bds.Position = currentPosition; // sau khi fill xong thì con nháy đứng ở dòng đầu tiên nên mình đặt lại theo vị trí ban nãy muốn xóa

                    return;
                }
            }
        }

        private void txtMaDDH_Validating(object sender, CancelEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtMaDDH.Text))
            {
                e.Cancel = true;
                txtMaDDH.Focus();
                errorProvider1.SetError(txtMaDDH, "Mã vật tư không được để trống!");
            }
            else if (txtMaDDH.Text.Trim().Contains(" "))
            {
                e.Cancel = true;
                txtMaDDH.Focus();
                errorProvider1.SetError(txtMaDDH, "Mã vật tư không được chứa khoảng trắng!");
            }
            
            else if (txtMaDDH.Text.Length > 8)
            {

                e.Cancel = true;
                txtMaDDH.Focus();
                errorProvider1.SetError(txtMaDDH, "Mã Vật tư không được quá 8 kí tự!");
                return;
            }
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(txtMaDDH, "");
            }
        }

        private void txtNhaCC_Validating(object sender, CancelEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNhaCC.Text))
            {
                e.Cancel = true;
                txtNhaCC.Focus();
                errorProvider1.SetError(txtNhaCC, "Mã vật tư không được để trống!");
            }
            else if (txtNhaCC.Text.Length > 100)
            {

                e.Cancel = true;
                txtNhaCC.Focus();
                errorProvider1.SetError(txtNhaCC, "Mã Vật tư không được quá 8 kí tự!");
                return;
            }
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(txtNhaCC, "");
            }
        }

        private void txtSoLuong_Validating(object sender, CancelEventArgs e)
        { 
            if (txtSoLuong.Value < 0)
            {
                e.Cancel = true;
                txtSoLuong.Focus();
                errorProvider1.SetError(txtSoLuong, "Số lượng tồn phải là số dương!");
            }
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(txtSoLuong, "");
            }
        }

        private void txtDonGia_Validating(object sender, CancelEventArgs e)
        {
            if (txtDonGia.Value < 0)
            {
                e.Cancel = true;
                txtDonGia.Focus();
                errorProvider1.SetError(txtDonGia, "Số lượng tồn phải là số dương!");
            }
            else
            {
                e.Cancel = false;
                errorProvider1.SetError(txtDonGia, "");
            }
        }

        private void btnThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (info.Enabled)
            {
                if (XtraMessageBox.Show("Dữ liệu vẫn chưa lưu vào Database!\nBạn có chắn chắn muốn thoát?", "Thông báo",
                            MessageBoxButtons.OKCancel) == DialogResult.OK)
                {
                    this.Close();
                }
            }
            else
            {
                this.Close();
            }
        }
    }
}
