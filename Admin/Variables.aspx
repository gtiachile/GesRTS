<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Variables.aspx.cs" Inherits="BitOp.Admin.Variables" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style35 {
            color: #000000;
        }
        .auto-style41 {
            width: 126px;
        }
        .auto-style43 {
            width: 168px;
        }
        .auto-style44 {
            width: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="auto-style35"><strong>SESIONES DE PLANIFICACION</strong></h3>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agrega Sesión de Planificación</asp:LinkButton>
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Sesion_ID" DataSourceID="GesDBSesionesTP">
                        <Columns>
                            <asp:BoundField DataField="Sesion_ID" HeaderText="Sesion_ID" ReadOnly="True" SortExpression="Sesion_ID" />
                            <asp:BoundField DataField="Region_ID" HeaderText="Region_ID" SortExpression="Region_ID" />
                            <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                            <asp:BoundField DataField="Escenario" HeaderText="Escenario" SortExpression="Escenario" />
                            <asp:BoundField DataField="Fecha_Creacion" HeaderText="Fecha_Creacion" SortExpression="Fecha_Creacion" />
                            <asp:BoundField DataField="Fecha_Vigencia" HeaderText="Fecha_Vigencia" SortExpression="Fecha_Vigencia" />
                            <asp:BoundField DataField="Fecha_Expiracion" HeaderText="Fecha_Expiracion" SortExpression="Fecha_Expiracion" />
                            <asp:BoundField DataField="Usuario_Modificacion" HeaderText="Usuario_Modificacion" SortExpression="Usuario_Modificacion" />
                            <asp:BoundField DataField="Fecha_Modificacion" HeaderText="Fecha_Modificacion" SortExpression="Fecha_Modificacion" />
                            <asp:BoundField DataField="Usuario_Catalogacion" HeaderText="Usuario_Catalogacion" SortExpression="Usuario_Catalogacion" />
                            <asp:BoundField DataField="Fecha_Catalogacion" HeaderText="Fecha_Catalogacion" SortExpression="Fecha_Catalogacion" />
                        </Columns>
                        <HeaderStyle BackColor="#003366" ForeColor="White" />
                    </asp:GridView>
                </p>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Sesion_ID" DataSourceID="GesDBSesionesTP" DefaultMode="Insert" Width="90%">
                    <EditItemTemplate>
                        Sesion_ID:
                        <asp:Label ID="Sesion_IDLabel1" runat="server" Text='<%# Eval("Sesion_ID") %>' />
                        <br />
                        Region_ID:
                        <asp:TextBox ID="Region_IDTextBox" runat="server" Text='<%# Bind("Region_ID") %>' />
                        <br />
                        Tipo:
                        <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
                        <br />
                        Descripcion:
                        <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                        <br />
                        Escenario:
                        <asp:TextBox ID="EscenarioTextBox" runat="server" Text='<%# Bind("Escenario") %>' />
                        <br />
                        Fecha_Creacion:
                        <asp:TextBox ID="Fecha_CreacionTextBox" runat="server" Text='<%# Bind("Fecha_Creacion") %>' />
                        <br />
                        Fecha_Vigencia:
                        <asp:TextBox ID="Fecha_VigenciaTextBox" runat="server" Text='<%# Bind("Fecha_Vigencia") %>' />
                        <br />
                        Fecha_Expiracion:
                        <asp:TextBox ID="Fecha_ExpiracionTextBox" runat="server" Text='<%# Bind("Fecha_Expiracion") %>' />
                        <br />
                        Usuario_Modificacion:
                        <asp:TextBox ID="Usuario_ModificacionTextBox" runat="server" Text='<%# Bind("Usuario_Modificacion") %>' />
                        <br />
                        Fecha_Modificacion:
                        <asp:TextBox ID="Fecha_ModificacionTextBox" runat="server" Text='<%# Bind("Fecha_Modificacion") %>' />
                        <br />
                        Usuario_Catalogacion:
                        <asp:TextBox ID="Usuario_CatalogacionTextBox" runat="server" Text='<%# Bind("Usuario_Catalogacion") %>' />
                        <br />
                        Fecha_Catalogacion:
                        <asp:TextBox ID="Fecha_CatalogacionTextBox" runat="server" Text='<%# Bind("Fecha_Catalogacion") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        &nbsp;&nbsp;<table style="width:100%;">
                            <tr>
                                <td class="auto-style41">Sesion_ID:</td>
                                <td class="auto-style43">
                                    <asp:TextBox ID="Sesion_IDTextBox" runat="server" Text='<%# Bind("Sesion_ID") %>' />
                                </td>
                                <td class="auto-style44">Descripcion:</td>
                                <td>
                                    <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style41">Region_ID:</td>
                                <td class="auto-style43">
                                    <asp:TextBox ID="Region_IDTextBox" runat="server" Text='<%# Bind("Region_ID") %>' />
                                </td>
                                <td class="auto-style44">Fecha_Creacion:</td>
                                <td>
                                    <asp:TextBox ID="Fecha_CreacionTextBox" runat="server" Text='<%# Bind("Fecha_Creacion") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style41">Fecha_Vigencia:</td>
                                <td class="auto-style43">
                                    <asp:TextBox ID="Fecha_VigenciaTextBox" runat="server" Text='<%# Bind("Fecha_Vigencia") %>' />
                                </td>
                                <td class="auto-style44">Fecha_Expiracion:</td>
                                <td>
                                    <asp:TextBox ID="Fecha_ExpiracionTextBox" runat="server" Text='<%# Bind("Fecha_Expiracion") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style41">Usuario_Modificacion:</td>
                                <td class="auto-style43">
                                    <asp:TextBox ID="Usuario_ModificacionTextBox" runat="server" Text='<%# Bind("Usuario_Modificacion") %>' />
                                </td>
                                <td class="auto-style44">Fecha_Modificacion:</td>
                                <td>
                                    <asp:TextBox ID="Fecha_ModificacionTextBox" runat="server" Text='<%# Bind("Fecha_Modificacion") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style41">Usuario_Catalogacion:</td>
                                <td class="auto-style43">
                                    <asp:TextBox ID="Usuario_CatalogacionTextBox" runat="server" Text='<%# Bind("Usuario_Catalogacion") %>' />
                                </td>
                                <td class="auto-style44">Fecha_Catalogacion:</td>
                                <td>
                                    <asp:TextBox ID="Fecha_CatalogacionTextBox" runat="server" Text='<%# Bind("Fecha_Catalogacion") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style41">Tipo:</td>
                                <td class="auto-style43">
                                    <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
                                </td>
                                <td class="auto-style44">Escenario: </td>
                                <td>
                                    <asp:TextBox ID="EscenarioTextBox" runat="server" Text='<%# Bind("Escenario") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Sesion_ID:
                        <asp:Label ID="Sesion_IDLabel" runat="server" Text='<%# Eval("Sesion_ID") %>' />
                        <br />
                        Region_ID:
                        <asp:Label ID="Region_IDLabel" runat="server" Text='<%# Bind("Region_ID") %>' />
                        <br />
                        Tipo:
                        <asp:Label ID="TipoLabel" runat="server" Text='<%# Bind("Tipo") %>' />
                        <br />
                        Descripcion:
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Bind("Descripcion") %>' />
                        <br />
                        Escenario:
                        <asp:Label ID="EscenarioLabel" runat="server" Text='<%# Bind("Escenario") %>' />
                        <br />
                        Fecha_Creacion:
                        <asp:Label ID="Fecha_CreacionLabel" runat="server" Text='<%# Bind("Fecha_Creacion") %>' />
                        <br />
                        Fecha_Vigencia:
                        <asp:Label ID="Fecha_VigenciaLabel" runat="server" Text='<%# Bind("Fecha_Vigencia") %>' />
                        <br />
                        Fecha_Expiracion:&nbsp;<asp:Label ID="Fecha_ExpiracionLabel" runat="server" Text='<%# Bind("Fecha_Expiracion") %>' />
                        <br />
                        Usuario_Modificacion:&nbsp;<asp:Label ID="Usuario_ModificacionLabel" runat="server" Text='<%# Bind("Usuario_Modificacion") %>' />
                        <br />
                        Fecha_Modificacion:&nbsp;<asp:Label ID="Fecha_ModificacionLabel" runat="server" Text='<%# Bind("Fecha_Modificacion") %>' />
                        <br />
                        Usuario_Catalogacion:
                        <asp:Label ID="Usuario_CatalogacionLabel" runat="server" Text='<%# Bind("Usuario_Catalogacion") %>' />
                        <br />
                        Fecha_Catalogacion:
                        <asp:Label ID="Fecha_CatalogacionLabel" runat="server" Text='<%# Bind("Fecha_Catalogacion") %>' />
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="GesDBSesionesTP" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT * FROM [SesionesTP]">
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
