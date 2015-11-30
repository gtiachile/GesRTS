using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitOp.Sesiones
{
    public partial class Cons_TerrClteHist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) { BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil); }
        }

        protected void TextBoxBusqueda_TextChanged(object sender, EventArgs e)
        {
            TextBoxBusqueda.Text = TextBoxBusqueda.Text.ToUpper();
            GridView1.DataBind();
        }
    }
}