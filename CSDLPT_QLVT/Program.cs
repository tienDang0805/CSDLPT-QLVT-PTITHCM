using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using DevExpress.UserSkins;
using DevExpress.Skins;
using System.Data.SqlClient;
using System.Data;

namespace CSDLPT_QLVT
{
    static class Program
    {
        public static FormMain formchinh;
        public static FormDangNhap formDangNhap;
        public static subFormPhieuXuat frmPX;
        public static subFormCTPX subFormCTPX;
        public static String connstr;
        public static String connectStr_publisher = "Data Source=DESKTOP-421RCI7;Initial Catalog = QLVT_DATHANG;Integrated Security=True";
        public static BindingSource dbs_dspm = new BindingSource();
        public static SqlConnection conn = new SqlConnection();
        public static SqlDataReader myReader;
        public static String remoteLogin = "HTKN";
        public static String remotePassword = "123";
        public static String servername = "";
        public static String username = "";
        public static String mlogin = "";
        public static String password = "";
        public static String mloginDN = "";
        public static String passwordDN = "";
        public static String mGroup = "";
        public static String mHoten = "";
        public static String maDDH = "";
        public static String MAPX = "";
        public static bool getAll = false;
        public static int maNV = 0;
        public static String maVatTuCTDDH = "";
        public static int SoLuongCTDDH = 0;
        public static int DonGiaCTDDH = 0;
        public static int mChinhanh = 0;
        public static String serverNameHT = "";
        public static String database = "QLVT_DATHANG";
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        
        public static int KetNoi()
        {
            
            if (Program.conn != null && Program.conn.State == ConnectionState.Open)
                Program.conn.Close();
            try
            {
                Program.connstr = "Data Source=" + Program.servername + ";Initial Catalog=" +
                      Program.database + ";User ID=" +
                      Program.mlogin + ";password=" + Program.password;
                Program.conn.ConnectionString = Program.connstr;
                Program.conn.Open();
                return 1;
            }

            catch (Exception e)
            {
                MessageBox.Show("Lỗi kết nối cơ sở dữ liệu.\nBạn xem lại user name và password.\n " + e.Message, "", MessageBoxButtons.OK);
                return 0;
            }
        }
        public static SqlDataReader ExecSqlDataReader(String strLenh)
        {
            SqlDataReader myreader;
            SqlCommand sqlcmd = new SqlCommand(strLenh, Program.conn);
            sqlcmd.CommandType = CommandType.Text;
            if (Program.conn.State == ConnectionState.Closed) Program.conn.Open();
            try
            {
                myreader = sqlcmd.ExecuteReader();
                return myreader;
            }
            catch (SqlException ex)
            {
                Program.conn.Close();
                MessageBox.Show(ex.Message);
                return null;
            }
        }
        public static int ExecSqlNonQuery(String strlenh)
        {
            SqlCommand Sqlcmd = new SqlCommand(strlenh, conn);
            Sqlcmd.CommandType = CommandType.Text;
            Sqlcmd.CommandTimeout = 600;// 10 phut
            if (conn.State == ConnectionState.Closed) conn.Open();
            try
            {
                Sqlcmd.ExecuteNonQuery();
                conn.Close();
                return 0;
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message, "Error Message",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                conn.Close();
                return ex.State;

            }
        }
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            formchinh = new FormMain();

            Application.Run(formchinh);
        }
    }
}
