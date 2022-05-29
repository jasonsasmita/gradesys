using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    [Serializable]
    public class SiswaData
    {
        public string SiswaID { get; set; }
        public string Nama { get; set; }
        public string Dob { get; set; }
        public string Gender { get; set; }
        public string Agama { get; set; }
        public string Email { get; set; }
        public string Alamat { get; set; }
        public double BI1 { get; set; }
        public double BI2 { get; set; }
        public double MAT1 { get; set; }
        public double MAT2 { get; set; }
        public double ING1 { get; set; }
        public double ING2 { get; set; }
        public double IPA1 { get; set; }
        public double IPA2 { get; set; }

    }
}
