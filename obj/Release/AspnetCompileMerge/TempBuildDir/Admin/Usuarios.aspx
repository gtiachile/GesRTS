<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="BitOp.Admin.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 48px;
        }
        .auto-style4 {
            width: 130px;
        }
        .auto-style5 {
            width: 121px;
        }
        .auto-style10 {
            color: #000000;
        }
        .auto-style11 {
            width: 121px;
            height: 23px;
            color: #000000;
        }
        .auto-style12 {
            width: 48px;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        <strong>Usuarios</strong><br />
</h3>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Agregar Usuario</asp:LinkButton>
                </p>
                <p>
                    <table style="width:100%;">
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Usuario" DataSourceID="BopDBUsuariosGV" Width="90%">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Update" />
                                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/StopHS.png" Text="Cancel" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" OnClick="ImageButton1_Click1" Text="Edit" />
                                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" OnClick="ImageButton2_Click" Text="Delete" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Usuario" HeaderText="Usuario" ReadOnly="True" SortExpression="Usuario" />
                                        <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Nombre") %>' Width="80px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="eMail" SortExpression="eMail">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("eMail") %>' TextMode="Email" Width="100px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("eMail") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Password" SortExpression="Pass">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Pass") %>' TextMode="Password" Width="80px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Pass") %>' Visible="False"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Usuario AD" SortExpression="UsuarioAD">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" MaxLength="50" Text='<%# Bind("UsuarioAD") %>' Width="80px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("UsuarioAD") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Dominio AD" SortExpression="DominioAD">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" MaxLength="20" Text='<%# Bind("DominioAD") %>' Width="80px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("DominioAD") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Perfil" SortExpression="Perfil">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="BopDBPerfilesGV" DataTextField="Descripción" DataValueField="Perfil" SelectedValue='<%# Bind("Perfil") %>'>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="BopDBPerfilesGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Perfil], [Descripción] FROM [Perfiles] where [Estado]='Activo'"></asp:SqlDataSource>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Perfil") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Expiración" SortExpression="Expiracion">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Expiracion") %>' TextMode="Date"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Expiracion") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Estado" DataValueField="Estado" SelectedValue='<%# Bind("Estado") %>'>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT * FROM [Estados]"></asp:SqlDataSource>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="BopDBUsuariosGV" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [Usuario] = @original_Usuario AND [Nombre] = @original_Nombre AND [eMail] = @original_eMail AND [Pass] = @original_Pass AND (([Fecha Creación] = @original_Fecha_Creación) OR ([Fecha Creación] IS NULL AND @original_Fecha_Creación IS NULL)) AND [Estado] = @original_Estado" InsertCommand="INSERT INTO [Usuarios] ([Usuario], [Nombre], [eMail], [Pass], [Fecha Creación], [Estado]) VALUES (@Usuario, @Nombre, @eMail, @Pass, @Fecha_Creación, @Estado)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Usuarios]" UpdateCommand="UPDATE [Usuarios] SET [Nombre] = @Nombre, [eMail] = @eMail, [Pass] = @Pass, [Fecha Creación] = @Fecha_Creación, [Estado] = @Estado WHERE [Usuario] = @original_Usuario AND [Nombre] = @original_Nombre AND [eMail] = @original_eMail AND [Pass] = @original_Pass AND (([Fecha Creación] = @original_Fecha_Creación) OR ([Fecha Creación] IS NULL AND @original_Fecha_Creación IS NULL)) AND [Estado] = @original_Estado">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_Usuario" Type="String" />
                                        <asp:Parameter Name="original_Nombre" Type="String" />
                                        <asp:Parameter Name="original_eMail" Type="String" />
                                        <asp:Parameter Name="original_Pass" Type="String" />
                                        <asp:Parameter Name="original_Fecha_Creación" Type="String" />
                                        <asp:Parameter Name="original_Estado" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Usuario" Type="String" />
                                        <asp:Parameter Name="Nombre" Type="String" />
                                        <asp:Parameter Name="eMail" Type="String" />
                                        <asp:Parameter Name="Pass" Type="String" />
                                        <asp:Parameter Name="Fecha_Creación" Type="String" />
                                        <asp:Parameter Name="Estado" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Nombre" Type="String" />
                                        <asp:Parameter Name="eMail" Type="String" />
                                        <asp:Parameter Name="Pass" Type="String" />
                                        <asp:Parameter Name="Fecha_Creación" Type="String" />
                                        <asp:Parameter Name="Estado" Type="String" />
                                        <asp:Parameter Name="original_Usuario" Type="String" />
                                        <asp:Parameter Name="original_Nombre" Type="String" />
                                        <asp:Parameter Name="original_eMail" Type="String" />
                                        <asp:Parameter Name="original_Pass" Type="String" />
                                        <asp:Parameter Name="original_Fecha_Creación" Type="String" />
                                        <asp:Parameter Name="original_Estado" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td valign="top">&nbsp;</td>
                        </tr>
                    </table>
                </p>
            </asp:View>
                        <asp:View ID="View2" runat="server">
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Usuario" DataSourceID="BopDBUsuariosFV" DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted">
                                <EditItemTemplate>
                                    Usuario:
                                    <asp:Label ID="UsuarioLabel1" runat="server" Text='<%# Eval("Usuario") %>' />
                                    <br />
                                    Nombre:
                                    <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                                    <br />
                                    eMail:
                                    <asp:TextBox ID="eMailTextBox" runat="server" Text='<%# Bind("eMail") %>' />
                                    <br />
                                    Pass:
                                    <asp:TextBox ID="PassTextBox" runat="server" Text='<%# Bind("Pass") %>' />
                                    <br />
                                    Fecha Creación:
                                    <asp:TextBox ID="Fecha_CreaciónTextBox" runat="server" Text='<%# Bind("[Fecha Creación]") %>' />
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
                                            <td class="auto-style12">Usuario:</td>
                                            <td class="auto-style4">
                                                <asp:TextBox ID="UsuarioTextBox" runat="server" style="text-align: left" Text='<%# Bind("Usuario") %>' />
                                            </td>
                                            <td class="auto-style4">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UsuarioTextBox" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style11">Usuario Dominio:</td>
                                            <td class="auto-style1">
                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("UsuarioAD") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">Nombre:</td>
                                            <td class="auto-style4">
                                                <asp:TextBox ID="NombreTextBox0" runat="server" Text='<%# Bind("Nombre") %>' />
                                            </td>
                                            <td class="auto-style4">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NombreTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style11">Dominio:</td>
                                            <td>
                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("DominioAD") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">Password:</td>
                                            <td class="auto-style4">
                                                <asp:TextBox ID="PassTextBox0" runat="server" Text='<%# Bind("Pass") %>' TextMode="Password" />
                                            </td>
                                            <td class="auto-style4">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PassTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style11">Perfil:</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="BopDBPerfiles" DataTextField="Descripción" DataValueField="Perfil" SelectedValue='<%# Bind("Perfil") %>'>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="BopDBPerfiles" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Perfil], [Descripción] FROM [Perfiles] where [Estado]='Activo'"></asp:SqlDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">eMail:</td>
                                            <td class="auto-style4">
                                                <asp:TextBox ID="eMailTextBox0" runat="server" Height="16px" Text='<%# Bind("eMail") %>' Width="212px" />
                                            </td>
                                            <td class="auto-style4">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="eMailTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style11">Fecha expiración:</td>
                                            <td>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Expiracion") %>' TextMode="Date"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">Estado:</td>
                                            <td class="auto-style4">
                                                <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                                    <asp:ListItem>Activo</asp:ListItem>
                                                    <asp:ListItem>Inactivo</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style4">&nbsp;</td>
                                            <td class="auto-style5">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                    &nbsp;<br />&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click" Text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertCancelButton_Click" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    Usuario:
                                    <asp:Label ID="UsuarioLabel" runat="server" Text='<%# Eval("Usuario") %>' />
                                    <br />
                                    Nombre:
                                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("Nombre") %>' />
                                    <br />
                                    eMail:
                                    <asp:Label ID="eMailLabel" runat="server" Text='<%# Bind("eMail") %>' />
                                    <br />
                                    Pass:
                                    <asp:Label ID="PassLabel" runat="server" Text='<%# Bind("Pass") %>' />
                                    <br />
                                    Fecha Creación:
                                    <asp:Label ID="Fecha_CreaciónLabel" runat="server" Text='<%# Bind("[Fecha Creación]") %>' />
                                    <br />
                                    Estado:
                                    <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                                    <br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                                </ItemTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="BopDBUsuariosFV" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [Usuario] = @original_Usuario AND [Nombre] = @original_Nombre AND [eMail] = @original_eMail AND [Pass] = @original_Pass AND [Fecha Creación] = @original_Fecha_Creación AND [Estado] = @original_Estado" InsertCommand="p_ValidaInsertaUsuario" InsertCommandType="StoredProcedure" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Usuarios]" UpdateCommand="UPDATE [Usuarios] SET [Nombre] = @Nombre, [eMail] = @eMail, [Pass] = @Pass, [Fecha Creación] = @Fecha_Creación, [Estado] = @Estado WHERE [Usuario] = @original_Usuario AND [Nombre] = @original_Nombre AND [eMail] = @original_eMail AND [Pass] = @original_Pass AND [Fecha Creación] = @original_Fecha_Creación AND [Estado] = @original_Estado">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_Usuario" Type="String" />
                                    <asp:Parameter Name="original_Nombre" Type="String" />
                                    <asp:Parameter Name="original_eMail" Type="String" />
                                    <asp:Parameter Name="original_Pass" Type="String" />
                                    <asp:Parameter DbType="Date" Name="original_Fecha_Creación" />
                                    <asp:Parameter Name="original_Estado" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Usuario" Type="String" />
                                    <asp:Parameter Name="Nombre" Type="String" />
                                    <asp:Parameter Name="eMail" Type="String" />
                                    <asp:Parameter Name="Pass" Type="String" />
                                    <asp:Parameter DbType="Date" Name="Fecha_Creación" />
                                    <asp:Parameter Name="Estado" Type="String" />
                                    <asp:Parameter Name="UsuarioAD" />
                                    <asp:Parameter Name="DominioAD" />
                                    <asp:Parameter Name="Perfil" />
                                    <asp:Parameter Name="Expiracion" />
                                    <asp:Parameter Name="Done" Type="Boolean" />
                                    <asp:Parameter Name="Msg" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Nombre" Type="String" />
                                    <asp:Parameter Name="eMail" Type="String" />
                                    <asp:Parameter Name="Pass" Type="String" />
                                    <asp:Parameter DbType="Date" Name="Fecha_Creación" />
                                    <asp:Parameter Name="Estado" Type="String" />
                                    <asp:Parameter Name="original_Usuario" Type="String" />
                                    <asp:Parameter Name="original_Nombre" Type="String" />
                                    <asp:Parameter Name="original_eMail" Type="String" />
                                    <asp:Parameter Name="original_Pass" Type="String" />
                                    <asp:Parameter DbType="Date" Name="original_Fecha_Creación" />
                                    <asp:Parameter Name="original_Estado" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
</p>
    <p>
        &nbsp;</p>
</asp:Content>
