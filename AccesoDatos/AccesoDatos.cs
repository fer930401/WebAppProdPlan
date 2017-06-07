using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace AccesoDatos
{
    public class AccesoDatosCls
    {
        developEntities contexto;
        public AccesoDatosCls()
        {
            //inicializacion de la variable contexto
            contexto = new developEntities();
        }
        /*public List<sp_masterutileria> obtLista()
        {
            //retorna los resultados de la busqueda en forma de lista
            return (contexto.sp_masterutilerias()).ToList();
        }*/
        public sp_WebAppProdPlan_Result insertDispo(string cve_dispo, decimal kilos, decimal piezas, string ele_cve, int tina, int opc)
        {
            return (contexto.sp_WebAppProdPlan(cve_dispo, kilos, piezas, ele_cve, tina, opc)).FirstOrDefault();
        }
    }
}
