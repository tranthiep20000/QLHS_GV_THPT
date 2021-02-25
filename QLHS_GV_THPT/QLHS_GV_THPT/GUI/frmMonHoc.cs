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
            BindingDataToForm();
        }

        private void BindingDataToForm()
        {
            txtTenMH.DataBindings.Add(new Binding("Text", dgvMonHoc.DataSource, "TenMonHoc", true, DataSourceUpdateMode.Never));
            txtSoTiet.DataBindings.Add(new Binding("Text", dgvMonHoc.DataSource, "SoTietHoc", true, DataSourceUpdateMode.Never));
            txtNamHoc.DataBindings.Add(new Binding("Text", dgvMonHoc.DataSource, "NamHoc", true, DataSourceUpdateMode.Never));
            cbbKiHoc.DataBindings.Add(new Binding("Text", dgvMonHoc.DataSource, "KiHoc", true, DataSourceUpdateMode.Never));
            cbbGV.DataBindings.Add(new Binding("Text", dgvMonHoc.DataSource, "IdGiaoVien", true, DataSourceUpdateMode.Never));
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
            int row = dgvMonHoc.CurrentCell.RowIndex;
            int idMonHoc;
            Int32.TryParse(dgvMonHoc.Rows[row].Cells[0].Value.ToString().Trim(), out idMonHoc);
            try
            {
                if (MessageBox.Show("Bạn có thật sự muốn xoá môn học này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    MonHocDAO.Instance.Delete(idMonHoc);
                    MessageBox.Show("Xóa thành công");
                    LoadListMonHoc();
                }

            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
                LoadListMonHoc();
            }



        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            string search = txtTimKiem.Text.Trim();
            if( search.Equals(""))
            {
                MessageBox.Show("Mời bạn nhập thông tin tìm kiếm!");
                return;
            }
            else
            {
                monHocList.DataSource = MonHocDAO.Instance.Search(search); 
            }
        }
    }
}
