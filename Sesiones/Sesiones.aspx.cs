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
    public partial class SesionesTP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) { BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil); }
            Lbl_Region.Visible      = false;
            Eliminar_Button.Enabled = false;
            Eliminar_Button.Visible = false;
        }

        protected void Fill_Header(string _region_id)
        {
            Lbl_Region.Text    = _region_id;
            Lbl_Region.Visible = true;
        }
        protected void InsertButton_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void InsertButton_Click2(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void InsertCancelButton_Click1(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Borra_Sesion(int Nro_Sesion, string Usuario)
        {
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/GesRTS");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BopDBConnectionString"];

            using (SqlConnection conn = new SqlConnection(connString.ToString()))
            {
                using (SqlCommand comm = new SqlCommand("dbo.p_Borra_Sesiones", conn))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    // You can call the return value parameter anything, .e.g. "@Result".

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

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int indice = GridView1.SelectedIndex;
            Label _nro_sesion = (Label)GridView1.Rows[indice].FindControl("Label1");
            Lbl_Sesion.Text = _nro_sesion.Text;

            Eliminar_Button.Visible = true;
            Eliminar_Button.Enabled = true;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Fill_Header(DropDownList2.SelectedValue.ToString());
        }

        protected void Eliminar_Button_Click(object sender, EventArgs e)
        {
            int _nro_sesion = Convert.ToInt16(Lbl_Sesion.Text);
            string _usuario = BitOP.Global.Usuario;

            Borra_Sesion(_nro_sesion, _usuario);

            GridView1.DataBind();
            Fill_Header(DropDownList2.SelectedValue.ToString());
        }

        protected void ImageButton1_Click2(object sender, ImageClickEventArgs e)
        {
            Eliminar_Button.Visible = true;
            Eliminar_Button.Enabled = true;
        }

    }
}