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
    public partial class Catalo : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack != true)
            {
                if (!this.IsPostBack) { BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil); }
                Fill_Header(DropDownList2.SelectedValue.ToString());
                Confirma_Button.Enabled = false;
                Confirma_Button.Visible = false;
                Cataloga_Button.Enabled = false;
                Cataloga_Button.Visible = false;
            }
        }

        protected void Cataloga_Button_Click(object sender, EventArgs e)
        {
            int _nro_sesion = Convert.ToInt16(Lbl_Sesion.Text);
            string _usuario = BitOP.Global.Usuario;

            Carga_Tabla_Sesion_Temp(_nro_sesion, _usuario);
            
            Carga_Tabla_Territorios_Temp(_nro_sesion);

            MultiView1.ActiveViewIndex = 1;
            FormView1.DataBind();
            GridView2.DataBind();
        }

        protected void Fill_Header(string _criterio_id)
        {
            Lbl_Inicio_Descrip.Text = "";
            Lbl_Fecha_Desde.Text    = "";
            Lbl_Region.Text         = "";
            Lbl_Supervisor.Text     = "";

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
                if (row["Inicio_Nombre"] != DBNull.Value)
                    Lbl_Inicio_Descrip.Text = row["Inicio_Nombre"].ToString();
                if (row["Fecha_Desde"] != DBNull.Value)
                    Lbl_Fecha_Desde.Text    = row["Fecha_Desde"].ToString().Substring(0,10);
                if (row["Region"] != DBNull.Value)
                    Lbl_Region.Text         = row["Region"].ToString();
                if (row["Supervisor"] != DBNull.Value)
                    Lbl_Supervisor.Text     = row["Supervisor"].ToString();
            }
            con.Close();
        }

        protected void Carga_Tabla_Sesion_Temp(int Nro_Sesion, string Usuario)
        {
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/GesRTS");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BopDBConnectionString"];

            using (SqlConnection conn = new SqlConnection(connString.ToString()))
            {
                using (SqlCommand comm = new SqlCommand("dbo.p_Carga_Sesion_Temp", conn))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    SqlParameter p1 = new SqlParameter("@Nro_Sesion", SqlDbType.Int);
                    SqlParameter p2 = new SqlParameter("@Usuario", SqlDbType.VarChar);

                    p1.Direction = ParameterDirection.Input;
                    p2.Direction = ParameterDirection.Input;
                    
                    p1.Value = Nro_Sesion;
                    p2.Value = Usuario;

                    comm.Parameters.Add(p1);
                    comm.Parameters.Add(p2);

                    conn.Open();
                    comm.ExecuteNonQuery();
                }
            }
        }

        protected void Carga_Tabla_Territorios_Temp(int Nro_Sesion)
        {
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/GesRTS");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BopDBConnectionString"];

            using (SqlConnection conn = new SqlConnection(connString.ToString()))
            {
                using (SqlCommand comm = new SqlCommand("dbo.p_Carga_Territorios_Temp", conn))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    // You can call the return value parameter anything, .e.g. "@Result".

                    SqlParameter p1 = new SqlParameter("@Nro_Sesion", SqlDbType.Int);

                    p1.Direction = ParameterDirection.Input;

                    p1.Value = Nro_Sesion;

                    comm.Parameters.Add(p1);

                    conn.Open();
                    comm.ExecuteNonQuery();
                }
            }
        }
        protected void Carga_Tablas_Desde_RTS(int Nro_Sesion, string Usuario, DateTime Fecha_Vigencia, DateTime Fecha_Expiracion)
        {
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/GesRTS");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BopDBConnectionString"];

            using (SqlConnection conn = new SqlConnection(connString.ToString()))
            {
                using (SqlCommand comm = new SqlCommand("dbo.p_Carga_Sesiones", conn))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    // You can call the return value parameter anything, .e.g. "@Result".

                    SqlParameter p1 = new SqlParameter("@Nro_Sesion", SqlDbType.Int);
                    SqlParameter p2 = new SqlParameter("@Usuario", SqlDbType.VarChar);
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

        protected void Borra_Tablas_Temp(int Nro_Sesion)
        {
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/GesRTS");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BopDBConnectionString"];

            using (SqlConnection conn = new SqlConnection(connString.ToString()))
            {
                using (SqlCommand comm = new SqlCommand("dbo.p_Borra_Sesion_Temp", conn))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    // You can call the return value parameter anything, .e.g. "@Result".

                    SqlParameter p1 = new SqlParameter("@Nro_Sesion", SqlDbType.Int);

                    p1.Direction = ParameterDirection.Input;

                    p1.Value = Nro_Sesion;

                    comm.Parameters.Add(p1);

                    conn.Open();
                    comm.ExecuteNonQuery();
                }
            }
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Fill_Header(DropDownList2.SelectedValue.ToString());
            Cataloga_Button.Enabled = false;
            Cataloga_Button.Visible = false;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Cataloga_Button.Enabled = true;
            Cataloga_Button.Visible = true;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indice = GridView1.SelectedIndex;
            Label _nro_sesion = (Label)GridView1.Rows[indice].FindControl("Label3");
            Lbl_Sesion.Text = _nro_sesion.Text;

            Cataloga_Button.Enabled = true;
            Cataloga_Button.Visible = true;
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            int _nro_sesion = Convert.ToInt16(Lbl_Sesion.Text);
            int _cant_regs = 0;

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
            string sql = "SELECT COUNT(Region_ID) AS Cant_Regs FROM Sesiones WHERE [Sesion_Key_RTS] = " + _nro_sesion;
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            da.Fill(ds);
            dt = ds.Tables[0];
            view = new DataView(dt);
            foreach (DataRowView row in view)
            {
                _cant_regs = Convert.ToInt16(row["Cant_Regs"].ToString());
            }

            if (_cant_regs > 0)
                Sesion_Ya_Existe();
            else
                Cataloga_Sesion();

            con.Close();
        }

        protected void Sesion_Ya_Existe()
        {
            Confirma_Button.Text = "Sesión ya catalogada.  Favor confirme.";
            Confirma_Button.Font.Bold = false;
            Confirma_Button.Enabled = true;
            Confirma_Button.Visible = true;
        }

        protected void Cataloga_Sesion()
        {
            int _nro_sesion = Convert.ToInt16(Lbl_Sesion.Text);
            string _usuario = BitOP.Global.Usuario;
            TextBox _tb_fec_vigencia   = (TextBox)FormView1.FindControl("Fec_VigenciaTextBox");
            DateTime _fecha_vigencia   = Convert.ToDateTime(_tb_fec_vigencia.Text);
            TextBox _tb_fec_expiracion = (TextBox)FormView1.FindControl("Fec_ExpiracionTextBox");
            DateTime _fecha_expiracion = Convert.ToDateTime(_tb_fec_vigencia.Text);

            Carga_Tablas_Desde_RTS(_nro_sesion, _usuario, _fecha_vigencia, _fecha_expiracion);

            MultiView1.ActiveViewIndex = 0;

            Cataloga_Button.Enabled = false;
            Cataloga_Button.Visible = false;
            Confirma_Button.Enabled = false;
            Confirma_Button.Visible = false;
        }

        protected void UpdateCancelButton_Click(object sender, EventArgs e)
        {
            int _nro_sesion = Convert.ToInt16(Lbl_Sesion.Text);

            Borra_Tablas_Temp(_nro_sesion);

            MultiView1.ActiveViewIndex = 0;

            Cataloga_Button.Enabled = false;
            Cataloga_Button.Visible = false;
            Confirma_Button.Enabled = false;
            Confirma_Button.Visible = false;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Confirma_Button_Click(object sender, EventArgs e)
        {
            Cataloga_Sesion();

            MultiView1.ActiveViewIndex = 0;

            Cataloga_Button.Enabled = false;
            Cataloga_Button.Visible = false;
            Confirma_Button.Enabled = false;
            Confirma_Button.Visible = false;
        }

    }
}