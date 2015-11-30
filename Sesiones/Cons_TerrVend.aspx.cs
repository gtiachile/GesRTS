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
    public partial class Cons_TerrVend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) { BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil); }
        }
        

        protected void ButtonVolver_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            GridView3.DataBind();
        }

        protected void Rutas_Click1(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            FormView1.DataBind();
            GridView2.DataBind();
        }

        protected void DropDownVendedor_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView3.DataBind();
        }

        protected void GridView3_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int indice = GridView3.SelectedIndex;
            Label _nro_sesion = (Label)GridView3.Rows[indice].FindControl("Label2");
            Lbl_Sesion.Text = _nro_sesion.Text;
            Label _territorio = (Label)GridView3.Rows[indice].FindControl("Label1");
            Lbl_Territorio.Text = _territorio.Text;
            FormView1.DataBind();
            GridView2.DataBind();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indice2 = GridView2.SelectedIndex;
            Label _nro_ruta = (Label)GridView2.Rows[indice2].FindControl("Label1");
            Lbl_Ruta.Text = _nro_ruta.Text;

            FormView2.DataBind();
            GridView4.DataBind();
        }

        protected void ButtonVolver2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            FormView1.DataBind();
            GridView2.DataBind();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            FormView1.DataBind();
            GridView2.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            FormView2.DataBind();
            GridView4.DataBind();
        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}