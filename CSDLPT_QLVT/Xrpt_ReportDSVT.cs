using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace CSDLPT_QLVT
{
    public partial class Xrpt_ReportDSVT : DevExpress.XtraReports.UI.XtraReport
    {
        public Xrpt_ReportDSVT()
        {
            InitializeComponent();
            this.sqlDataSource1.Connection.ConnectionString = Program.connstr;
            this.sqlDataSource1.Fill();
        }

    }
}
