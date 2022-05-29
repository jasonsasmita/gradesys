using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;
using DataAccess;

namespace BusinessFacade
{
    public class SiswaSystem
    {
        public bool InsertData(SiswaData objSiswa)
        {
            try
            {
                return new SiswaAccess().InsertData(objSiswa);
            }
            catch(Exception e)
            {
                return false;
            }
        }

        
    }
}
