<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Formatos.aspx.cs" Inherits="BitOp.Admin.Formatos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <span class="auto-style10"><strong>FORMATOS DE PRODUCTO</strong></span><br />
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agregar Formato de Producto</asp:LinkButton>
            <br />
            <br />
            Seleccione Familia:&nbsp;
            <asp:DropDownList ID="DropDownListFamiliaFil" runat="server" AutoPostBack="True" DataSourceID="BopDBFamiliasFiltro" DataTextField="FamiliaProducto" DataValueField="Codigo">
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="BopDBFamiliasFiltro" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Codigo], [FamiliaProducto] FROM [FamiliaProductos]"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Formato,CodigoFamilia" DataSourceID="BopDBFormatosGV" Width="60%" ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Actualizar" />
                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/StopHS.png" Text="Cancelar" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Editar" />
                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); " Text="Eliminar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Formato" HeaderText="Formato" ReadOnly="True" SortExpression="Formato" />
                    <asp:TemplateField HeaderText="Familia" SortExpression="CodigoFamilia">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="BopDBFamiliasGVI" DataTextField="FamiliaProducto" DataValueField="Codigo" Enabled="False" SelectedValue='<%# Bind("CodigoFamilia") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="BopDBFamiliasGVI" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Codigo], [FamiliaProducto] FROM [FamiliaProductos]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="BopDBFamiliasGVI0" DataTextField="FamiliaProducto" DataValueField="Codigo" Enabled="False" SelectedValue='<%# Bind("CodigoFamilia") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="BopDBFamiliasGVI0" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Codigo], [FamiliaProducto] FROM [FamiliaProductos]"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rendimiento" SortExpression="Rendimiento">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Rendimiento") %>' TextMode="Number"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Rendimiento") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                <asp:ListItem>Activo</asp:ListItem>
                                <asp:ListItem>Inactivo</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#003366" ForeColor="White" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="BopDBFormatosGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Formatos] WHERE [Formato] = @Formato AND [CodigoFamilia] = @CodigoFamilia" InsertCommand="INSERT INTO [Formatos] ([Formato], [CodigoFamilia], [Rendimiento], [Estado]) VALUES (@Formato, @CodigoFamilia, @Rendimiento, @Estado)" SelectCommand="SELECT [Formato], [CodigoFamilia], [Rendimiento], [Estado] FROM [Formatos] WHERE ([CodigoFamilia] = @CodigoFamilia)" UpdateCommand="UPDATE [Formatos] SET [Rendimiento] = @Rendimiento, [Estado] = @Estado WHERE [Formato] = @Formato AND [CodigoFamilia] = @CodigoFamilia">
                <DeleteParameters>
                    <asp:Parameter Name="Formato" Type="String" />
                    <asp:Parameter Name="CodigoFamilia" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Formato" Type="String" />
                    <asp:Parameter Name="CodigoFamilia" Type="String" />
                    <asp:Parameter Name="Rendimiento" Type="Decimal" />
                    <asp:Parameter Name="Estado" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListFamiliaFil" Name="CodigoFamilia" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Rendimiento" Type="Decimal" />
                    <asp:Parameter Name="Estado" Type="String" />
                    <asp:Parameter Name="Formato" Type="String" />
                    <asp:Parameter Name="CodigoFamilia" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Formato,CodigoFamilia" DataSourceID="BopDBFormatos" DefaultMode="Insert">
                <EditItemTemplate>
                    Formato:
                    <asp:Label ID="FormatoLabel1" runat="server" Text='<%# Eval("Formato") %>' />
                    <br />
                    CodigoFamilia:
                    <asp:Label ID="CodigoFamiliaLabel1" runat="server" Text='<%# Eval("CodigoFamilia") %>' />
                    <br />
                    Rendimiento:
                    <asp:TextBox ID="RendimientoTextBox" runat="server" Text='<%# Bind("Rendimiento") %>' />
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
                            <td class="auto-style10">Formato:</td>
                            <td>
                                <asp:TextBox ID="FormatoTextBox" runat="server" MaxLength="10" Text='<%# Bind("Formato") %>' />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FormatoTextBox" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Familia:</td>
                            <td>
                                <asp:DropDownList ID="DropDownListFamiliaFV" runat="server" DataSourceID="BopDBFamiliasFV" DataTextField="FamiliaProducto" DataValueField="Codigo" SelectedValue='<%# Bind("CodigoFamilia") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="BopDBFamiliasFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Codigo], [FamiliaProducto] FROM [FamiliaProductos]"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Rendimiento:</td>
                            <td>
                                <asp:TextBox ID="RendimientoTextBox0" runat="server" Text='<%# Bind("Rendimiento") %>' TextMode="Number" MaxLength="10" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RendimientoTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Estado:</td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                    <asp:ListItem>Activo</asp:ListItem>
                                    <asp:ListItem>Inactivo</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" OnClick="InsertCancelButton_Click" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Formato:
                    <asp:Label ID="FormatoLabel" runat="server" Text='<%# Eval("Formato") %>' />
                    <br />
                    CodigoFamilia:
                    <asp:Label ID="CodigoFamiliaLabel" runat="server" Text='<%# Eval("CodigoFamilia") %>' />
                    <br />
                    Rendimiento:
                    <asp:Label ID="RendimientoLabel" runat="server" Text='<%# Bind("Rendimiento") %>' />
                    <br />
                    Estado:
                    <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); " Text="Delete" />
                    </asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="BopDBFormatos" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Formatos] WHERE [Formato] = @Formato AND [CodigoFamilia] = @CodigoFamilia" InsertCommand="p_ValidaInsertaFORMATOS" InsertCommandType="StoredProcedure" OnInserted="On_Inserted" SelectCommand="SELECT [Formato], [CodigoFamilia], [Rendimiento], [Estado] FROM [Formatos]" UpdateCommand="UPDATE [Formatos] SET [Rendimiento] = @Rendimiento, [Estado] = @Estado WHERE [Formato] = @Formato AND [CodigoFamilia] = @CodigoFamilia">
                <DeleteParameters>
                    <asp:Parameter Name="Formato" Type="String" />
                    <asp:Parameter Name="CodigoFamilia" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Formato" Type="String" />
                    <asp:Parameter Name="CodigoFamilia" Type="String" />
                    <asp:Parameter Name="Rendimiento" Type="Decimal" />
                    <asp:Parameter Name="Estado" Type="String" />
                    <asp:Parameter Name="Done" Type="Boolean" />
                    <asp:Parameter Name="Msg" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Rendimiento" Type="Decimal" />
                    <asp:Parameter Name="Estado" Type="String" />
                    <asp:Parameter Name="Formato" Type="String" />
                    <asp:Parameter Name="CodigoFamilia" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
    <br />
</asp:Content>
