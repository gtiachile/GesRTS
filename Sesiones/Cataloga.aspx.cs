using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BitOp.Sesiones
{
    public partial class Cataloga1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack != true)
            {
                if (!this.IsPostBack) { BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil); }
                Fill_Header(DropDownList2.SelectedValue.ToString());
            }
        }

        protected void CatalogaSesion_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            GridView1.DataBind();
        }

        protected void UpdateCancelButton_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        protected void Fill_Header(string _criterio_id)
        {
            Lbl_Inicio_Descrip.Text = "";
            Lbl_Fecha_Desde.Text = "";
            Lbl_Region.Text = "";
            Lbl_Supervisor.Text = "";

            SqlConnection con;
            SqlCommand cmd = new SqlCommand();
            DataView view = null;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/GesRTS");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BopDBConnectionString"];
            con = new SqlConnection(connString.ToString());
            cmd.Connection = con;
            con.Open();
            string sql = "SELECT * FROM Criterios WHERE [Criterio_ID]='" + _criterio_id + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            da.Fill(ds);
            dt = ds.Tables[0];
            view = new DataView(dt);
            foreach (DataRowView row in view)
            {
                Lbl_Inicio_Descrip.Text = row["Inicio_Nombre"].ToString();
                Lbl_Fecha_Desde.Text    = row["Fecha_Desde"].ToString();
                Lbl_Region.Text         = row["Region"].ToString();
                Lbl_Supervisor.Text     = row["Supervisor"].ToString();
            }
            con.Close();
        }

        protected void Carga_Tablas_Desde_RTS(int Nro_Sesion, string Usuario, DateTime Fecha_Vigencia, DateTime Fecha_Expiracion)
        {

            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/GesRTS");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BopDBConnectionString"];

            using (SqlConnection conn = new SqlConnection(connString.ToString()))
            {
                using (SqlCommand comm = new SqlCommand("dbo.Carga_Sesiones", conn))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    // You can call the return value parameter anything, .e.g. "@Result".

                    SqlParameter p1 = new SqlParameter("@Nro_Sesion", SqlDbType.Int);
                    SqlParameter p2 = new SqlParameter("@Usuario", SqlDbType.Text);
                    SqlParameter p3 = new SqlParameter("@Fecha_Vigencia", SqlDbType.Date);
                    SqlParameter p4 = new SqlParameter("@Fecha_Expiracion", SqlDbType.Date);

                    p1.Direction = ParameterDirection.Input;
                    p2.Direction = ParameterDirection.Input;
                    p3.Direction = ParameterDirection.Input;
                    p4.Direction = ParameterDirection.Input;
                    
                    p1.Value = Nro_Sesion;
                    p2.Value = Usuario;
                    p3.Value = Fecha_Vigencia;
                    p4.Value = Fecha_Expiracion;

                    comm.Parameters.Add(p1);
                    comm.Parameters.Add(p2);
                    comm.Parameters.Add(p3);
                    comm.Parameters.Add(p4);

                    conn.Open();
                    comm.ExecuteNonQuery();

                }
            }
        }


        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Fill_Header(DropDownList2.SelectedValue.ToString());
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indice = GridView1.SelectedIndex;
            Label _nro_sesion = (Label)GridView1.Rows[indice].FindControl("Label3");
            Lbl_Sesion.Text = _nro_sesion.Text;
            FormView1.DataBind();
            GridView1.DataBind();
        }
    }
}