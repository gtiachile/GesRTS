using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitOp.Admin
{
    public partial class Criterios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) { BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil); }
            RangeValidator _valida_fecha = (RangeValidator)FormView1.FindControl("Valida_Fecha");
            _valida_fecha.MaximumValue = DateTime.Today.ToShortDateString();
            TextBox _fecha_desde = (TextBox)FormView1.FindControl("Fecha_DesdeTextBox");
            _fecha_desde.Text = "01-01-2014";
            _fecha_desde.Text = Convert.ToDateTime(_fecha_desde.Text).ToShortDateString();
        }

        protected void ImageButton3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            GridView1.DataBind();
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Fecha_DesdeTextBox_TextChanged(object sender, EventArgs e)
        {
//            TextBox _fecha_desde = (TextBox)FormView1.FindControl("Fecha_DesdeTextBox");
//            _fecha_desde.Text = Convert.ToDateTime(_fecha_desde.Text).ToShortDateString();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
//            TextBox _fecha_desde_gv = (TextBox)GridView1.FindControl("TextBox1");
//            _fecha_desde_gv.Text = Convert.ToDateTime(_fecha_desde_gv.Text).ToShortDateString();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indice = GridView1.SelectedIndex;
            RangeValidator _valida_fecha_GV = (RangeValidator)GridView1.Rows[indice].FindControl("Valida_Fecha_GV");
            _valida_fecha_GV.MaximumValue = DateTime.Today.ToShortDateString();
        }
    }
}