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
    public partial class subFormPhieuXuat : Form
    {
        int position = 0;
        int cheDo = 1;
        BindingSource bds = null;
        GridControl gc = null;
        PanelControl info = null;
        public subFormPhieuXuat()
        {
            InitializeComponent();
        }

        private void phieuXuatBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsPX.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void phieuXuatBindingNavigatorSaveItem_Click_1(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsPX.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void subFormPhieuXuat_Load(object sender, EventArgs e)
        {
            dS.EnforceConstraints = false; 

            
            this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connstr;
            this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat);
            
            this.cTPXTableAdapter.Connection.ConnectionString = Program.connstr;
            this.cTPXTableAdapter.Fill(this.dS.CTPX);
         
            this.khoTableAdapter.Connection.ConnectionString = Program.connstr;
            this.khoTableAdapter.Fill(this.dS.Kho);
            
            this.vattuTableAdapter.Connection.ConnectionString = Program.connstr;
            this.vattuTableAdapter.Fill(this.dS.Vattu);
          
            this.nhanVienTableAdapter.Connection.ConnectionString = Program.connstr;
            this.nhanVienTableAdapter.Fill(this.dS.NhanVien);

            cmbChiNhanh.DataSource = Program.dbs_dspm;  //Sao chép bds_dspm đã load ở form đăng nhập qua
            cmbChiNhanh.DisplayMember = "TENCN";
            cmbChiNhanh.ValueMember = "TENSERVER";
            cmbChiNhanh.SelectedIndex = Program.mChinhanh;

            

            if (Program.mGroup == "CONGTY")
            {
                cmbChiNhanh.Enabled = btnReload.Enabled = true;  //Bật tắt theo phân quyền
                btnThem.Enabled = btnXoa.Enabled = btnGhi.Enabled = btnUndo.Enabled = false;
            }
            else
            {
                cmbChiNhanh.Enabled = btnUndo.Enabled = btnGhi.Enabled = false;
                btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = true;
            }

        }
        private void reload()
        {

            try
            {
                this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat);
                this.cTPXTableAdapter.Fill(this.dS.CTPX);
                bdsNhanVien.Position = position;
                bdsKho.Position = position;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi Reload: " + ex.Message, "", MessageBoxButtons.OK);
                return;
            }
        }

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (cheDo == 2)
            {
                if (txtMaNV.Text != Program.username)
                {

                    MessageBox.Show("Không thể thêm chi tiết Phiếu xuất  trên phiếu người khác lập", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning); 
                    cheDo = 1;
                    reload();
                    btnCTPX.Enabled = btnGhi.Enabled = btnReload.Enabled = gcPhieuXuat.Enabled = pNhapPX.Enabled = true;
                    pNhapCPTX.Enabled = btnPX.Enabled = gcCTPX.Enabled = false;
                    return;
                }

               
            }



            // đặt các giá trị mặc định
            if (cheDo == 1)
            {
                position = bdsPX.Position;
                pNhapPX.Enabled = true;
                bdsPX.AddNew();
                txtMaPX.Text = "";
                txtNgay.EditValue = DateTime.Now; // ngày hiện hành
                txtNgay.Enabled = false;

                txtHoTenKH.Text = "";
                txtMaNV.Text = Program.username;
                txtMaNV.Enabled = false;

                btnThoatThem.Enabled = gcPhieuXuat.Enabled = pNhapPX.Enabled = true;
                gcCTPX.Enabled = pNhapCPTX.Enabled = false;
            }
            else if (cheDo == 2)
            {
                position = bdsCTPX.Position;
                pNhapCPTX.Enabled = true;
                bdsCTPX.AddNew();
                txtMaPX_CTPX.Text = txtMaPX.Text;
                txtSoLuong.Value = 0;
                txtDonGia.Value = 0;
                gcPhieuXuat.Enabled = pNhapPX.Enabled = false;
                btnThoatThem.Enabled = gcCTPX.Enabled = pNhapCPTX.Enabled = true;
            }

            // vô hiệu hóa các nút chức năng
           btnCTPX.Enabled=btnPX.Enabled= btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = false;
            btnThoatThem.Enabled=btnGhi.Enabled = btnUndo.Enabled = true;
            
        }

        private void cmbChiNhanh_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbChiNhanh.SelectedValue.ToString() == "System.Data.DataRowView") return;

            //Lấy tên server
            Program.servername = cmbChiNhanh.SelectedValue.ToString();

            //Nếu tên server khác với tên server ngoài đăng nhập, thì ta phải sử dụng HTKN
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
            {
                MessageBox.Show("Lỗi kết nối về chi nhánh mới", "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connstr;
                this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat);

                this.cTPXTableAdapter.Connection.ConnectionString = Program.connstr;
                this.cTPXTableAdapter.Fill(this.dS.CTPX);

                this.khoTableAdapter.Connection.ConnectionString = Program.connstr;
                this.khoTableAdapter.Fill(this.dS.Kho);

                this.vattuTableAdapter.Connection.ConnectionString = Program.connstr;
                this.vattuTableAdapter.Fill(this.dS.Vattu);

                this.nhanVienTableAdapter.Connection.ConnectionString = Program.connstr;
                this.nhanVienTableAdapter.Fill(this.dS.NhanVien);

                //maCN = ((DataRowView)bdsNV[0])["MACN"].ToString();
            }
        }

        private void cmbKho_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbKho.SelectedValue == null) return;

            txtMaKho.Text = cmbKho.SelectedValue.ToString();
        }

        private void cmbVatTu_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbVatTu.SelectedValue == null) return;

            txtMaVT.Text = cmbVatTu.SelectedValue.ToString();
            
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
          
             cheDo = 2;

            pNhapCPTX.Enabled = false;
            btnCTPX.Enabled = gcPhieuXuat.Enabled = pNhapPX.Enabled = false;
            btnReload.Enabled = btnGhi.Enabled = btnPX.Enabled = gcCTPX.Enabled = true;
            
            
        }

        private void barButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            cheDo = 1;
           
            btnCTPX.Enabled=btnGhi.Enabled = btnReload.Enabled  = gcPhieuXuat.Enabled = pNhapPX.Enabled = true;
            pNhapCPTX.Enabled= btnPX.Enabled = gcCTPX.Enabled = false;
        }

        private void btnThoatThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = gcCTPX.Enabled = pNhapCPTX.Enabled = gcPhieuXuat.Enabled = pNhapPX.Enabled = true;
            btnGhi.Enabled = btnThoatThem.Enabled = false;
            if (cheDo == 1)
            {
                btnCTPX.Enabled = true;
                btnPX.Enabled = false;
            }
            else {
                btnCTPX.Enabled = false;
                btnPX.Enabled = true;
            }
            reload();
        }

        private void btnGhi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (ValidateChildren(ValidationConstraints.Enabled))
            {
                try
                {
                    //bds.EndEdit(); // kết thúc quá trình hiệu chỉnh và ghi vào BindingSource
                    // bds.ResetCurrentItem(); // đưa thông tin vào grid
                    if (cheDo == 1)
                    {
                        String strLenh = "DECLARE @return_value int " +
                                        "EXEC @return_value = [dbo].[sp_Kiem_Tra_MAPX] '" +
                                        txtMaPX.Text.Trim() + "' " +
                                        "SELECT 'Return Value' = @return_value";
                        Program.myReader = Program.ExecSqlDataReader(strLenh);
                        if (Program.myReader == null) return;

                        Program.myReader.Read();
                        int result = int.Parse(Program.myReader.GetValue(0).ToString());
                        Program.myReader.Close();

                        if (result == 1)
                        {
                            XtraMessageBox.Show("Mã Phiếu Xuất  này đã được sử dụng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            btnCTPX.Enabled = btnGhi.Enabled = btnReload.Enabled = gcPhieuXuat.Enabled = pNhapPX.Enabled = true;
                            pNhapCPTX.Enabled = btnPX.Enabled = gcCTPX.Enabled = false;
                            txtMaPX.Focus();
                            return;
                        }
                        bdsPX.EndEdit(); // kết thúc quá trình hiệu chỉnh và ghi vào BindingSource
                        bdsPX.ResetCurrentItem(); // đưa thông tin vào grid

                        this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connstr; // đường kết nối đã đăng nhập
                        this.phieuXuatTableAdapter.Update(this.dS.PhieuXuat); // update xuống csdl

                    }
                    else
                    {
                        String strLenh = "DECLARE @return_value int " +
                                "EXEC @return_value = [dbo].[sp_Kiem_Tra_CTPX] '" +
                                txtMaPX.Text.Trim() + "', '" + txtMaVT.Text.Trim() + "' " +
                                "SELECT 'Return Value' = @return_value";
                        Program.myReader = Program.ExecSqlDataReader(strLenh);
                        if (Program.myReader == null) return;

                        Program.myReader.Read();
                        int result = int.Parse(Program.myReader.GetValue(0).ToString());
                        Program.myReader.Close();
                        if (result == 1)
                        {
                            XtraMessageBox.Show("Vật tư này đã có trong Phiếu Xuất ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            btnCTPX.Enabled = gcPhieuXuat.Enabled = pNhapPX.Enabled = false;
                            btnReload.Enabled = btnGhi.Enabled = btnPX.Enabled = gcCTPX.Enabled = true;
                            return;
                        }
                        String str = "DECLARE @return_value int " +
                                 "EXEC @return_value = [dbo].[sp_Giam_SL_VT] '" +
                                 txtMaVT.Text.Trim() + "', '" + txtSoLuong.Text.Trim() + "' " +
                                 "SELECT 'Return Value' = @return_value";
                        Program.myReader = Program.ExecSqlDataReader(str);
                        if (Program.myReader == null) return;

                        Program.myReader.Read();
                        int result1 = int.Parse(Program.myReader.GetValue(0).ToString());
                        Program.myReader.Close();
                        if (result1 == 1)
                        {
                            XtraMessageBox.Show("Số Lượng Xuất Không được lớn hơn số lượng tồn", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            btnCTPX.Enabled = gcPhieuXuat.Enabled = pNhapPX.Enabled = false;
                            btnReload.Enabled = btnGhi.Enabled = btnPX.Enabled = gcCTPX.Enabled = true;
                            return;
                        }

                        bdsCTPX.EndEdit(); // kết thúc quá trình hiệu chỉnh và ghi vào BindingSource
                        bdsCTPX.ResetCurrentItem();
                        this.cTPXTableAdapter.Connection.ConnectionString = Program.connstr; // đường kết nối đã đăng nhập
                        this.cTPXTableAdapter.Update(this.dS.CTPX); // update xuống csdl
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
          btnCTPX.Enabled=  btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = gcCTPX.Enabled = pNhapCPTX.Enabled = gcPhieuXuat.Enabled = pNhapPX.Enabled = true;
            btnGhi.Enabled = btnThoatThem.Enabled = false;
        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
                if (bdsPX.Count == 0)
                XtraMessageBox.Show("Danh sách trống!", "Thông báo lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);

            if (cheDo == 1)
            {
                if (txtMaNV.Text != Program.username)
                {
                    XtraMessageBox.Show("Không thể xóa phiếu xuất người khác lập", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (bdsCTPX.Count > 0)
                {
                    XtraMessageBox.Show("Không thể xóa vì phiếu xuất đã được lập chi tiết phiếu xuất", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                
                
            }
            else if (cheDo == 2)
            {
                if (txtMaNV.Text != Program.username)
                {
                    XtraMessageBox.Show("Không thể xóa chi tiết phiếu xuất trên phiếu người khác lập", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
            }
                DialogResult dr = XtraMessageBox.Show("Bạn có thực sự muốn xóa không?", "Xác nhận", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (dr == DialogResult.OK)
            {
                int currentPosition = -1;
                try
                {
                    //Xóa trên máy hiện tại trước
                    if (cheDo == 1)
                    {
                        currentPosition = bdsPX.Position; //Giữ lại vị trí grid để phòng trường hợp xóa lỗi
                        bdsPX.RemoveCurrent();
                        this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connstr; //Đường kết nối đã đăng nhập
                        this.phieuXuatTableAdapter.Update(this.dS.PhieuXuat); //Update xuống csdl
                    }
                    else
                    {
                        
                        String str = "EXEC [dbo].sp_Tang_SL_VT '" +
                                        txtMaVT.Text.Trim() + "', " +
                                        txtSoLuong.Text.Trim();
                        Console.WriteLine(txtMaVT.Text.Trim());
                        Console.WriteLine(str);
                        if (Program.KetNoi() == 0)
                            return;
                        int n = Program.ExecSqlNonQuery(str);
                        currentPosition = bdsCTPX.Position; //Giữ lại vị trí grid để phòng trường hợp xóa lỗi
                        bdsCTPX.RemoveCurrent();
                        this.cTPXTableAdapter.Connection.ConnectionString = Program.connstr; //Đường kết nối đã đăng nhập
                        this.cTPXTableAdapter.Update(this.dS.CTPX); //Update xuống csdl

                        //Tăng số lượng vật tư
                        
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
                        this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat); //Trên màn hình đã xóa mà csdl chưa xóa nên phải tải lại dữ liệu
                    if (cheDo == 1)
                        this.cTPXTableAdapter.Fill(this.dS.CTPX);
                    //Lệnh Find trả về index của item trong danh sách với giá trị và tên cột được chỉ định
                    bds.Position = currentPosition; //Sau khi fill xong thì con nháy đứng ở dòng đầu tiên nên mình đặt lại theo vị trí ban nãy muốn xóa

                    return;
                }
            }
        }
        public BindingSource getBdsPX()
        {
            return this.bdsPX;
        }

        public BindingSource getBdsCTPX()
        {
            return this.bdsCTPX;
        }
        public DS getDataset()
        {
            return this.dS;
        }

        private void gridView1_Click(object sender, EventArgs e)
        {

        }

        private void gcCTPX_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            
        
        }

        private void txtSoLuong_EditValueChanged(object sender, EventArgs e)
        {

        }
    }
}
