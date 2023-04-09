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
    public partial class subFormCTPX : Form
    {
        public subFormCTPX()
        {
            InitializeComponent();

        }

        private void vattuBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bdsVT.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dS);

        }

        private void subFormCTPX_Load(object sender, EventArgs e)
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

        private void vattuGridControl_Click(object sender, EventArgs e)
        {

        }

        private void gvVT_Click(object sender, EventArgs e)
        {
            if (bdsVT.Position != -1)
            {
                int soLuong = int.Parse(gvVT.GetRowCellValue(bdsVT.Position, "SOLUONGTON").ToString().Trim());
                if (soLuong <= 0)
                {
                    MessageBox.Show("Vật tư này không còn hàng.\n Vui lòng chọn vật tư khác hoặc nhập hàng thêm!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    numSL.Maximum = soLuong;
                    numSL.Minimum = 1;
                    txtMaVT.Text = gvVT.GetRowCellValue(bdsVT.Position, "MAVT").ToString().Trim();
                }
            }
        }

        private void btnGhi_Click(object sender, EventArgs e)
        {
            if (ValidateChildren(ValidationConstraints.Enabled))
            {
                DialogResult dr = MessageBox.Show("Bạn có chắc muốn ghi dữ liệu vào Database?", "Thông báo",
                  MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (dr == DialogResult.OK)
                {

                }
            }
        }
    }
}
