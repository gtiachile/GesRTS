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
        .auto-style13 {
            font-size: medium;
            color: #000000;
        }
        .auto-style14 {
            width: 162px;
            color: #000000;
        }
        .auto-style18 {
            width: 100px;
            font-size: xx-small;
        }
        .auto-style19 {
            width: 29px;
            color: #000000;
        }
        .auto-style20 {
            width: 96px;
            font-size: xx-small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <span class="auto-style13"><strong>USUARIOS</strong></span><br />
</p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
                    &nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Agregar Usuario</asp:LinkButton>
                </p>
                <p>
                    <table style="width:100%;">
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Usuario" DataSourceID="BopDBUsuariosGV" Width="90%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Actualizar" />
                                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/Cancel(build)_194_32.bmp" Text="Cancelar" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Editar" />
                                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" Text="Eliminar" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); " />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Usuario" SortExpression="Usuario">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Usuario") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Nombre") %>' Width="80px" MaxLength="30"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="eMail" SortExpression="eMail">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("eMail") %>' TextMode="Email" Width="100px" MaxLength="40"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("eMail") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Password" SortExpression="Pass">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Pass") %>' Width="80px" MaxLength="10"></asp:TextBox>
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
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Expiracion") %>' TextMode="Date" MaxLength="10"></asp:TextBox>
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
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="BopDBUsuariosGV" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [Usuario] = @original_Usuario" InsertCommand="INSERT INTO [Usuarios] ([Usuario], [Nombre], [eMail], [Pass], [Fecha Creación], [Estado]) VALUES (@Usuario, @Nombre, @eMail, @Pass, @Fecha_Creación, @Estado)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Usuarios]" UpdateCommand="UPDATE [Usuarios] SET [Nombre] = @Nombre, [eMail] = @eMail, [Pass] = @Pass, [Estado] = @Estado, [UsuarioAD] = @UsuarioAD, [DominioAD]=@DominioAD,[Perfil]=@Perfil, [Expiracion]=@Expiracion WHERE [Usuario] = @original_Usuario ">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_Usuario" Type="String" />
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
                                        <asp:Parameter Name="Estado" Type="String" />
                                        <asp:Parameter Name="UsuarioAD" />
                                        <asp:Parameter Name="DominioAD" />
                                        <asp:Parameter Name="Perfil" />
                                        <asp:Parameter Name="Expiracion" />
                                        <asp:Parameter Name="original_Usuario" Type="String" />
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
                                            <td class="auto-style14" rowspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Usuarios.png" Width="130px" Height="200px" />
                                            </td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td class="auto-style12">Usuario:</td>
                                            <td class="auto-style18">
                                                <asp:TextBox ID="UsuarioTextBox" runat="server" Height="22px" style="text-align: left" Text='<%# Bind("Usuario") %>' MaxLength="50" Width="200px" />
                                            </td>
                                            <td class="auto-style20">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UsuarioTextBox" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style11">Usuario Dominio:</td>
                                            <td class="auto-style1">
                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("UsuarioAD") %>' Height="22px" MaxLength="50" Width="180px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td class="auto-style10">Nombre:</td>
                                            <td class="auto-style18">
                                                <asp:TextBox ID="NombreTextBox0" runat="server" Height="22px" Text='<%# Bind("Nombre") %>' Width="150px" MaxLength="30" />
                                            </td>
                                            <td class="auto-style20">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NombreTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style11">Dominio:</td>
                                            <td>
                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("DominioAD") %>' Height="22px" MaxLength="20"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td class="auto-style10">Password:</td>
                                            <td class="auto-style18">
                                                <asp:TextBox ID="PassTextBox0" runat="server" Height="22px" Text='<%# Bind("Pass") %>' TextMode="Password" />
                                            </td>
                                            <td class="auto-style20">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PassTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style11">Perfil:</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="BopDBPerfiles" DataTextField="Descripción" DataValueField="Perfil" SelectedValue='<%# Bind("Perfil") %>' Height="22px" Width="180px">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="BopDBPerfiles" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Perfil], [Descripción] FROM [Perfiles] where [Estado]='Activo'"></asp:SqlDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                            <td class="auto-style10">eMail:</td>
                                            <td class="auto-style18">
                                                <asp:TextBox ID="eMailTextBox0" runat="server" Height="22px" Text='<%# Bind("eMail") %>' Width="200px" MaxLength="40" />
                                            </td>
                                            <td class="auto-style20">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="eMailTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style11">Fecha expiración:</td>
                                            <td>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Expiracion") %>' TextMode="Date" Height="22px" MaxLength="10" Width="80px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td class="auto-style10">Estado:</td>
                                            <td class="auto-style18">
                                                <asp:DropDownList ID="DropDownList3" runat="server" Height="22px" SelectedValue='<%# Bind("Estado") %>'>
                                                    <asp:ListItem>Activo</asp:ListItem>
                                                    <asp:ListItem>Inactivo</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style20">&nbsp;</td>
                                            <td class="auto-style5">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                    &nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click" Text="Insertar" />
                                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertCancelButton_Click" Text="Cancelar" />
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
                            <asp:SqlDataSource ID="BopDBUsuariosFV" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [Usuario] = @original_Usuario AND [Nombre] = @original_Nombre AND [eMail] = @original_eMail AND [Pass] = @original_Pass AND [Fecha Creación] = @original_Fecha_Creación AND [Estado] = @original_Estado" InsertCommand="p_ValidaInsertaUsuario" InsertCommandType="StoredProcedure" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Usuarios]" UpdateCommand="UPDATE [Usuarios] SET [Nombre] = @Nombre, [eMail] = @eMail, [Pass] = @Pass, [Estado] = @Estado WHERE [Usuario] = @original_Usuario">
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
                                    <asp:Parameter Name="Estado" Type="String" />
                                    <asp:Parameter Name="original_Usuario" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
</p>
    <p>
        &nbsp;</p>
</asp:Content>
