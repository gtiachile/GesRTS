<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Causas_Detencion.aspx.cs" Inherits="BitOp.Admin.Causas_Detencion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>CAUSAS DE DETENCION</h3>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton3_Click" />
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton3_Click">Agregar Causa de Detención</asp:LinkButton>
                </p>
                <p>
                    <table style="width:100%;">
                        <tr>
                            <td style="border-style: solid; border-width: 1px; padding: 1px 4px" valign="top">
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Causa" DataSourceID="BopDBCausasDetencion" Width="90%">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Update" />
                                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/StopHS.png" Text="Cancel" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Edit" />
                                                &nbsp;<asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); " Text="Delete" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Causa" HeaderText="Causa" ReadOnly="True" SortExpression="Causa" />
                                        <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
                                        <asp:TemplateField HeaderText="Tipo" SortExpression="Tipo">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="BopDBTipoDetencionGV" DataTextField="Descripción" DataValueField="Tipo" SelectedValue='<%# Bind("Tipo") %>'>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="BopDBTipoDetencionGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Tipo], [Descripción] FROM [TipoDetencion]"></asp:SqlDataSource>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="BopDBTipoDetencionGV0" DataTextField="Descripción" DataValueField="Tipo" Enabled="False" SelectedValue='<%# Bind("Tipo") %>'>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="BopDBTipoDetencionGV0" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Tipo], [Descripción] FROM [TipoDetencion]"></asp:SqlDataSource>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Planif." SortExpression="Planificada">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList7" runat="server" SelectedValue='<%# Bind("Planificada") %>'>
                                                    <asp:ListItem>Si</asp:ListItem>
                                                    <asp:ListItem>No</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Planificada") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Estándar" SortExpression="Estandar">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList8" runat="server" SelectedValue='<%# Bind("Estandar") %>'>
                                                    <asp:ListItem>Si</asp:ListItem>
                                                    <asp:ListItem>No</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Estandar") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mant." SortExpression="Mantencion">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList9" runat="server" SelectedValue='<%# Bind("Mantencion") %>'>
                                                    <asp:ListItem>Si</asp:ListItem>
                                                    <asp:ListItem>No</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Mantencion") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList10" runat="server" DataSourceID="BopDBEstado" DataTextField="Estado" DataValueField="Estado" SelectedValue='<%# Bind("Estado") %>'>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="BopDBEstado" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Estado] FROM [Estados]"></asp:SqlDataSource>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </p>
                <p>
                    <asp:SqlDataSource ID="BopDBCausasDetencion" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [CausasDetencion] WHERE [Causa] = @Causa" InsertCommand="p_ValidaInsertaCAUSASDETENCION" InsertCommandType="StoredProcedure" SelectCommand="SELECT [Causa], [Descripción], [Tipo], [Planificada], [Estandar], [Mantencion], [Estado] FROM [CausasDetencion]" UpdateCommand="UPDATE [CausasDetencion] SET [Descripción] = @Descripción, [Tipo] = @Tipo, [Planificada] = @Planificada, [Estandar] = @Estandar, [Mantencion] = @Mantencion, [Estado] = @Estado WHERE [Causa] = @Causa">
                        <DeleteParameters>
                            <asp:Parameter Name="Causa" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Causa" Type="String" />
                            <asp:Parameter Name="Descripción" Type="String" />
                            <asp:Parameter Name="Tipo" Type="String" />
                            <asp:Parameter Name="Planificada" Type="String" />
                            <asp:Parameter Name="Estandar" Type="String" />
                            <asp:Parameter Name="Mantencion" Type="String" />
                            <asp:Parameter Name="Estado" Type="String" />
                            <asp:Parameter Name="Done" Type="Boolean" />
                            <asp:Parameter Name="Msg" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Descripción" Type="String" />
                            <asp:Parameter Name="Tipo" Type="String" />
                            <asp:Parameter Name="Planificada" Type="String" />
                            <asp:Parameter Name="Estandar" Type="String" />
                            <asp:Parameter Name="Mantencion" Type="String" />
                            <asp:Parameter Name="Estado" Type="String" />
                            <asp:Parameter Name="Causa" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Causa" DataSourceID="BopDBCausasDetencion" DefaultMode="Insert" Width="410px">
                    <EditItemTemplate>
                        Causa:
                        <asp:Label ID="CausaLabel1" runat="server" Text='<%# Eval("Causa") %>' />
                        <br />
                        Descripción:
                        <asp:TextBox ID="DescripciónTextBox" runat="server" Text='<%# Bind("Descripción") %>' />
                        <br />
                        Tipo:
                        <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
                        <br />
                        Planificada:
                        <asp:TextBox ID="PlanificadaTextBox" runat="server" Text='<%# Bind("Planificada") %>' />
                        <br />
                        Estandar:
                        <asp:TextBox ID="EstandarTextBox" runat="server" Text='<%# Bind("Estandar") %>' />
                        <br />
                        Mantencion:
                        <asp:TextBox ID="MantencionTextBox" runat="server" Text='<%# Bind("Mantencion") %>' />
                        <br />
                        Estado:
                        <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style10">Causa:</td>
                                <td>
                                    <asp:TextBox ID="CausaTextBox" runat="server" MaxLength="4" Text='<%# Bind("Causa") %>' TextMode="Number" Width="45px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CausaTextBox" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Descripción:</td>
                                <td>
                                    <asp:TextBox ID="DescripciónTextBox0" runat="server" MaxLength="50" Text='<%# Bind("Descripción") %>' Width="161px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DescripciónTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Tipo:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="BopDBTipoDetencionFV" DataTextField="Descripción" DataValueField="Tipo" SelectedValue='<%# Bind("Tipo") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BopDBTipoDetencionFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Tipo], [Descripción] FROM [TipoDetencion]"></asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Planificada:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("Planificada") %>'>
                                        <asp:ListItem>Si</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Estándar:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("Estandar") %>'>
                                        <asp:ListItem Selected="True">Si</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Mantención:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" runat="server" SelectedValue='<%# Bind("Mantencion") %>'>
                                        <asp:ListItem Selected="True">Si</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Estado:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList5" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                        <asp:ListItem Selected="True">Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertCancelButton_Click" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Causa:
                        <asp:Label ID="CausaLabel" runat="server" Text='<%# Eval("Causa") %>' />
                        <br />
                        Descripción:
                        <asp:Label ID="DescripciónLabel" runat="server" Text='<%# Bind("Descripción") %>' />
                        <br />
                        Tipo:
                        <asp:Label ID="TipoLabel" runat="server" Text='<%# Bind("Tipo") %>' />
                        <br />
                        Planificada:
                        <asp:Label ID="PlanificadaLabel" runat="server" Text='<%# Bind("Planificada") %>' />
                        <br />
                        Estandar:
                        <asp:Label ID="EstandarLabel" runat="server" Text='<%# Bind("Estandar") %>' />
                        <br />
                        Mantencion:
                        <asp:Label ID="MantencionLabel" runat="server" Text='<%# Bind("Mantencion") %>' />
                        <br />
                        Estado:
                        <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </asp:View>
        </asp:MultiView>
</p>
</asp:Content>
