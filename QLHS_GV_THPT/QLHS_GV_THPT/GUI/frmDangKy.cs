using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QLHS_GV_THPT.DAO;

namespace QLHS_GV_THPT.GUI
{
    public partial class frmDangKy : Form
    {
        public frmDangKy()
        {
            InitializeComponent();
        }

        private void btnXacNhan_Click(object sender, EventArgs e)
        {
            string Email = txtEmail.Text;
            string GioiTinh = cbGioiTinh.Text;
            string Password = txtMK.Text;

            try
            {
                if (Email == "" || GioiTinh == "" || Password == "")
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if(MessageBox.Show("Bạn có thật sự muốn tạo tài khoản này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    AccountDAO.Instance.Insert(Email, GioiTinh, Password);
                    MessageBox.Show("Tạo tài khoản thành công");
                    frmDangNhap frm = new frmDangNhap();
                    this.Hide();
                    frm.ShowDialog();
                    this.Show();
                }
                else
                {
                    MessageBox.Show("Thông tin tài khoản này đã tồn tại!");
                    return;
                }
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
            }
        }
    }
}
