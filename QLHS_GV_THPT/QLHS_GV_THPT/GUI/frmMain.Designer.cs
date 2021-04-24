namespace QLHS_GV_THPT.GUI
{
    partial class frmMain
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
            this.btnGiaoVien = new System.Windows.Forms.Button();
            this.btnHocSinh = new System.Windows.Forms.Button();
            this.btnLopHoc = new System.Windows.Forms.Button();
            this.btnMonHoc = new System.Windows.Forms.Button();
            this.btnDiem = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.btnHuongDan = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnGiaoVien
            // 
            this.btnGiaoVien.Location = new System.Drawing.Point(67, 243);
            this.btnGiaoVien.Margin = new System.Windows.Forms.Padding(2);
            this.btnGiaoVien.Name = "btnGiaoVien";
            this.btnGiaoVien.Size = new System.Drawing.Size(135, 98);
            this.btnGiaoVien.TabIndex = 4;
            this.btnGiaoVien.Text = "Giáo viên";
            this.btnGiaoVien.UseVisualStyleBackColor = true;
            this.btnGiaoVien.Click += new System.EventHandler(this.btnGiaoVien_Click);
            // 
            // btnHocSinh
            // 
            this.btnHocSinh.Location = new System.Drawing.Point(67, 127);
            this.btnHocSinh.Margin = new System.Windows.Forms.Padding(2);
            this.btnHocSinh.Name = "btnHocSinh";
            this.btnHocSinh.Size = new System.Drawing.Size(135, 98);
            this.btnHocSinh.TabIndex = 1;
            this.btnHocSinh.Text = "Học sinh";
            this.btnHocSinh.UseVisualStyleBackColor = true;
            this.btnHocSinh.Click += new System.EventHandler(this.btnHocSinh_Click);
            // 
            // btnLopHoc
            // 
            this.btnLopHoc.Location = new System.Drawing.Point(236, 243);
            this.btnLopHoc.Margin = new System.Windows.Forms.Padding(2);
            this.btnLopHoc.Name = "btnLopHoc";
            this.btnLopHoc.Size = new System.Drawing.Size(135, 98);
            this.btnLopHoc.TabIndex = 5;
            this.btnLopHoc.Text = "Lớp học";
            this.btnLopHoc.UseVisualStyleBackColor = true;
            this.btnLopHoc.Click += new System.EventHandler(this.btnLopHoc_Click);
            // 
            // btnMonHoc
            // 
            this.btnMonHoc.Location = new System.Drawing.Point(236, 127);
            this.btnMonHoc.Margin = new System.Windows.Forms.Padding(2);
            this.btnMonHoc.Name = "btnMonHoc";
            this.btnMonHoc.Size = new System.Drawing.Size(135, 98);
            this.btnMonHoc.TabIndex = 2;
            this.btnMonHoc.Text = "Môn học";
            this.btnMonHoc.UseVisualStyleBackColor = true;
            this.btnMonHoc.Click += new System.EventHandler(this.btnMonHoc_Click);
            // 
            // btnDiem
            // 
            this.btnDiem.Location = new System.Drawing.Point(399, 127);
            this.btnDiem.Margin = new System.Windows.Forms.Padding(2);
            this.btnDiem.Name = "btnDiem";
            this.btnDiem.Size = new System.Drawing.Size(135, 98);
            this.btnDiem.TabIndex = 3;
            this.btnDiem.Text = "Điểm";
            this.btnDiem.UseVisualStyleBackColor = true;
            this.btnDiem.Click += new System.EventHandler(this.btnDiem_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.White;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(112, 9);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(353, 32);
            this.label1.TabIndex = 9;
            this.label1.Text = "Phần mềm quản lý học sinh";
            // 
            // btnHuongDan
            // 
            this.btnHuongDan.Location = new System.Drawing.Point(399, 243);
            this.btnHuongDan.Margin = new System.Windows.Forms.Padding(2);
            this.btnHuongDan.Name = "btnHuongDan";
            this.btnHuongDan.Size = new System.Drawing.Size(135, 98);
            this.btnHuongDan.TabIndex = 6;
            this.btnHuongDan.Text = "Hướng Dẫn";
            this.btnHuongDan.UseVisualStyleBackColor = true;
            this.btnHuongDan.Click += new System.EventHandler(this.btnHuongDan_Click);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.DeepSkyBlue;
            this.BackgroundImage = global::QLHS_GV_THPT.Properties.Resources.anh_main;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(598, 376);
            this.Controls.Add(this.btnHuongDan);
            this.Controls.Add(this.btnDiem);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnMonHoc);
            this.Controls.Add(this.btnLopHoc);
            this.Controls.Add(this.btnHocSinh);
            this.Controls.Add(this.btnGiaoVien);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "frmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Phần mềm quản lý học sinh THPT";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button btnGiaoVien;
        private System.Windows.Forms.Button btnHocSinh;
        private System.Windows.Forms.Button btnLopHoc;
        private System.Windows.Forms.Button btnMonHoc;
        private System.Windows.Forms.Button btnDiem;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnHuongDan;
    }
}