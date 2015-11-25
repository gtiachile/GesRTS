<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Criterios.aspx.cs" Inherits="BitOp.Admin.Criterios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            font-size: medium;
            color: #000000;
        }
        .auto-style15 {
            width: 99px;
        }
        .auto-style25 {
            width: 22px;
            height: 40px;
        }
        .auto-style31 {
            width: 22px;
            height: 38px;
        }
        .auto-style32 {
            width: 96px;
            height: 38px;
        }
        .auto-style37 {
            width: 22px;
            height: 39px;
        }
        .auto-style38 {
            width: 96px;
            height: 39px;
        }
        .auto-style40 {
            height: 38px;
            color: red;
            width: 138px;
        }
        .auto-style42 {
            height: 39px;
            width: 138px;
        }
        .auto-style47 {
            width: 200px;
            height: 38px;
        }
        .auto-style48 {
            width: 200px;
            height: 39px;
        }
        .auto-style54 {
            width: 596px;
        }
        .auto-style55 {
            height: 40px;
            width: 138px;
        }
        .auto-style59 {
            width: 200px;
            height: 40px;
        }
        .auto-style60 {
            width: 96px;
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style10">
        <strong>CRITERIOS DE BUSQUEDA</strong></p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton3_Click" />
                &nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton3_Click">Agregar Criterio</asp:LinkButton>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Criterio_ID" DataSourceID="GesDBCriteriosGV" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="80%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Actualizar" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/Cancel(build)_194_32.bmp" Text="Cancelar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Editar" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); " Text="Eliminar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Criterio_ID" HeaderText="ID Criterio" ReadOnly="True" SortExpression="Criterio_ID" />
                        <asp:TemplateField HeaderText="Fecha Desde" SortExpression="Fecha_Desde">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Fecha_Desde") %>' MaxLength="10" TextMode="Date"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Fecha_Desde", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Inicio_Nombre" HeaderText="Inicio Descripción" SortExpression="Inicio_Nombre" />
                        <asp:TemplateField HeaderText="Región" SortExpression="Region">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" SelectedValue='<%# Bind("Region") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Region") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Supervisor" SortExpression="Supervisor">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="GesDBSupervisores" DataTextField="Vendedor_Nombre" DataValueField="Vendedor_ID" SelectedValue='<%# Bind("Supervisor") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Supervisor") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Estado") %>'>
                                    <asp:ListItem>Activo</asp:ListItem>
                                    <asp:ListItem>Inactivo</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="GesDBCriteriosGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Criterios] WHERE [Criterio_ID] = @Criterio_ID" InsertCommand="p_ValidaInsertaCriterio" SelectCommand="SELECT * FROM [Criterios]" UpdateCommand="UPDATE [Criterios] SET [Fecha_Desde] = @Fecha_Desde, [Inicio_Nombre] = @Inicio_Nombre, [Region] = @Region, [Supervisor] = @Supervisor, [Estado] = @Estado WHERE [Criterio_ID] = @Criterio_ID" InsertCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="Criterio_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Criterio_ID" Type="String" />
                        <asp:Parameter Name="Fecha_Desde" Type="DateTime" />
                        <asp:Parameter Name="Inicio_Nombre" Type="String" />
                        <asp:Parameter Name="Region" Type="String" />
                        <asp:Parameter Name="Supervisor" Type="String" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="Done" Type="Boolean" />
                        <asp:Parameter Name="Msg" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Fecha_Desde" Type="DateTime" />
                        <asp:Parameter Name="Inicio_Nombre" Type="String" />
                        <asp:Parameter Name="Region" Type="String" />
                        <asp:Parameter Name="Supervisor" Type="String" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="Criterio_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Criterio_ID" DataSourceID="GesDBCriteriosFV" DefaultMode="Insert" Width="525px" Height="319px">
                    <EditItemTemplate>
                        Criterio_ID:
                        <asp:Label ID="Criterio_IDLabel1" runat="server" Text='<%# Eval("Criterio_ID") %>' />
                        <br />
                        Fecha_Desde:
                        <asp:TextBox ID="Fecha_DesdeTextBox" runat="server" Text='<%# Bind("Fecha_Desde") %>' />
                        <br />
                        Inicio_Nombre:
                        <asp:TextBox ID="Inicio_NombreTextBox" runat="server" Text='<%# Bind("Inicio_Nombre") %>' />
                        <br />
                        Region:
                        <asp:TextBox ID="RegionTextBox" runat="server" Text='<%# Bind("Region") %>' />
                        <br />
                        Supervisor:
                        <asp:TextBox ID="SupervisorTextBox" runat="server" Text='<%# Bind("Supervisor") %>' />
                        <br />
                        Estado:
                        <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        &nbsp;&nbsp;<table class="auto-style54">
                            <tr>
                                <td class="auto-style15" rowspan="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                    <asp:Image ID="Image1" runat="server" Height="150px" ImageAlign="Middle" ImageUrl="~/Images/Criterios.png" Width="100px" />
                                    &nbsp; &nbsp;</td>
                                <td class="auto-style25"></td>
                                <td class="auto-style60">ID Criterio:</td>
                                <td class="auto-style59">
                                    <asp:TextBox ID="Criterio_IDTextBox" runat="server" Height="22px" MaxLength="20" Text='<%# Bind("Criterio_ID") %>' Width="180px" />
                                </td>
                                <td class="auto-style55"></td>
                            </tr>
                            <tr>
                                <td class="auto-style31">&nbsp;&nbsp;&nbsp;</td>
                                <td class="auto-style32">Fecha Desde:</td>
                                <td class="auto-style47">
                                    <asp:TextBox ID="Fecha_DesdeTextBox" runat="server" Height="22px" Text='<%# Bind("Fecha_Desde", "{0:d}") %>' TextMode="Date" Width="100px" MaxLength="10" />
                                </td>
                                <td class="auto-style40">* Formato dd-mm-aaaa</td>
                            </tr>
                            <tr>
                                <td class="auto-style25"></td>
                                <td class="auto-style60">Inicio Nombre:&nbsp;&nbsp;&nbsp; </td>
                                <td class="auto-style59">
                                    <asp:TextBox ID="Inicio_NombreTextBox" runat="server" Height="22px" MaxLength="20" Text='<%# Bind("Inicio_Nombre") %>' Width="180px" />
                                </td>
                                <td class="auto-style55"></td>
                            </tr>
                            <tr>
                                <td class="auto-style25"></td>
                                <td class="auto-style60">Región:</td>
                                <td class="auto-style59">
                                    <asp:DropDownList ID="DropDownRegionFV" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" Height="22px" SelectedValue='<%# Bind("Region") %>' Width="200px">
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style55"></td>
                            </tr>
                            <tr>
                                <td class="auto-style25"></td>
                                <td class="auto-style60">Supervisor:</td>
                                <td class="auto-style59">
                                    <asp:DropDownList ID="DropDownSupervisorFV" runat="server" DataSourceID="GesDBSupervisores" DataTextField="Vendedor_Nombre" DataValueField="Vendedor_ID" Height="22px" SelectedValue='<%# Bind("Supervisor") %>' Width="200px" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style55"></td>
                            </tr>
                            <tr>
                                <td class="auto-style37"></td>
                                <td class="auto-style38">Estado:</td>
                                <td class="auto-style48">
                                    <asp:DropDownList ID="DropDownList3" runat="server" Height="22px" SelectedValue='<%# Bind("Estado") %>' Width="90px">
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style42"></td>
                            </tr>
                        </table>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" OnClick="InsertButton_Click" />
                        &nbsp; &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertCancelButton_Click" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Criterio_ID:
                        <asp:Label ID="Criterio_IDLabel" runat="server" Text='<%# Eval("Criterio_ID") %>' />
                        <br />
                        Fecha_Desde:
                        <asp:Label ID="Fecha_DesdeLabel" runat="server" Text='<%# Bind("Fecha_Desde") %>' />
                        <br />
                        Inicio_Nombre:
                        <asp:Label ID="Inicio_NombreLabel" runat="server" Text='<%# Bind("Inicio_Nombre") %>' />
                        <br />
                        Region:
                        <asp:Label ID="RegionLabel" runat="server" Text='<%# Bind("Region") %>' />
                        <br />
                        Supervisor:
                        <asp:Label ID="SupervisorLabel" runat="server" Text='<%# Bind("Supervisor") %>' />
                        <br />
                        Estado:
                        <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <asp:SqlDataSource ID="GesDBCriteriosFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Criterios] WHERE [Criterio_ID] = @Criterio_ID" InsertCommand="p_ValidaInsertaCriterio" SelectCommand="SELECT * FROM [Criterios]" UpdateCommand="UPDATE [Criterios] SET [Fecha_Desde] = @Fecha_Desde, [Inicio_Nombre] = @Inicio_Nombre, [Region] = @Region, [Supervisor] = @Supervisor, [Estado] = @Estado WHERE [Criterio_ID] = @Criterio_ID" InsertCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="Criterio_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Criterio_ID" Type="String" />
                        <asp:Parameter Name="Fecha_Desde" Type="DateTime" />
                        <asp:Parameter Name="Inicio_Nombre" Type="String" />
                        <asp:Parameter Name="Region" Type="String" />
                        <asp:Parameter Name="Supervisor" Type="String" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="Done" Type="Boolean" />
                        <asp:Parameter Name="Msg" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Fecha_Desde" Type="DateTime" />
                        <asp:Parameter Name="Inicio_Nombre" Type="String" />
                        <asp:Parameter Name="Region" Type="String" />
                        <asp:Parameter Name="Supervisor" Type="String" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="Criterio_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT ' ' AS Region_ID, '- Seleccione Región' as Region_Txt, ' ' AS Region_RTS 
  FROM Regiones
UNION
SELECT Region_ID, (Region_Chile + ' - ' + Descripción) as Region_Txt, Region_RTS
  FROM Regiones
ORDER BY Region_Txt"></asp:SqlDataSource>
                <asp:SqlDataSource ID="GesDBSupervisores" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT ' ' AS Vendedor_ID, '- Seleccione Supervisor' AS Vendedor_Nombre
 FROM Vendedores
UNION
SELECT Vendedor_ID, Vendedor_Nombre
 FROM Vendedores
 WHERE Vendedor_Tipo = 'Supervisor'
     AND Region                = @Region_ID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" DefaultValue="RM" Name="Region_ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
