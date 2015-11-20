<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vendedores.aspx.cs" Inherits="BitOp.Admin.Vendedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style16 {
            width: 318px;
        }
        .auto-style17 {
            font-size: medium;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style17">
        <strong>VENDEDORES</strong></p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
                &nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agregar Vendedor</asp:LinkButton>
                <br />
                <br />
                Seleccione Región:&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], ([Region_Chile] + ' - ' + [Descripción]) as Region_Txt, [Region_RTS] 
 FROM [Regiones]
ORDER BY [Region_Txt]"></asp:SqlDataSource>
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Vendedor_ID" DataSourceID="GesDBVendedoresGV" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="80%">
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
                        <asp:BoundField DataField="Vendedor_ID" HeaderText="ID Vendedor" ReadOnly="True" SortExpression="Vendedor_ID" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Tipo" SortExpression="Vendedor_Tipo">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList10" runat="server" SelectedValue='<%# Bind("Vendedor_Tipo") %>'>
                                    <asp:ListItem>Vendedor</asp:ListItem>
                                    <asp:ListItem>Supervisor</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Vendedor_Tipo") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Vendedor_Nombre" HeaderText="Nombre" SortExpression="Vendedor_Nombre" />
                        <asp:TemplateField HeaderText="Región" SortExpression="Region">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" SelectedValue='<%# Bind("Region") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Region") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Supervisor" SortExpression="Supervisor">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="GesDBSupervisores" DataTextField="Vendedor_Nombre" DataValueField="Vendedor_ID" SelectedValue='<%# Bind("Supervisor") %>' AutoPostBack="True">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Lbl_Supervisor" runat="server" Text='<%# Bind("Supervisor") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList12" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                    <asp:ListItem>Activo</asp:ListItem>
                                    <asp:ListItem>Inactivo</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
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
                <asp:SqlDataSource ID="GesDBVendedoresGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Vendedores] WHERE [Vendedor_ID] = @Vendedor_ID" InsertCommand="INSERT INTO [Vendedores] ([Vendedor_ID], [Vendedor_Tipo], [Vendedor_Nombre], [Region], [Supervisor], [Estado]) VALUES (@Vendedor_ID, @Vendedor_Tipo, @Vendedor_Nombre, @Region, @Supervisor, @Estado)" SelectCommand="SELECT * FROM [Vendedores]
WHERE [Region] = @Region_ID" UpdateCommand="UPDATE [Vendedores] SET [Vendedor_Tipo] = @Vendedor_Tipo, [Vendedor_Nombre] = @Vendedor_Nombre, [Region] = @Region, [Supervisor] = @Supervisor, [Estado] = @Estado WHERE [Vendedor_ID] = @Vendedor_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="Vendedor_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Vendedor_ID" Type="String" />
                        <asp:Parameter Name="Vendedor_Tipo" Type="String" />
                        <asp:Parameter Name="Vendedor_Nombre" Type="String" />
                        <asp:Parameter Name="Region" Type="String" />
                        <asp:Parameter Name="Supervisor" Type="String" />
                        <asp:Parameter Name="Estado" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="Region_ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Vendedor_Tipo" Type="String" />
                        <asp:Parameter Name="Vendedor_Nombre" Type="String" />
                        <asp:Parameter Name="Region" Type="String" />
                        <asp:Parameter Name="Supervisor" Type="String" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="Vendedor_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Vendedor_ID" DataSourceID="GesDBVendedoresGV" DefaultMode="Insert" Width="472px" OnItemInserting="FormView1_ItemInserting">
                    <EditItemTemplate>
                        Vendedor_ID:
                        <asp:Label ID="Vendedor_IDLabel1" runat="server" Text='<%# Eval("Vendedor_ID") %>' />
                        <br />
                        Vendedor_Tipo:
                        <asp:TextBox ID="Vendedor_TipoTextBox" runat="server" Text='<%# Bind("Vendedor_Tipo") %>' />
                        <br />
                        Vendedor_Nombre:
                        <asp:TextBox ID="Vendedor_NombreTextBox" runat="server" Text='<%# Bind("Vendedor_Nombre") %>' />
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
                                <td class="auto-style16">ID Vendedor: </td>
                                <td>
                                    <asp:TextBox ID="Vendedor_IDTextBox" runat="server" Text='<%# Bind("Vendedor_ID") %>' MaxLength="5" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16">Tipo:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("Vendedor_Tipo") %>'>
                                        <asp:ListItem>Vendedor</asp:ListItem>
                                        <asp:ListItem>Supervisor</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16">Nombre:</td>
                                <td>
                                    <asp:TextBox ID="Vendedor_NombreTextBox" runat="server" Height="22px" Text='<%# Bind("Vendedor_Nombre") %>' Width="341px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16">Región:</td>
                                <td>
                                    <asp:TextBox ID="TextBoxRegion" runat="server">RM</asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16">Supervisor:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="GesDBSupervisores" DataTextField="Vendedor_Nombre" DataValueField="Vendedor_ID" SelectedValue='<%# Bind("Supervisor") %>'>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16">Estado:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList5" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click" Text="Insertar" />
                        &nbsp;&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertCancelButton_Click" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Vendedor_ID:
                        <asp:Label ID="Vendedor_IDLabel" runat="server" Text='<%# Eval("Vendedor_ID") %>' />
                        <br />
                        Vendedor_Tipo:
                        <asp:Label ID="Vendedor_TipoLabel" runat="server" Text='<%# Bind("Vendedor_Tipo") %>' />
                        <br />
                        Vendedor_Nombre:
                        <asp:Label ID="Vendedor_NombreLabel" runat="server" Text='<%# Bind("Vendedor_Nombre") %>' />
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
                <asp:SqlDataSource ID="GesDBSupervisores" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Vendedor_ID], [Vendedor_Nombre], [Vendedor_Tipo], [Region], [Supervisor], [Estado] 
  FROM [Vendedores]
WHERE [Vendedor_Tipo] = 'Supervisor'
    AND [Region]                = @Region_ID
    AND [Estado]                 = 'Activo'">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Region_ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
