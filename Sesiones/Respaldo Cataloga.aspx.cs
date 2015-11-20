using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitOp.Sesiones
{
    public partial class Cataloga1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack != true)
            {
                if (!this.IsPostBack) { BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil); }
                Fill_User_Header();
            }
        }
        protected void Fill_User_Header()
        {
            DataView view = null;
            SqlConnection con;
            SqlCommand cmd = new SqlCommand();
            DataSet ds     = new DataSet();
            DataTable dt   = new DataTable();
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/BitOp");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BopDBConnectionString"];
            con            = new SqlConnection(connString.ToString());
            cmd.Connection = con;
            con.Open();
            string sql = @"SELECT Fecha_Desde, Inicio_Nombre, Region, Supervisor
                         FROM Criterios
                         WHERE Criterio_ID = " + @Criterio_ID;
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            da.Fill(ds);
            dt = ds.Tables[0];
            view = new DataView(dt);
            foreach (DataRowView row in view)
            {
                Lbl_Fecha_Desde.Text    = row["Fecha_Desde"].ToString("dd-MM-yyyy");
                Lbl_Inicio_Descrip.Text = row["Inicio_Nombre"].ToString();
                Lbl_Region.Text         = row["Region"].ToString();
                Lbl_Supervisor.Text     = row["Supervisor"].ToString();
             }

            con.Close();
        }

        protected void CatalogaSesion_Click(object sender, EventArgs e)
        {

        }
    }
}