using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace CSDLPT_QLVT
{
    public partial class Xrpt_DDH_Khong_PN : DevExpress.XtraReports.UI.XtraReport
    {
        public Xrpt_DDH_Khong_PN()
        {
            InitializeComponent();
            this.sqlDataSource1.Connection.ConnectionString = Program.connstr;
            this.sqlDataSource1.Fill();
        }

    }
}
