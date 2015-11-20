<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Criterios.aspx.cs" Inherits="BitOp.Admin.Criterios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            font-size: medium;
            color: #000000;
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
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Criterio_ID" DataSourceID="GesDBCriteriosGV" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="80%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
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
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Fecha_Desde") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Fecha_Desde" runat="server" Text='<%# Bind("Fecha_Desde", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Inicio_Nombre" HeaderText="Inicio Nombre" SortExpression="Inicio_Nombre" />
                        <asp:TemplateField HeaderText="Región" SortExpression="Region">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Descripción" DataValueField="Region_ID" SelectedValue='<%# Bind("Region") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Region") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Supervisor" SortExpression="Supervisor">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True" DataSourceID="GesDBSupervisores" DataTextField="Vendedor_Nombre" DataValueField="Vendedor_ID" SelectedValue='<%# Bind("Supervisor") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Supervisor") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Estado") %>'>
                                    <asp:ListItem>Activo</asp:ListItem>
                                    <asp:ListItem Value="Inactivo"></asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
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
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Criterio_ID" DataSourceID="GesDBCriteriosFV" DefaultMode="Insert" Width="314px">
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
                        &nbsp;<br />&nbsp;<table style="width:100%;">
                            <tr>
                                <td>ID Criterio:</td>
                                <td>
                                    <asp:TextBox ID="Criterio_IDTextBox" runat="server" Text='<%# Bind("Criterio_ID") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Fecha Desde:</td>
                                <td>
                                    <asp:TextBox ID="Fecha_DesdeTextBox" runat="server" Text='<%# Bind("Fecha_Desde") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Inicio Nombre:</td>
                                <td>
                                    <asp:TextBox ID="Inicio_NombreTextBox" runat="server" Height="22px" Text='<%# Bind("Inicio_Nombre") %>' Width="171px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Región:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Descripción" DataValueField="Region_ID" SelectedValue='<%# Bind("Region") %>'>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Supervisor:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="GesDBSupervisores" DataTextField="Vendedor_Nombre" DataValueField="Vendedor_ID" SelectedValue='<%# Bind("Supervisor") %>'>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Estado:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" OnClick="InsertButton_Click" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" OnClick="InsertCancelButton_Click" />
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
                <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], [Descripción], [Region_Chile] FROM [Regiones]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="GesDBSupervisores" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Vendedor_ID], [Vendedor_Nombre], [Vendedor_Tipo] FROM [Vendedores]
 WHERE [Vendedor_Tipo] = 'Supervisor'"></asp:SqlDataSource>
                <br />
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
