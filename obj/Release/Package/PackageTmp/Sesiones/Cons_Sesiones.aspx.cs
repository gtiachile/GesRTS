using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitOp.Sesiones
{
    public partial class Cataloga : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) { BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil); }
            Lbl_Region.Visible = false;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Fill_Header(DropDownList1.SelectedValue.ToString());
        }
        protected void Fill_Header(string _region_id)
        {
            Lbl_Region.Text = _region_id;
            Lbl_Region.Visible = true;
        }


        protected void Territorios_Button_Click(object sender, EventArgs e)
        {
            MultiView2.ActiveViewIndex = 1;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indice = GridView1.SelectedIndex;
            Label _nro_sesion = (Label)GridView1.Rows[indice].FindControl("Label6");
            Lbl_Sesion.Text = _nro_sesion.Text;

            FormView1.DataBind();
            GridView4.DataBind();
        }

        protected void ButtonVolver_Click(object sender, EventArgs e)
        {
            MultiView2.ActiveViewIndex = 0;
            GridView1.DataBind();
        }

        protected void Rutas_Button_Click1(object sender, EventArgs e)
        {
            MultiView2.ActiveViewIndex = 2;
        }

        protected void Button_Volver2_Click(object sender, EventArgs e)
        {
            MultiView2.ActiveViewIndex = 1;
        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indice = GridView4.SelectedIndex;
            Label _nro_territorio = (Label)GridView4.Rows[indice].FindControl("Label1");
            Lbl_Territorio.Text = _nro_territorio.Text;

            FormView2.DataBind();
            GridView3.DataBind();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indice = GridView3.SelectedIndex;
            Label _nro_ruta = (Label)GridView3.Rows[indice].FindControl("Label8");
            Lbl_Ruta.Text = _nro_ruta.Text;

            FormView3.DataBind();
            GridView5.DataBind();
        }

        protected void Paradas_Button_Click(object sender, EventArgs e)
        {
            MultiView2.ActiveViewIndex = 3;
        }

        protected void ButtonVolver2_Click(object sender, EventArgs e)
        {
            MultiView2.ActiveViewIndex = 2;
        }

    }
}