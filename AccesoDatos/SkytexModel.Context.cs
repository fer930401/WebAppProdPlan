﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AccesoDatos
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class developEntities : DbContext
    {
        public developEntities()
            : base("name=developEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
    
        public virtual ObjectResult<sp_WebAppProdPlan_Result> sp_WebAppProdPlan(string cve_dispo, Nullable<decimal> kilos, Nullable<decimal> piezas, string ele_cve, Nullable<int> tina, Nullable<int> opc)
        {
            var cve_dispoParameter = cve_dispo != null ?
                new ObjectParameter("cve_dispo", cve_dispo) :
                new ObjectParameter("cve_dispo", typeof(string));
    
            var kilosParameter = kilos.HasValue ?
                new ObjectParameter("kilos", kilos) :
                new ObjectParameter("kilos", typeof(decimal));
    
            var piezasParameter = piezas.HasValue ?
                new ObjectParameter("piezas", piezas) :
                new ObjectParameter("piezas", typeof(decimal));
    
            var ele_cveParameter = ele_cve != null ?
                new ObjectParameter("ele_cve", ele_cve) :
                new ObjectParameter("ele_cve", typeof(string));
    
            var tinaParameter = tina.HasValue ?
                new ObjectParameter("tina", tina) :
                new ObjectParameter("tina", typeof(int));
    
            var opcParameter = opc.HasValue ?
                new ObjectParameter("opc", opc) :
                new ObjectParameter("opc", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_WebAppProdPlan_Result>("sp_WebAppProdPlan", cve_dispoParameter, kilosParameter, piezasParameter, ele_cveParameter, tinaParameter, opcParameter);
        }
    }
}