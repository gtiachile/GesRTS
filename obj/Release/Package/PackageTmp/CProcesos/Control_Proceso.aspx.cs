using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace BitOp.CProcesos
{
    public partial class Control_Proceso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack != true)
            {
                if (!this.IsPostBack) { BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil); }
                lblFecha.Text = DateTime.Today.ToString("dd-MM-yyyy");
                lblResponsable.Text = BitOP.Global.Nombre;
                Fill_User_Header();
            }
        }

        protected void Fill_User_Header()
        {
            DataView view = null;
            SqlConnection con;
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/BitOp");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BopDBConnectionString"];
            con = new SqlConnection(connString.ToString());
            cmd.Connection = con;
            con.Open();
            string sql = @"SELECT        TOP (1) UsuarioFuncion.Usuario, UsuarioFuncion.Funcion, UsuarioFuncion.Area, UsuarioFuncion.Turno, Areas.Descripción AS AreaDsc, Plantas.Descripción AS PlantaDsc, TurnoPlanta.Descripción AS TurnoDsc, 
                         Equipos.Descripción AS DscEquipo, Equipos.Equipo, UsuarioFuncion.NivelRegDetencion, UsuarioFuncion.DiasAtrasoReg, Plantas.Planta, Equipos.Proceso
                         FROM UsuarioFuncion INNER JOIN
                         Areas ON UsuarioFuncion.Area = Areas.Area INNER JOIN
                         Plantas ON Areas.Planta = Plantas.Planta INNER JOIN
                         TurnoPlanta ON UsuarioFuncion.Turno = TurnoPlanta.Codigo INNER JOIN
                         Equipos ON UsuarioFuncion.Equipo = Equipos.Equipo WHERE
                         UsuarioFuncion.Usuario = '" + BitOP.Global.Usuario + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            da.Fill(ds);
            dt = ds.Tables[0];
            view = new DataView(dt);
            foreach (DataRowView row in view)
            {

                lblCargo.Text = row["Funcion"].ToString();
                lblArea.Text = row["AreaDsc"].ToString();
                lblPlanta.Text = row["PlantaDsc"].ToString();
                SelPlanta.Text = row["Planta"].ToString();
                SelProceso.Text = row["Area"].ToString();
                lblEquipo.Text = row["DscEquipo"].ToString();
                lblCodEquipo.Text = row["Equipo"].ToString();
                lblTurno.Text = row["TurnoDsc"].ToString();
                lblNivRegDet.Text = row["NivelRegDetencion"].ToString();
                lblDiasAtr.Text = row["DiasAtrasoReg"].ToString();
                lblUsuario.Text = row["Usuario"].ToString();
                if (lblNivRegDet.Text == "Planta")
                {
                    lblLocalizacion.Text = row["Planta"].ToString();
                }
                if (lblNivRegDet.Text == "Area")
                {
                    lblLocalizacion.Text = row["Area"].ToString();
                }
                if (lblNivRegDet.Text == "Proceso")
                {
                    lblLocalizacion.Text = row["Proceso"].ToString();
                }
                if (lblNivRegDet.Text == "Equipo")
                {
                    lblLocalizacion.Text = row["Equipo"].ToString();
                }
            }
            con.Close();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int i = GridView1.SelectedIndex;
            Label lblPlanilla = (Label)GridView1.Rows[i].FindControl("lblNroPlanilla");
            SelPlanilla.Text = lblPlanilla.Text;
            GridView2.DataBind();
        }


        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView2.Rows[e.RowIndex];
            TextBox txtPlanta = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBoxPlanta");
            txtPlanta.Text = SelPlanta.Text;
            TextBox txtArea = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBoxArea");
            txtArea.Text = SelArea.Text;
            TextBox txtProceso = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBoxProceso");
            txtProceso.Text = SelProceso.Text;
            TextBox txtEquipo = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBoxEquipo");
            txtEquipo.Text = lblCodEquipo.Text;
            TextBox txtVariable = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBoxVariable");
            TextBox txtValor = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBoxValor");
            Label lblLimSup = (Label)GridView2.Rows[e.RowIndex].FindControl("LabelLimSup");
            Label lblLimInf = (Label)GridView2.Rows[e.RowIndex].FindControl("LabelLimInf");
            Label lblUnidad = (Label)GridView2.Rows[e.RowIndex].FindControl("LabelUnidad");
            TextBox txtFecha = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBoxFecha");
            TextBox txtHora = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBoxHora");
            TextBox txtLoteSAP = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBoxLoteSAP");
            DropDownList DDListMaterial = (DropDownList)GridView2.Rows[e.RowIndex].FindControl("DropDownListMaterial");
            String material = DDListMaterial.SelectedValue.ToString();
            TextBox txtObs = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBoxObs");
            String usuario = lblUsuario.Text.ToString();
            AgregaModificaMedicion(txtPlanta.Text, txtArea.Text, txtProceso.Text, txtEquipo.Text, txtVariable.Text, txtFecha.Text, txtHora.Text, txtLoteSAP.Text, material, Convert.ToDecimal(txtValor.Text.ToString()), Convert.ToDecimal(lblLimSup.Text.ToString()), Convert.ToDecimal(lblLimInf.Text.ToString()), lblUnidad.Text, txtObs.Text,  usuario);
        }

        protected void AgregaModificaMedicion(string Planta,string Area,string Proceso,string Equipo, string Variable, string Fecha, string Hora, string LoteSAP, string Material, decimal Valor, decimal LimSup, decimal LimInf, string Unidad, string Observacion, string UsuarioUltAct)
        {

            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/BitOp");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BopDBConnectionString"];

            using (SqlConnection conn = new SqlConnection(connString.ToString()))
            {
                using (SqlCommand comm = new SqlCommand("dbo.p_ValidaInsertaMEDICIONES", conn))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    SqlParameter p1 = new SqlParameter("@Planta", SqlDbType.VarChar);
                    SqlParameter p2 = new SqlParameter("@Area", SqlDbType.VarChar);
                    SqlParameter p3 = new SqlParameter("@Proceso", SqlDbType.VarChar);
                    SqlParameter p4 = new SqlParameter("@Equipo", SqlDbType.VarChar);
                    SqlParameter p5 = new SqlParameter("@Variable", SqlDbType.VarChar);
                    SqlParameter p6 = new SqlParameter("@Fecha", SqlDbType.VarChar);
                    SqlParameter p7 = new SqlParameter("@Hora", SqlDbType.VarChar);
                    SqlParameter p8 = new SqlParameter("@LoteSAP", SqlDbType.VarChar);
                    SqlParameter p9 = new SqlParameter("@Material", SqlDbType.VarChar);
                    SqlParameter p10 = new SqlParameter("@Valor", SqlDbType.Decimal);
                    SqlParameter p11 = new SqlParameter("@LimSup", SqlDbType.Decimal);
                    SqlParameter p12 = new SqlParameter("@LimInf", SqlDbType.Decimal);
                    SqlParameter p13 = new SqlParameter("@Unidad", SqlDbType.VarChar);
                    SqlParameter p14 = new SqlParameter("@Observacion", SqlDbType.VarChar);
                    SqlParameter p15 = new SqlParameter("@UsuarioUltAct", SqlDbType.VarChar);

                    p1.Direction = ParameterDirection.Input;
                    p2.Direction = ParameterDirection.Input;
                    p3.Direction = ParameterDirection.Input;
                    p4.Direction = ParameterDirection.Input;
                    p5.Direction = ParameterDirection.Input;
                    p6.Direction = ParameterDirection.Input;
                    p7.Direction = ParameterDirection.Input;
                    p8.Direction = ParameterDirection.Input;
                    p9.Direction = ParameterDirection.Input;
                    p10.Direction = ParameterDirection.Input;
                    p11.Direction = ParameterDirection.Input;
                    p12.Direction = ParameterDirection.Input;
                    p13.Direction = ParameterDirection.Input;
                    p14.Direction = ParameterDirection.Input;
                    p15.Direction = ParameterDirection.Input;
                  


                    p1.Value = Planta;
                    p2.Value = Area;
                    p3.Value = Proceso;
                    p4.Value = Equipo;
                    p5.Value = Variable;
                    p6.Value = Fecha;
                    p7.Value = Hora;
                    p8.Value = LoteSAP;
                    p9.Value = Material;
                    p10.Value = Valor;
                    p11.Value = LimSup;
                    p12.Value = LimInf;
                    p13.Value = Unidad;
                    p14.Value = Observacion;
                    p15.Value = UsuarioUltAct;

                    comm.Parameters.Add(p1);
                    comm.Parameters.Add(p2);
                    comm.Parameters.Add(p3);
                    comm.Parameters.Add(p4);
                    comm.Parameters.Add(p5);
                    comm.Parameters.Add(p6);
                    comm.Parameters.Add(p7);
                    comm.Parameters.Add(p8);
                    comm.Parameters.Add(p9);
                    comm.Parameters.Add(p10);
                    comm.Parameters.Add(p11);
                    comm.Parameters.Add(p12);
                    comm.Parameters.Add(p13);
                    comm.Parameters.Add(p14);
                    comm.Parameters.Add(p15);

                    conn.Open();
                    comm.ExecuteNonQuery();

                }
            }

        }


    }
}