using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitOp.Admin
{
    public partial class Regiones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) { BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil); }                  
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void ImageButton1_Click1(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }
    }
}