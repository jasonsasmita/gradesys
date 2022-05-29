using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Common;
using Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;

namespace DataAccess
{
    public class SiswaAccess
    {
        private Database objDB;
        public SiswaAccess()
        {
            try
            {
                objDB = DatabaseFactory.CreateDatabase("dbGrade");
            }
            catch (Exception e)
            {

            }
        }
        
       
        public bool InsertData(SiswaData objSiswa)
        {
            bool retVal = false;
            try
            {
                using (DbConnection dBCon = objDB.CreateConnection())
                {
                    DbCommand cmdDB = objDB.GetStoredProcCommand("SP_InsertData");
                    objDB.AddInParameter(cmdDB, "SiswaID", System.Data.DbType.String, objSiswa.SiswaID);
                    objDB.AddInParameter(cmdDB, "DoB", System.Data.DbType.String, objSiswa.Dob);
                    objDB.AddInParameter(cmdDB, "Gender", System.Data.DbType.String, objSiswa.Gender);
                    objDB.AddInParameter(cmdDB, "Agama", System.Data.DbType.String, objSiswa.Agama);
                    objDB.AddInParameter(cmdDB, "Email", System.Data.DbType.String, objSiswa.Email);
                    objDB.AddInParameter(cmdDB, "Alamat", System.Data.DbType.String, objSiswa.Alamat);
                    objDB.AddInParameter(cmdDB, "BI1", System.Data.DbType.Decimal, objSiswa.BI1);
                    objDB.AddInParameter(cmdDB, "BI2", System.Data.DbType.Decimal, objSiswa.BI2);
                    objDB.AddInParameter(cmdDB, "MAT1", System.Data.DbType.Decimal, objSiswa.MAT1);
                    objDB.AddInParameter(cmdDB, "MAT2", System.Data.DbType.Decimal, objSiswa.MAT2);
                    objDB.AddInParameter(cmdDB, "ING1", System.Data.DbType.Decimal, objSiswa.ING1);
                    objDB.AddInParameter(cmdDB, "ING2", System.Data.DbType.Decimal, objSiswa.ING2);
                    objDB.AddInParameter(cmdDB, "IPA1", System.Data.DbType.Decimal, objSiswa.IPA1);
                    objDB.AddInParameter(cmdDB, "IPA2", System.Data.DbType.Decimal, objSiswa.IPA2);

                    objDB.ExecuteNonQuery(cmdDB);
                }
                retVal = true;
            }
            catch (Exception e)
            {
                retVal = false;
            }
            return retVal;
        }
    }
}
