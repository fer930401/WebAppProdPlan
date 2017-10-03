using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaNegocio;

using AccesoDatos;

namespace WebAppProdPlan
{
    public partial class Planeacion : System.Web.UI.Page
    {
        //string CadenaConecta = @"Data Source=skyhdev3;Initial Catalog=develop;User ID=soludin_develop;Password=dinamico20";
        string CadenaConecta = @"Data Source=SQL;Initial Catalog=skytex;User ID=soludin_develop;Password=dinamico20";
                    
        LogicaNegocioCls logicaNegocio = new LogicaNegocioCls();
        int? resInsert = 0, resSP = 0, resDelete = 0;
        string msgInsert = "", msgSP = "", msgDelete = "";
        int? errorInsert = 0, errorSP = 0, errorDelete = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                llenaDispos();
                maximo.Text = cantMaxima();
            }
            //llenaDispos();           
        }

        public void llenaDispos()
        {
            try
            {
                DataTable listado = new DataTable();
                SqlConnection _conn = new SqlConnection(CadenaConecta);
                SqlCommand _cmd = new SqlCommand();
                _cmd.Connection = _conn;
                _cmd.CommandTimeout = 3600;
                _cmd.CommandType = CommandType.Text;
                _cmd.CommandText = String.Format("exec sp_masterutileria");
                SqlDataAdapter _da = new SqlDataAdapter(_cmd);
                _conn.Open();
                _cmd.ExecuteNonQuery();
                _da.Fill(listado);
                _conn.Close();
                Repeater1.DataSource = listado;
                Repeater1.DataBind();
            }
            catch (Exception e)
            {
                int contar = e.Message.IndexOf('\r');
                string msgLbl = e.Message.Substring(0, contar).Replace("'", "*");;
                lbl.Text = "<div class='alert alert-danger' role='alert'><span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span> Se Encontro Un Error: " + msgLbl + ", Favor de revisar.</div>";
            }
            
        }

        public string cantMaxima()
        {
            string r = "";
            SqlConnection _conn = new SqlConnection(CadenaConecta);
            SqlCommand _cmd = new SqlCommand();
            _cmd.Connection = _conn;
            _cmd.CommandTimeout = 3600;
            _cmd.CommandType = CommandType.Text;
            _cmd.CommandText = String.Format("exec consWeb '{0}'", "maxCan");
            SqlDataAdapter _da = new SqlDataAdapter(_cmd);
            _conn.Open();
            r = Convert.ToString(_cmd.ExecuteScalar());
            _conn.Close();
            return r.TrimEnd(' ');            
        }
        
        protected void generar_Click(object sender, EventArgs e)
        {
            string[, ,] tina1 = new string[10, 5, 3];
            string[, ,] tina2 = new string[10, 5, 3];
            string[, ,] tina3 = new string[10, 5, 3];
            string envio = Request["envio"].ToString();
            string recibe = Request["recibe"].ToString();
            string pieza = Request["pieza"].ToString();
            string elemento = Request["elemento"].ToString();
            string tina = Request["tina"].ToString();

            if (envio.Equals(",,,") == true)
            {
                string message = "alert('Usted no ha asignado elementos a las tinas');window.location.href = 'Planeacion.aspx';";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);          
            }
            else
            {
                string[] envios = envio.Split(',');
                string[] recibes = recibe.Split(',');
                string[] piezas = pieza.Split(',');
                string[] elementos = elemento.Split(',');
                string[] tinas = tina.Split(',');
            
                for (int i = 1; i < envios.Length; i++)
                {
                    if (envios[i].Equals("") == false)
                    {
                        try
                        {
                            AccesoDatos.sp_WebAppProdPlan_Result insertDispos = logicaNegocio.insertDispo(envios[i].ToString().Trim(' '), decimal.Parse(recibes[i].ToString()), decimal.Parse(piezas[i].ToString()), elementos[i].ToString(), int.Parse(tinas[i].ToString()), 1);
                            if (insertDispos != null)
                            {
                                resInsert = insertDispos.resultado;
                                errorInsert = insertDispos.error;
                                msgInsert = insertDispos.mensaje;
                            }
                        }
                        catch (Exception ex)
                        {
                            string message1 = "alert('Se Encontro Un Error: " + ex.Message.Replace("'", "*") + ", Favor de revisar.')";
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message1, true);
                        }
                    }
                }
                /* si la insersion no mando un error  */
                if (errorInsert == 0)
                {
                    //try 
                    //{
                    //    /* ejecuto el sp_mastergen_utileria */
                    //    AccesoDatos.sp_WebAppProdPlan_Result execSP = logicaNegocio.insertDispo("", 0, 0, "", 0, 2);
                    //    if (execSP != null)
                    //    {
                    //        resSP = execSP.resultado;
                    //        errorSP = execSP.error;
                    //        msgSP = execSP.mensaje;
                    //    }
                    //}
                    //catch (Exception ex)
                    //{
                    //    errorSP = 2;
                    //    msgSP = ex.Message.Replace("'", "*");
                    //}
                    string r = "";
                    SqlConnection _conn = new SqlConnection(CadenaConecta);
                    SqlCommand _cmd = new SqlCommand();
                    _cmd.Connection = _conn;
                    _cmd.CommandTimeout = 3600;
                    _cmd.CommandType = CommandType.Text;
                        
                    try
                    {
                        _cmd.CommandText = String.Format("exec sp_mastergen_utileria");
                        SqlDataAdapter _da = new SqlDataAdapter(_cmd);
                        _conn.Open();
                        r = Convert.ToString(_cmd.ExecuteScalar());
                        resSP = 1;
                        errorSP = 0;
                    }catch(Exception ex)
                    {
                        resSP = 0;
                        errorSP = 2;
                        msgSP = ex.Message.Replace("'", "*");
                        //_conn.Close();
                    }
                    _conn.Close();
                }
                else
                {
                    /* alerta de error en la insercion de las dispos */
                    errorSP = 2;
                    for (int i = 1; i < envios.Length; i++)
                    {
                        if (envios[i].Equals("") == false)
                        {
                            AccesoDatos.sp_WebAppProdPlan_Result deleteDispos = logicaNegocio.insertDispo(envios[i].ToString().Trim(' '), decimal.Parse(recibes[i].ToString()), decimal.Parse(piezas[i].ToString()), elementos[i].ToString(), int.Parse(tinas[i].ToString()), 3);
                            if (deleteDispos != null)
                            {
                                resDelete = deleteDispos.resultado;
                                errorDelete = deleteDispos.error;
                                msgDelete = deleteDispos.mensaje;
                            }
                        }
                    }
                    if (errorDelete == 3)
                    {
                        string message2 = "alert('Se Encontro Un Error: " + msgDelete + ", Favor de revisar.')";
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message2, true);
                    }
                    else
                    {
                        /* muestra el mensaje de error de la ejecucion del sp_mastergen_utileria */
                        int contar = msgSP.IndexOf('\r');
                        msgSP = msgSP.Substring(0, contar);
                        string message7 = "alert('Se encontro un error: " + msgSP + ". Favor de revisar.')";
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message7, true);
                    }
                    string message3 = "alert('Se Encontro Un Error: " + msgInsert + ", Favor de revisar.')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message3, true);
                }
                /* si la ejecucion de sp_mastergen_utileria regreso un error elimino los registros que se insertaron arriba */
                if (errorSP == 2)
                {
                    for (int i = 1; i < envios.Length; i++)
                    {
                        if (envios[i].Equals("") == false)
                        {
                            AccesoDatos.sp_WebAppProdPlan_Result deleteDispos = logicaNegocio.insertDispo(envios[i].ToString().Trim(' '), decimal.Parse(recibes[i].ToString()), decimal.Parse(piezas[i].ToString()), elementos[i].ToString(), int.Parse(tinas[i].ToString()), 3);
                            if (deleteDispos != null)
                            {
                                resDelete = deleteDispos.resultado;
                                errorDelete = deleteDispos.error;
                                msgDelete = deleteDispos.mensaje;
                            }
                        }
                    }
                    if (errorDelete == 3)
                    {
                        string message4 = "alert('Se Encontro Un Error: " + msgDelete + ", Favor de revisar.')";
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message4, true);
                    }
                    else
                    {
                        /* muestra el mensaje de error de la ejecucion del sp_mastergen_utileria */
                        int contar = msgSP.IndexOf('\r');
                        msgSP = msgSP.Substring(0, contar);
                        string message5 = "alert('Se encontro un error: " + msgSP + ". Favor de revisar.')";
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message5, true);
                    }
                }
                else
                {
                    //Session["exitoso"] = "El proceso se ejecuto correctamente.";
                    string message6 = "alert('El proceso se ejecuto correctamente.');  window.location.href = 'Planeacion.aspx';";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message6, true);
                }
            }       
        }
    }
}