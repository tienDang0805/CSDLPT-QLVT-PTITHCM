using System;
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
    public partial class FormDangNhap : Form
    {
        private SqlConnection conn_publisher = new SqlConnection();
        
        public FormDangNhap()
        {
            
            InitializeComponent();
        }
        private int KetNoiCSDL ()
        {
            if (conn_publisher != null && conn_publisher.State == ConnectionState.Open)
                conn_publisher.Close();
            try
            {
                conn_publisher.ConnectionString = Program.connectStr_publisher;
                conn_publisher.Open();
                return 1;
            }
            catch(Exception e) {
                MessageBox.Show("khong ket noi duoc!");
                return 0;
            }
           
        }
        private void LayDSPM(String cmd) {
            DataTable dataTable = new DataTable();
            if (conn_publisher.State == ConnectionState.Closed) conn_publisher.Open();
            SqlDataAdapter dataA= new SqlDataAdapter(cmd, conn_publisher);
            dataA.Fill(dataTable);
            conn_publisher.Close();
            Program.dbs_dspm.DataSource = dataTable;
            cmbChiNhanh.DataSource = Program.dbs_dspm;
            cmbChiNhanh.DisplayMember = "TENCN";
            cmbChiNhanh.ValueMember="TENSERVER";
        }
       
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void txtID_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtPass_TextChanged(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try {
                Program.servername = cmbChiNhanh.SelectedValue.ToString();
            }
            catch (Exception){
            }
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            if (txtID.Text.Trim() == "" ||txtPass.Text.Trim()=="") {
                MessageBox.Show("Vui long nhap ten id,pass");
                return;
            }
            Program.mlogin = txtID.Text;
            Program.password = txtPass.Text;
            if (Program.KetNoi() == 0) return;
            Program.mChinhanh = cmbChiNhanh.SelectedIndex;
            Program.mloginDN = Program.mlogin;
            Program.passwordDN = Program.password;
            String strLenh = "EXEC SP_Lay_Thong_Tin_NV_Tu_Login'" + Program.mlogin + "'";
            Program.myReader = Program.ExecSqlDataReader(strLenh);
            if (Program.myReader == null) return;
            Program.myReader.Read();
            Program.username = Program.myReader.GetString(0);
            if (Convert.IsDBNull(Program.username)) {
                MessageBox.Show("Login cua ban khong co quyen truy cap");
                return;
            }
            MessageBox.Show("Thanh cong");
            Program.mHoten = Program.myReader.GetString(1);
            Program.mGroup = Program.myReader.GetString(2);
            Program.maNV = int.Parse(Program.username);
            Program.myReader.Close();
            Program.conn.Close();
            Program.formchinh.tsMaNV.Text = "Mã nhân viên: " + Program.username;
            Program.formchinh.HienMenu();
            Close();




        }

        private void FormDangNhap_Load(object sender, EventArgs e)
        {
           
            if (KetNoiCSDL() == 0) return;
            LayDSPM("SELECT *FROM V_DS_PHANMANH");
            cmbChiNhanh.SelectedIndex = 1;
            cmbChiNhanh.SelectedIndex = 0;
        }
    }

    
}
