using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AccesoDatos;

namespace LogicaNegocio
{
    public class LogicaNegocioCls
    {
        AccesoDatos.AccesoDatosCls datos;
        public LogicaNegocioCls()
        {
            datos = new AccesoDatosCls();
        }
        public AccesoDatos.sp_WebAppProdPlan_Result insertDispo(string cve_dispo, decimal kilos, decimal piezas, string ele_cve, int tina, int opc)
        {
            return datos.insertDispo(cve_dispo, kilos, piezas, ele_cve, tina, opc);
        }
    }
}
