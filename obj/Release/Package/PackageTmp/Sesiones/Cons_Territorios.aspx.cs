using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitOp.Sesiones
{
    public partial class Cons_Territorios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) { BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil); }                  
        }

        protected void ButtonVolver_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            GridView1.DataBind();
        }

        protected void ButtonVolver2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            FormView1.DataBind();
            GridView2.DataBind();
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indice = GridView1.SelectedIndex;
            Label _nro_territorio = (Label)GridView1.Rows[indice].FindControl("Label1");
            Lbl_Territorio.Text = _nro_territorio.Text;

            FormView1.DataBind();
            GridView2.DataBind();
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indice = GridView2.SelectedIndex;
            Label _nro_ruta = (Label)GridView2.Rows[indice].FindControl("Label3");
            Lbl_Ruta.Text = _nro_ruta.Text;

            FormView2.DataBind();
            GridView4.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            FormView2.DataBind();
            GridView4.DataBind();
        }

        protected void Rutas_Button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            FormView1.DataBind();
            GridView2.DataBind();
        }
    }
}