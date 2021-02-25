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
            LoadComboboxGiaoVien();
            LoadComboboxKiHoc();
        }

        private void LoadComboboxKiHoc()
        {
            cbbKiHoc.Items.Add("1");
            cbbKiHoc.Items.Add("2");
        }

        private void LoadComboboxGiaoVien()
        {
            cbbGV.DataSource = MonHocDAO.Instance.GetAll();//GiaoVienDAO
            cbbGV.DisplayMember = "IdGiaoVien";
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
            string tenMonHoc = txtTenMH.Text;
            int soTietHoc = -1;
            Int32.TryParse(txtSoTiet.Text, out soTietHoc);
            int idGiaoVien = -1;
            Int32.TryParse(cbbGV.Text, out idGiaoVien);
            string namHoc = txtNamHoc.Text;
            int kiHoc = -1;
            Int32.TryParse(cbbKiHoc.Text, out kiHoc);

            try
            {
                if (tenMonHoc == "" || namHoc == "" || soTietHoc == -1 || kiHoc == -1 || idGiaoVien == -1)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                MonHocDAO.Instance.Insert(tenMonHoc, soTietHoc, namHoc, kiHoc, idGiaoVien);
                MessageBox.Show("Thêm thành công");
                LoadListMonHoc();
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {

            int row = dgvMonHoc.CurrentCell.RowIndex;
            int idMonHoc;
            Int32.TryParse(dgvMonHoc.Rows[row].Cells[0].Value.ToString().Trim(), out idMonHoc);

            string tenMonHoc = txtTenMH.Text;
            int soTietHoc = -1;
            Int32.TryParse(txtSoTiet.Text, out soTietHoc);
            int idGiaoVien = -1;
            Int32.TryParse(cbbGV.Text, out idGiaoVien);
            string namHoc = txtNamHoc.Text;
            int kiHoc = -1;
            Int32.TryParse(cbbKiHoc.Text, out kiHoc);

            try
            {
                if (idMonHoc == -1 || tenMonHoc == "" || namHoc == "" || soTietHoc == -1 || kiHoc == -1 || idGiaoVien == null)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                if (MessageBox.Show("Bạn có thật sự muốn sửa môn học này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    MonHocDAO.Instance.Update(idMonHoc, tenMonHoc, soTietHoc, namHoc, kiHoc, idGiaoVien);
                    MessageBox.Show("Cập nhật thành công");
                    LoadListMonHoc();
                }
                    
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
                LoadListMonHoc();
            }
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
                    MessageBox.Show("Xóa thành công!");
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
