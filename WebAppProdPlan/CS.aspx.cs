using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppProdPlan
{
    public partial class CS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl.Text = "adentro: " + DateTime.Now.ToLongTimeString();
            lbl2.Text = "afuera: " + DateTime.Now.ToLongTimeString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Response.Write("<script type=\"text/javascript\">alert('El proceso se ejecuto correctamente'); </script>");
        }
    }
}