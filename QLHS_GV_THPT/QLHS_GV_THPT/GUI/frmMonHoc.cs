using QLHS_GV_THPT.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLHS_GV_THPT.GUI
{
    public partial class frmMonHoc : Form
    {
        BindingSource monHocList = new BindingSource();
        public frmMonHoc()
        {
            InitializeComponent();
            LoadData();
        }
        
        private void LoadData()
        {
            dgvMonHoc.DataSource = monHocList;
            LoadListMonHoc();
            EditDataGridViewHeader();
        }

        private void EditDataGridViewHeader()
        {
            dgvMonHoc.Columns["IdMonHoc"].HeaderText = "ID Môn học";
            dgvMonHoc.Columns["TenMonHoc"].HeaderText = "Tên môn học";
            dgvMonHoc.Columns["SoTietHoc"].HeaderText = "Số tiết học";
            dgvMonHoc.Columns["NamHoc"].HeaderText = "Năm học";
            dgvMonHoc.Columns["KiHoc"].HeaderText = "Kì học";
            dgvMonHoc.Columns["IdGiaoVien"].HeaderText = "Id giáo viên";
        }

        private void LoadListMonHoc()
        {
            monHocList.DataSource = MonHocDAO.Instance.GetAll();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {

        }

        private void btnEdit_Click(object sender, EventArgs e)
        {

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {

        }

        private void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}
