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
    public partial class subFormPhieuNhap : Form
    {
        int checkThem = 0;
        BindingSource bds = null;
        GridControl gc = null;
        int cheDo = 1;
        public subFormPhieuNhap()
        {
            InitializeComponent();
        }

        private void datHangBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsDH.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void datHangBindingNavigatorSaveItem_Click_1(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsDH.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void subFormPhieuNhap_Load(object sender, EventArgs e)
        {
          

            dS.EnforceConstraints = false; //không kiểm tra khóa ngoại trên dataset này
            
            this.datHangTableAdapter.Connection.ConnectionString = Program.connstr;
            this.datHangTableAdapter.Fill(this.dS.DatHang);
    
            this.cTDDHTableAdapter.Connection.ConnectionString = Program.connstr;
            this.cTDDHTableAdapter.Fill(this.dS.CTDDH);
            
            this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
            this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);
     
            this.cTPNTableAdapter.Connection.ConnectionString = Program.connstr;
            this.cTPNTableAdapter.Fill(this.dS.CTPN);
            cheDo = 1;
            bds = bdsPN;
            gc = gcPhieuNhap;
            gcCTPN.Enabled = false;

            gridView2.Columns["MAPN"].OptionsColumn.ReadOnly = true;
            cmbChiNhanh.DataSource = Program.dbs_dspm;  // sao chép bds_dspm đã load ở form đăng nhập qua
            cmbChiNhanh.DisplayMember = "TENCN";
            cmbChiNhanh.ValueMember = "TENSERVER";
            cmbChiNhanh.SelectedIndex = Program.mChinhanh;


            if (Program.mGroup == "CONGTY")
            {

                cmbChiNhanh.Enabled =  btnReload.Enabled = true;  // bật tắt theo phân quyền
                btnThem.Enabled = btnXoa.Enabled = btnGhi.Enabled = btnUndo.Enabled =  false;
                gcCTPN.Enabled = true;
            }
            else
            {
                cmbChiNhanh.Enabled = btnUndo.Enabled = btnGhi.Enabled = false;
                btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = true;
            }

        }

        private void mAPNLabel_Click(object sender, EventArgs e)
        {

        }

        private void mAPNTextEdit_EditValueChanged(object sender, EventArgs e)
        {

        }

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            int maNhanVien = int.Parse(((DataRowView)bdsDH[bdsDH.Position])["MANV"].ToString());
            
            if (cheDo == 1)
            {

                if (bdsPN.Count == 1)
                {
                    MessageBox.Show("Đơn hàng này đã có phiếu nhập, vui lòng vào hiệu chỉnh chi tiết phiếu nhập", "Thông báo", MessageBoxButtons.OK);
                    return;
                }
                checkThem = 1;
                if (Program.maNV != maNhanVien)
                {
                    MessageBox.Show("Không thể thêm phiếu nhập trên phiếu người khác lập", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                this.btnThem.Enabled = this.btnXoa.Enabled = this.btnReload.Enabled = false;
                this.btnThoat.Enabled = this.btnUndo.Enabled = this.btnGhi.Enabled = true;
                this.bdsPN.AddNew();
                gcPhieuNhap.Enabled = true;
                gcDatHang.Enabled = gcCTPN.Enabled = false;
                this.btnGhi.Enabled = true;


                string maKho = ((DataRowView)bdsDH[bdsDH.Position])["MAKHO"].ToString().Trim();
                ((DataRowView)bdsPN[bdsPN.Position])["MAKHO"] = maKho;
                ((DataRowView)bdsPN[bdsPN.Position])["MANV"] = Program.maNV;
                ((DataRowView)bdsPN[bdsPN.Position])["NGAY"] = DateTime.Today;


            }
            else
            {

                if (bdsPN.Count == 0)
                {
                    MessageBox.Show("chưa có phiếu nhập", "Thông báo", MessageBoxButtons.OK);
                    return;
                }
                if (bdsCTDDH.Count == 0)
                {
                    MessageBox.Show("Đơn đặt hàng chưa lập chi tiết đơn đặt hàng!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                if (bdsCTPN.Count == bdsCTDDH.Count)
                {
                    MessageBox.Show("chi tiết đơn hàng đã được nhập hết", "Thông báo", MessageBoxButtons.OK);
                    return;
                }
                if (Program.maNV != maNhanVien)
                {
                    MessageBox.Show("Bạn không thêm chi tiết phiếu nhập trên phiếu không phải do mình tạo", "Thông báo", MessageBoxButtons.OK);
                    return;
                }

                Program.maDDH = ((DataRowView)bdsPN[bdsPN.Position])["MasoDDH"].ToString();

                FormChonCTDDH formChonCTDDH = new FormChonCTDDH();
                formChonCTDDH.ShowDialog();

                /*this.bds_CTPN.AddNew();
                ((DataRowView)bds_CTPN[bds_CTPN.Position])["MAPN"] = ((DataRowView)bds_PhieuNhap[bds_PhieuNhap.Position])["MAPN"].ToString();
                ((DataRowView)bds_CTPN[bds_CTPN.Position])["MAVT"] = Program.maVatTuCTDDH;
                ((DataRowView)bds_CTPN[bds_CTPN.Position])["SOLUONG"] = Program.SoLuongCTDDH;
                ((DataRowView)bds_CTPN[bds_CTPN.Position])["DONGIA"] = Program.DonGiaCTDDH;
                btnGhi.Enabled = true;*/
                String query = "";
                String queryUndo = "";
                if (Program.getAll == true)
                {
                    String strLenh = "[dbo].[SP_getCTDDH] '" + Program.maDDH + "'";
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
                    while (Program.myReader.Read())
                    {
                        String i = Program.myReader["MAVT"].ToString();
                        String c = Program.myReader["SOLUONG"].ToString();
                        String v = Program.myReader["DONGIA"].ToString();

                        query += "INSERT INTO DBO.CTPN(MAPN, MAVT, SOLUONG, DONGIA) " +
                                      "VALUES('" + ((DataRowView)bdsPN[bdsPN.Position])["MAPN"].ToString() + "', '" +
                                      Program.myReader["MAVT"].ToString() + "', " +
                                      Program.myReader["SOLUONG"].ToString() + ", " +
                                      Program.myReader["DONGIA"].ToString() + ");";
                        query += "UPDATE dbo.Vattu SET SOLUONGTON = SOLUONGTON +" + Program.myReader["SOLUONG"].ToString() + " WHERE MAVT= '" + Program.myReader["MAVT"].ToString() + "';";

                      

                    }
                    Program.myReader.Close();
                    Program.ExecSqlNonQuery(query);
                    cTPNTableAdapter.Fill(this.dS.CTPN);
                    phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);
                }
                else
                {
                    if (Program.SoLuongCTDDH > 0)
                    {
                        query = "INSERT INTO DBO.CTPN(MAPN, MAVT, SOLUONG, DONGIA) " +
                       "VALUES('" + ((DataRowView)bdsPN[bdsPN.Position])["MAPN"].ToString() + "', '" +
                       Program.maVatTuCTDDH + "', " +
                        Program.SoLuongCTDDH + ", " +
                       Program.DonGiaCTDDH + ")";
                        query += "UPDATE dbo.Vattu SET SOLUONGTON = SOLUONGTON +" + Program.SoLuongCTDDH + " WHERE MAVT= '" + Program.maVatTuCTDDH + "';";

                        //queryUndo = "DELETE FROM DBO.CTPN " +
                               //"WHERE MAPN = '" + ((DataRowView)bdsCTPN[bdsPN.Position])["MAPN"].ToString() + "' " +
                               //"AND MAVT = '" + Program.maVatTuCTDDH + "';";
                       // queryUndo += "UPDATE dbo.Vattu SET SOLUONGTON = SOLUONGTON -" + Program.SoLuongCTDDH + " WHERE MAVT= '" + Program.maVatTuCTDDH + "';";

                        Program.ExecSqlNonQuery(query);
                        cTPNTableAdapter.Fill(this.dS.CTPN);
                        phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);
                        Program.SoLuongCTDDH = 0;
                        Program.DonGiaCTDDH = 0;
                        Program.maDDH = "";
                        Program.maVatTuCTDDH = "";
                        Program.getAll = false;

                    }

                }
                this.btnUndo.Enabled = this.btnXoa.Enabled = this.btnThoat.Enabled = this.btnReload.Enabled = this.btnThem.Enabled = true;
                this.btnGhi.Enabled = false;
               

            }
            gridView2.Columns["MAPN"].OptionsColumn.ReadOnly = false;
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
                this.datHangTableAdapter.Connection.ConnectionString = Program.connstr;
                this.datHangTableAdapter.Fill(this.dS.DatHang);
                this.cTDDHTableAdapter.Connection.ConnectionString = Program.connstr;
                this.cTDDHTableAdapter.Fill(this.dS.CTDDH);
                this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
                this.phieuNhapTableAdapter.Fill(this.dS.PhieuNhap);
                this.cTPNTableAdapter.Connection.ConnectionString = Program.connstr;
                this.cTPNTableAdapter.Fill(this.dS.CTPN);

            }
        }

        private void barToggleSwitchItem1_CheckedChanged(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (switchCheDo.Checked == true)
            {
                Console.WriteLine("Chi tiet don dat hang");
                cheDo = 2;
                gcCTPN.Enabled = true; 
                gcPhieuNhap.Enabled = false; 
                bds = bdsCTPN;
                gc = gcCTPN;
                gc.Enabled = false;
                btnThem.Enabled = true;
                btnGhi.Enabled = false;

            }
            else
            {
                Console.WriteLine("Don dat hang");
                cheDo = 1;
                btnGhi.Enabled = false;
                gcPhieuNhap.Enabled = true; // bật grid control DDH
                gcDatHang.Enabled = true;
                gcCTPN.Enabled = false; // tắt grid control CTDDH
                bds = bdsCTPN;
                gc = gcPhieuNhap;

            }
        }

        private void btnGhi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (cheDo == 1)
            {
                if (((DataRowView)bds[bds.Position])["MAPN"].ToString().Trim().Equals(""))
                {
                    MessageBox.Show("Không bỏ trống mã phiếu nhập !", "Thông báo", MessageBoxButtons.OK);
                    return;
                }
                if (((DataRowView)bds[bds.Position])["MAPN"].ToString().Trim().Length > 8)
                {
                    MessageBox.Show("độ dài mã phiếu nhập không quá 8 số !", "Thông báo", MessageBoxButtons.OK);
                    return;
                }

                if (checkThem == 0&& bdsCTPN.Count < 1)
                {
                    MessageBox.Show("Phiếu này đã có chi tiết, vui lòng không được sửa", "Thông báo", MessageBoxButtons.OK);
                }
            }
            string cauTruyVanHoanTac = "";
            String maPhieuNhap = ((DataRowView)bdsPN[bdsPN.Position])["MAPN"].ToString();

            DialogResult dr = MessageBox.Show("Bạn có chắc muốn ghi dữ liệu vào cơ sở dữ liệu ?", "Thông báo",
                         MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (dr == DialogResult.OK)
            {
                try
                {
                    


                    /*if (cheDo == 2)
                    {
                        int soLuong = int.Parse(((DataRowView)bds_CTPN[bds_CTPN.Position])["SOLUONG"].ToString());
                        int donGia = int.Parse(((DataRowView)bds_CTPN[bds_CTPN.Position])["DONGIA"].ToString());
                        string maVatTu = Program.maVatTuCTDDH;
                        cauTruyVanHoanTac =
                            "DELETE FROM DBO.CTPN " +
                            "WHERE MAPN = '" + maPhieuNhap + "' " +
                            "AND MAVT = '" + maVatTu + "'";

                        cauTruyVanHoanTac += "UPDATE dbo.Vattu SET SOLUONGTON = SOLUONGTON -" + Program.myReader["SOLUONG"].ToString() + " WHERE MAVT= " + Program.myReader["MAVT"].ToString() + ";";
                      
                       
                    }*/


                  

                    this.bdsPN.EndEdit();
                    this.bdsCTPN.EndEdit();
                    this.phieuNhapTableAdapter.Update(this.dS.PhieuNhap);
                    //checkThem = 0;
                    this.cTPNTableAdapter.Update(this.dS.CTPN);

                    this.btnThem.Enabled = true;
                    this.btnXoa.Enabled = true;
                    this.btnGhi.Enabled = true;
                    checkThem = 0;
                    this.btnUndo.Enabled = true;
                    this.btnReload.Enabled = true;
                    this.btnThoat.Enabled = true;
                    gcDatHang.Enabled = true;


                    MessageBox.Show("Ghi thành công", "Thông báo", MessageBoxButtons.OK);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    bds.RemoveCurrent();
                    MessageBox.Show("Da xay ra loi !\n\n" + ex.Message, "Lỗi",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            string cauTruyVanHoanTac = "";

            if (cheDo == 1)
            {

                String maNhanVien = ((DataRowView)bdsPN[bdsPN.Position])["MANV"].ToString();
                if (Program.username != maNhanVien)
                {
                    MessageBox.Show("Không xóa chi tiết phiếu xuất không phải do mình tạo", "Thông báo", MessageBoxButtons.OK);
                    return;
                }

                if (bdsCTPN.Count > 0)
                {
                    MessageBox.Show("Không thể xóa phiếu nhập vì có chi tiết phiếu nhập", "Thông báo", MessageBoxButtons.OK);
                    return;
                }


                DateTime ngay = ((DateTime)((DataRowView)bdsPN[bdsPN.Position])["NGAY"]);

                cauTruyVanHoanTac = "INSERT INTO DBO.PHIEUNHAP(MAPN, NGAY, MasoDDH, MANV, MAKHO) " +
                    "VALUES( '" + ((DataRowView)bdsPN[bdsPN.Position])["MAPN"].ToString().Trim() + "', '" +
                    ngay.ToString("yyyy-MM-dd") + "', '" +
                    ((DataRowView)bdsPN[bdsPN.Position])["MasoDDH"].ToString() + "', '" +
                    ((DataRowView)bdsPN[bdsPN.Position])["MANV"].ToString() + "', '" +
                   ((DataRowView)bdsPN[bdsPN.Position])["MAKHO"].ToString() + "')";

            }

            if (cheDo == 2)
            {

                String maNhanVien = ((DataRowView)bdsPN[bdsPN.Position])["MANV"].ToString(); ;
                if (Program.username != maNhanVien)
                {
                    MessageBox.Show("Bạn không xóa chi tiết phiếu nhập không phải do mình tạo", "Thông báo", MessageBoxButtons.OK);
                    return;
                }



                cauTruyVanHoanTac = "INSERT INTO DBO.CTPN(MAPN, MAVT, SOLUONG, DONGIA) " +
                    "VALUES('" + ((DataRowView)bdsCTPN[bdsCTPN.Position])["MAPN"].ToString().Trim() + "', '" +
                     ((DataRowView)bdsCTPN[bdsCTPN.Position])["MAVT"].ToString().Trim() + "', " +
                     ((DataRowView)bdsCTPN[bdsCTPN.Position])["SOLUONG"].ToString().Trim() + ", " +
                     ((DataRowView)bdsCTPN[bdsCTPN.Position])["DONGIA"].ToString().Trim() + ")";
                cauTruyVanHoanTac += "UPDATE dbo.Vattu SET SOLUONGTON = SOLUONGTON +" + ((DataRowView)bdsCTPN[bdsCTPN.Position])["SOLUONG"].ToString().Trim() + " WHERE MAVT= '" + ((DataRowView)bdsCTPN[bdsCTPN.Position])["MAVT"].ToString().Trim() + "';";


            }

            //undoList.Push(cauTruyVanHoanTac);



            if (MessageBox.Show("Bạn có chắc chắn muốn xóa phiếu nhập này không ?", "Thông báo",
                MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                try
                {


                    if (cheDo == 1)
                    {
                        bdsPN.RemoveCurrent();
                    }
                    if (cheDo == 2)
                    {
                        String query = "UPDATE dbo.Vattu SET SOLUONGTON = SOLUONGTON -" + ((DataRowView)bdsCTPN[bdsCTPN.Position])["SOLUONG"].ToString().Trim() + " WHERE MAVT= '" + ((DataRowView)bdsCTPN[bdsCTPN.Position])["MAVT"].ToString().Trim() + "';";
                        Program.ExecSqlNonQuery(query);
                        bds.RemoveCurrent();


                    }


                    this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.phieuNhapTableAdapter.Update(this.dS.PhieuNhap);

                    this.cTPNTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.cTPNTableAdapter.Update(this.dS.CTPN);


                    MessageBox.Show("Xóa thành công ", "Thông báo", MessageBoxButtons.OK);
                    this.btnUndo.Enabled = true;
                }
                catch (Exception ex)
                {

                    MessageBox.Show("Lỗi xóa. Hãy thử lại\n" + ex.Message, "Thông báo", MessageBoxButtons.OK);
                    this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.phieuNhapTableAdapter.Update(this.dS.PhieuNhap);

                    this.cTPNTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.cTPNTableAdapter.Update(this.dS.CTPN);


                    return;
                }
            }
            else
            {
               // undoList.Pop();
            }
        }
    }
}
