using DevExpress.XtraReports.UI;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSDLPT_QLVT.ReportForm
{
    public partial class FormInDSVT : Form
    {
        public FormInDSVT()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Xrpt_ReportDSVT reportDSVT = new Xrpt_ReportDSVT();
            ReportPrintTool rpt = new ReportPrintTool(reportDSVT);
            reportDSVT.ShowPreviewDialog();
        }

        private void FormInDSVT_Load(object sender, EventArgs e)
        {

        }
    }
}
