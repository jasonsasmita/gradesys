using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using Common;
using BusinessFacade;
using System.Data.SqlClient;

namespace GradeSys
{
    public partial class Home : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void Cari_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=LAPTOP-0NPBM86K\SQLEXPRESS; Initial Catalog=GradeSiswa; Integrated Security=SSPI; Persist Security Info=False";
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT COUNT(*) FROM DataSiswa WHERE SiswaID = " + NIM.Text;
            cmd.Connection = conn;

            SqlDataReader read = cmd.ExecuteReader();
            if (read.Read())
            {
                int count = (int)read[0];
                if (count > 0)
                {
                    Field.Visible = true;
                    GradePanel.Visible = true;
                    Save.Visible = true;
                    read.Close();
                    SqlCommand cmdGet = new SqlCommand();
                    cmdGet.CommandText = "SELECT * FROM DataSiswa WHERE SiswaID = " + NIM.Text;
                    cmdGet.Connection = conn;
                    
                    SqlDataReader rdr = cmdGet.ExecuteReader();
                    if (rdr.Read())
                    {
                        txtName.Text = rdr.GetValue(1).ToString();
                        txtDOB.Text = rdr.GetValue(2).ToString();
                        txtGender.SelectedValue = rdr.GetValue(3).ToString();
                        txtReligion.Text = rdr.GetValue(4).ToString();
                        Email.Text = rdr.GetValue(5).ToString();
                        address.InnerText = rdr.GetValue(6).ToString();
                        BahasaIndo1.Text = rdr.GetValue(7).ToString();
                        BahasaIndo2.Text = rdr.GetValue(8).ToString();
                        Matematika1.Text = rdr.GetValue(9).ToString();
                        Matematika2.Text = rdr.GetValue(10).ToString();
                        Inggris1.Text = rdr.GetValue(11).ToString();
                        Inggris2.Text = rdr.GetValue(12).ToString();
                        Alam1.Text = rdr.GetValue(13).ToString();
                        Alam2.Text = rdr.GetValue(14).ToString();
                       
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('SiswaID tidak ditemukan')", true);
                }
            }

 
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SiswaData objSiswaData = new SiswaData();
            objSiswaData.SiswaID = NIM.Text;
            objSiswaData.Nama = txtName.Text;
            objSiswaData.Dob = txtDOB.Text;
            objSiswaData.Gender = txtGender.SelectedValue;
            objSiswaData.Agama = txtReligion.SelectedValue;
            objSiswaData.Email = Email.Text;
            objSiswaData.Alamat = address.InnerText;
            objSiswaData.BI1 = double.Parse(s: BahasaIndo1.Text);
            objSiswaData.BI2 = double.Parse(s:BahasaIndo1.Text);
            objSiswaData.ING1 = double.Parse(s:Inggris1.Text);
            objSiswaData.ING2 = double.Parse(s:Inggris2.Text);
            objSiswaData.MAT1 = double.Parse(s:Matematika1.Text);
            objSiswaData.MAT2 = double.Parse(s:Matematika2.Text);
            objSiswaData.IPA1 = double.Parse(s:Alam1.Text);
            objSiswaData.IPA2 = double.Parse(s:Alam2.Text);

            bool returnValue = new SiswaSystem().InsertData(objSiswaData);

            if (returnValue)
                checksave.Text = "Data Saved";
            else
                checksave.Text = "Data not Saved";
        }
        protected void Grade_TextChanged(object sender, EventArgs e)
        {
            double GradeIPA1 = double.Parse(s: Alam1.Text,CultureInfo.InvariantCulture);
            double GradeIPA2 = double.Parse(s: Alam2.Text, CultureInfo.InvariantCulture);
            double GradeING1 = double.Parse(s: Inggris1.Text, CultureInfo.InvariantCulture);
            double GradeING2 = double.Parse(s: Inggris2.Text, CultureInfo.InvariantCulture);
            double GradeMat1 = double.Parse(s: Matematika1.Text, CultureInfo.InvariantCulture);
            double GradeMat2 = double.Parse(s: Matematika2.Text, CultureInfo.InvariantCulture);
            double GradeBI1 = double.Parse(s: BahasaIndo1.Text, CultureInfo.InvariantCulture);
            double GradeBI2 = double.Parse(s: BahasaIndo2.Text, CultureInfo.InvariantCulture);
            double answerIPA = Math.Round((GradeIPA1 + GradeIPA2) / 2, 2);
            double answerING = Math.Round((GradeING1 + GradeING2) / 2, 2);
            double answerMAT = Math.Round((GradeMat1 + GradeMat2) / 2, 2);
            double answerBI =  Math.Round((GradeBI1 + GradeBI2) / 2, 2);
            TotalIPA.Text = answerIPA.ToString(CultureInfo.InvariantCulture);
            TotalInggris.Text = answerING.ToString(CultureInfo.InvariantCulture);
            TotalMat.Text = answerMAT.ToString(CultureInfo.InvariantCulture);
            TotalBI.Text = answerBI.ToString(CultureInfo.InvariantCulture);
            double Total= Math.Round((answerBI + answerING + answerIPA + answerMAT) / 4, 2);
            Rata2.Text = Total.ToString(CultureInfo.InvariantCulture);

            if (Total >= 90)
                TotalGrade.Text = "A";
            else if (Total < 90 && Total >= 75)
                TotalGrade.Text = "B";
            else if (Total < 75 && Total >= 65)
                TotalGrade.Text = "C";
            else if (Total < 65 && Total >= 55)
                TotalGrade.Text = "D";
            else 
                TotalGrade.Text = "F";
        }
    }
}