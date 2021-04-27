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
    public partial class frmDangNhap : Form
    {
        public frmDangNhap()
        {
            InitializeComponent();
        }

        private void btnDangKy_Click(object sender, EventArgs e)
        {
            frmDangKy frm = new frmDangKy();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            string Email = txtEmail.Text;
            string Password = txtPassword.Text;
            if (Login(Email, Password))
            {
                frmMain frm = new frmMain();
                this.Hide();
                frm.ShowDialog();
                this.Show();
            }
            else
            {
                MessageBox.Show("Sai tên đăng nhập hoặc mật khẩu!");
            }
        }

        private bool Login(string Email, string Password)
        {

            return AccountDAO.Instance.Login(Email, Password);
        }
    }
}
