using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;

namespace CSDLPT_QLVT.subForm
{
    public partial class CTPX : DevExpress.XtraEditors.XtraForm
    {
        public CTPX()
        {
            InitializeComponent();
        }

        private void vattuBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsVT.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void CTPX_Load(object sender, EventArgs e)
        {
             dS.EnforceConstraints = false;

            this.vattuTableAdapter.Connection.ConnectionString = Program.connstr;
            this.vattuTableAdapter.Fill(this.dS.Vattu);

            this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connstr;
            this.phieuXuatTableAdapter.Fill(this.dS.PhieuXuat);

            this.cTPXTableAdapter.Connection.ConnectionString = Program.connstr;
            this.cTPXTableAdapter.Fill(this.dS.CTPX);

            this.bdsCTPX.DataSource = Program.frmPX.getBdsCTPX();

        }
        private string getDataRow(BindingSource bindingSource, string column)
        {
            return ((DataRowView)bindingSource[bindingSource.Position])[column].ToString().Trim();
        }
        private void SubFormCTPX_Shown(object sender, EventArgs e)
        {
            this.bdsCTPX.AddNew();

            BindingSource current_PX = Program.frmPX.getBdsPX();
            if (current_PX.Position != -1 && bdsVT.Position != -1)
            {
                txtMaPX.Text = getDataRow(current_PX, "MAPX");
                //txtMaVT.Text = getDataRow(bdsVT, "MAVT"); // không cần xét mã vt để tránh trường hợp mẩu tin đầu của vật tư có sl bằng 0.
                numSL.Maximum = int.Parse(gridView1.GetRowCellValue(bdsVT.Position, "SOLUONGTON").ToString().Trim());
                numSL.Value = numSL.Minimum;
                numDG.Value = numDG.Minimum;
            }
        }

        private void btnGhi_Click(object sender, EventArgs e)
        {
            if (ValidateChildren(ValidationConstraints.Enabled))
            {
                int indexMaVT = bdsCTPX.Find("MAVT", txtMaVT.Text);
                if (indexMaVT != -1 && (indexMaVT != bdsCTPX.Position))
                {
                    MessageBox.Show("Đã tồn tại mã vật tư cùng với mã phiếu xuất!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                DialogResult dr = MessageBox.Show("Bạn có chắc muốn ghi dữ liệu vào Database?", "Thông báo",
                    MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (dr == DialogResult.OK)
                {
                    try
                    {
                        // Lưu lại MAVT và SOLUONG để khi EndEdit không bị mất dữ liệu vì con trỏ về đầu
                        string maVT = txtMaVT.Text;
                        int soLuong = int.Parse(numSL.Value.ToString());

                        this.bdsCTPX.EndEdit();
                        this.cTPXTableAdapter.Update(Program.frmPX.getDataset().CTPX);

                        bdsCTPX.EndEdit(); // kết thúc quá trình hiệu chỉnh và ghi vào BindingSource
                        bdsCTPX.ResetCurrentItem();
                      

                       
                     

                        // Push History for Undo
                        
                        this.Close();
                        
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Ghi dữ liệu thất lại. Vui lòng kiểm tra lại!\n" + ex.Message, "Lỗi",
                            MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
        }
    }
}