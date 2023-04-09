namespace CSDLPT_QLVT
{
    partial class FormChonCTDDH
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.btnAll = new System.Windows.Forms.Button();
            this.btnChon = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.nbrDonGia = new System.Windows.Forms.NumericUpDown();
            this.nbrSoLuong = new System.Windows.Forms.NumericUpDown();
            this.txtmaDDH = new DevExpress.XtraEditors.TextEdit();
            this.label3 = new System.Windows.Forms.Label();
            this.txtMaVT = new DevExpress.XtraEditors.TextEdit();
            this.label2 = new System.Windows.Forms.Label();
            this.txtTenVatTu = new DevExpress.XtraEditors.TextEdit();
            this.label1 = new System.Windows.Forms.Label();
            this.dgvCTDDH = new System.Windows.Forms.DataGridView();
            this.MasoDDH = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MAVT = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TENVT = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SOLUONG = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DONGIA = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.nbrDonGia)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nbrSoLuong)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtmaDDH.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtMaVT.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtTenVatTu.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCTDDH)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.SuspendLayout();
            // 
            // btnAll
            // 
            this.btnAll.Location = new System.Drawing.Point(721, 370);
            this.btnAll.Name = "btnAll";
            this.btnAll.Size = new System.Drawing.Size(75, 23);
            this.btnAll.TabIndex = 27;
            this.btnAll.Text = "Lấy hết";
            this.btnAll.UseVisualStyleBackColor = true;
            this.btnAll.Click += new System.EventHandler(this.btnAll_Click);
            // 
            // btnChon
            // 
            this.btnChon.Location = new System.Drawing.Point(604, 370);
            this.btnChon.Name = "btnChon";
            this.btnChon.Size = new System.Drawing.Size(75, 23);
            this.btnChon.TabIndex = 26;
            this.btnChon.Text = "Chọn";
            this.btnChon.UseVisualStyleBackColor = true;
            this.btnChon.Click += new System.EventHandler(this.btnChon_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.SystemColors.Highlight;
            this.label6.Location = new System.Drawing.Point(70, 57);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(266, 24);
            this.label6.TabIndex = 25;
            this.label6.Text = "CHI TIẾT ĐƠN ĐẶT HÀNG";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(557, 325);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(44, 13);
            this.label5.TabIndex = 24;
            this.label5.Text = "Đơn giá";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(557, 263);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(53, 13);
            this.label4.TabIndex = 23;
            this.label4.Text = "Số Lượng";
            // 
            // nbrDonGia
            // 
            this.nbrDonGia.Increment = new decimal(new int[] {
            10000,
            0,
            0,
            0});
            this.nbrDonGia.Location = new System.Drawing.Point(660, 318);
            this.nbrDonGia.Maximum = new decimal(new int[] {
            1410065407,
            2,
            0,
            0});
            this.nbrDonGia.Name = "nbrDonGia";
            this.nbrDonGia.Size = new System.Drawing.Size(120, 20);
            this.nbrDonGia.TabIndex = 22;
            this.nbrDonGia.Validating += new System.ComponentModel.CancelEventHandler(this.nbrDonGia_Validating);
            // 
            // nbrSoLuong
            // 
            this.nbrSoLuong.Location = new System.Drawing.Point(660, 256);
            this.nbrSoLuong.Maximum = new decimal(new int[] {
            1000000,
            0,
            0,
            0});
            this.nbrSoLuong.Name = "nbrSoLuong";
            this.nbrSoLuong.Size = new System.Drawing.Size(120, 20);
            this.nbrSoLuong.TabIndex = 21;
            this.nbrSoLuong.Validating += new System.ComponentModel.CancelEventHandler(this.nbrSoLuong_Validating);
            // 
            // txtmaDDH
            // 
            this.txtmaDDH.Location = new System.Drawing.Point(660, 93);
            this.txtmaDDH.Name = "txtmaDDH";
            this.txtmaDDH.Size = new System.Drawing.Size(168, 20);
            this.txtmaDDH.TabIndex = 20;
            this.txtmaDDH.Validating += new System.ComponentModel.CancelEventHandler(this.txtmaDDH_Validating);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(557, 96);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(94, 13);
            this.label3.TabIndex = 19;
            this.label3.Text = "Mã Đơn Đặt Hàng";
            // 
            // txtMaVT
            // 
            this.txtMaVT.Location = new System.Drawing.Point(660, 203);
            this.txtMaVT.Name = "txtMaVT";
            this.txtMaVT.Size = new System.Drawing.Size(168, 20);
            this.txtMaVT.TabIndex = 18;
            this.txtMaVT.Validating += new System.ComponentModel.CancelEventHandler(this.txtMaVT_Validating);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(557, 203);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(57, 13);
            this.label2.TabIndex = 17;
            this.label2.Text = "Mã Vật Tư";
            // 
            // txtTenVatTu
            // 
            this.txtTenVatTu.Location = new System.Drawing.Point(660, 147);
            this.txtTenVatTu.Name = "txtTenVatTu";
            this.txtTenVatTu.Size = new System.Drawing.Size(168, 20);
            this.txtTenVatTu.TabIndex = 16;
            this.txtTenVatTu.Validating += new System.ComponentModel.CancelEventHandler(this.txtTenVatTu_Validating);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(557, 147);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(61, 13);
            this.label1.TabIndex = 15;
            this.label1.Text = "Tên Vật Tư";
            // 
            // dgvCTDDH
            // 
            this.dgvCTDDH.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvCTDDH.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MasoDDH,
            this.MAVT,
            this.TENVT,
            this.SOLUONG,
            this.DONGIA});
            this.dgvCTDDH.Location = new System.Drawing.Point(4, 97);
            this.dgvCTDDH.Name = "dgvCTDDH";
            this.dgvCTDDH.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvCTDDH.Size = new System.Drawing.Size(547, 296);
            this.dgvCTDDH.TabIndex = 14;
            this.dgvCTDDH.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvCTDDH_CellContentClick);
            // 
            // MasoDDH
            // 
            this.MasoDDH.DataPropertyName = "MasoDDH";
            this.MasoDDH.HeaderText = "Mã DDH";
            this.MasoDDH.Name = "MasoDDH";
            // 
            // MAVT
            // 
            this.MAVT.DataPropertyName = "MAVT";
            this.MAVT.HeaderText = "Mã Vật Tư";
            this.MAVT.Name = "MAVT";
            // 
            // TENVT
            // 
            this.TENVT.DataPropertyName = "TENVT";
            this.TENVT.HeaderText = "Tên Vật Tư";
            this.TENVT.Name = "TENVT";
            // 
            // SOLUONG
            // 
            this.SOLUONG.DataPropertyName = "SOLUONG";
            this.SOLUONG.HeaderText = "Số Lượng";
            this.SOLUONG.Name = "SOLUONG";
            // 
            // DONGIA
            // 
            this.DONGIA.DataPropertyName = "DONGIA";
            this.DONGIA.HeaderText = "Đơn Gía";
            this.DONGIA.Name = "DONGIA";
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // FormChonCTDDH
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(951, 450);
            this.Controls.Add(this.btnAll);
            this.Controls.Add(this.btnChon);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.nbrDonGia);
            this.Controls.Add(this.nbrSoLuong);
            this.Controls.Add(this.txtmaDDH);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtMaVT);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtTenVatTu);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvCTDDH);
            this.Name = "FormChonCTDDH";
            this.Text = "FormChonCTDDH";
            this.Load += new System.EventHandler(this.FormChonCTDDH_Load);
            ((System.ComponentModel.ISupportInitialize)(this.nbrDonGia)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nbrSoLuong)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtmaDDH.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtMaVT.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtTenVatTu.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCTDDH)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnAll;
        private System.Windows.Forms.Button btnChon;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.NumericUpDown nbrDonGia;
        private System.Windows.Forms.NumericUpDown nbrSoLuong;
        private DevExpress.XtraEditors.TextEdit txtmaDDH;
        private System.Windows.Forms.Label label3;
        private DevExpress.XtraEditors.TextEdit txtMaVT;
        private System.Windows.Forms.Label label2;
        private DevExpress.XtraEditors.TextEdit txtTenVatTu;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dgvCTDDH;
        private System.Windows.Forms.DataGridViewTextBoxColumn MasoDDH;
        private System.Windows.Forms.DataGridViewTextBoxColumn MAVT;
        private System.Windows.Forms.DataGridViewTextBoxColumn TENVT;
        private System.Windows.Forms.DataGridViewTextBoxColumn SOLUONG;
        private System.Windows.Forms.DataGridViewTextBoxColumn DONGIA;
        private System.Windows.Forms.ErrorProvider errorProvider1;
    }
}