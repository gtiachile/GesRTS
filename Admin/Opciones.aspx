<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Opciones.aspx.cs" Inherits="BitOp.Admin.Opciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

    .auto-style2 {
        height: 25px;
        width: 73px;
    }
    .auto-style4 {
        height: 25px;
        width: 245px;
    }
    .auto-style7 {
        width: 73px;
    }
    .auto-style5 {
        width: 245px;
    }
        .auto-style13 {
            color: #000000;
        }
        .auto-style14 {
            font-size: medium;
            color: #000000;
        }
        .auto-style15 {
            width: 144px;
        }
        .auto-style17 {
            width: 42px;
        }
        .auto-style18 {
            width: 249px;
        }
        .auto-style20 {
            width: 61px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style14"><strong>OPCIONES</strong></p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" Width="16px" />
                    &nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agregar Opción</asp:LinkButton>
                </p>
                <p>
                    <span class="auto-style13">Módulo:</span>
                    <asp:DropDownList ID="DropDownListModulos" runat="server" AutoPostBack="True" DataSourceID="BopDBModulos" DataTextField="Modulo" DataValueField="Modulo">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BopDBModulos" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Modulo] FROM [Modulos]"></asp:SqlDataSource>
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Opcion" DataSourceID="BopDBOpciones" Width="90%" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Actualizar" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/Cancel(build)_194_32.bmp" Text="Cancelar" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Editar" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" Text="Eliminar" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Opcion" HeaderText="Opción" ReadOnly="True" SortExpression="Opcion" />
                            <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
                            <asp:TemplateField HeaderText="Módulo" SortExpression="Modulo">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True" DataSourceID="BopDBModulos" DataTextField="Modulo" DataValueField="Modulo" SelectedValue='<%# Bind("Modulo") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Modulo") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tipo" SortExpression="Tipo">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Tipo") %>'>
                                        <asp:ListItem Value="Menu">Menú</asp:ListItem>
                                        <asp:ListItem Value="Pagina">Página</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Tipo") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Url" HeaderText="Url" SortExpression="Url" />
                            <asp:BoundField DataField="Txt" HeaderText="Txt" SortExpression="Txt" />
                            <asp:TemplateField HeaderText="Audita" SortExpression="Audita">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Audita") %>'>
                                        <asp:ListItem>No</asp:ListItem>
                                        <asp:ListItem>Si</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Audita") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList10" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Estado") %>'>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" BorderColor="#003366" ForeColor="White" Font-Bold="True" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="BopDBOpciones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Opciones] WHERE [Opcion] = @original_Opcion" InsertCommand="p_ValidaInsertaOpcion" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Opciones]
WHERE Modulo = @Módulo" UpdateCommand="UPDATE [Opciones] SET [Descripción] = @Descripción, [Modulo] = @Modulo, [Estado] = @Estado, [Tipo] = @Tipo, [Url] = @Url, [Txt] = @Txt, [Audita] = @Audita WHERE [Opcion] = @original_Opcion" InsertCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="original_Opcion" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Opcion" Type="String" />
                            <asp:Parameter Name="Descripción" Type="String" />
                            <asp:Parameter Name="Modulo" Type="String" />
                            <asp:Parameter Name="Estado" Type="String" />
                            <asp:Parameter Name="Tipo" Type="String" />
                            <asp:Parameter Name="Url" Type="String" />
                            <asp:Parameter Name="tx" Type="String" />
                            <asp:Parameter Name="Done" Type="Boolean" />
                            <asp:Parameter Name="Msg" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListModulos" Name="Módulo" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Descripción" Type="String" />
                            <asp:Parameter Name="Modulo" Type="String" />
                            <asp:Parameter Name="Estado" Type="String" />
                            <asp:Parameter Name="Tipo" Type="String" />
                            <asp:Parameter Name="Url" Type="String" />
                            <asp:Parameter Name="Txt" Type="String" />
                            <asp:Parameter Name="Audita" Type="String" />
                            <asp:Parameter Name="original_Opcion" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Opcion" DataSourceID="BopDBOpcionesFV" DefaultMode="Insert" OnPageIndexChanging="FormView1_PageIndexChanging">
        <EditItemTemplate>
            Opcion:
            <asp:Label ID="OpcionLabel1" runat="server" Text='<%# Eval("Opcion") %>' />
            <br />
            Descripción:
            <asp:TextBox ID="DescripciónTextBox" runat="server" Text='<%# Bind("Descripción") %>' />
            <br />
            Modulo:
            <asp:TextBox ID="ModuloTextBox" runat="server" Text='<%# Bind("Modulo") %>' />
            <br />
            Estado:
            <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
            <br />
            Tipo:
            <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
            <br />
            Url:
            <asp:TextBox ID="UrlTextBox" runat="server" Text='<%# Bind("Url") %>' />
            <br />
            Txt:
            <asp:TextBox ID="TxtTextBox" runat="server" Text='<%# Bind("Txt") %>' />
            <br />
            Audita:
            <asp:TextBox ID="AuditaTextBox" runat="server" Text='<%# Bind("Audita") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style15">Opción: </td>
                    <td class="auto-style18">
                        <asp:TextBox ID="OpcionTextBox" runat="server" Text='<%# Bind("Opcion") %>' Width="200px" />
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style20">Tipo:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList11" runat="server" SelectedValue='<%# Bind("Tipo") %>'>
                            <asp:ListItem Value="Menu">Menú</asp:ListItem>
                            <asp:ListItem Value="Pagina">Página</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">Descripción :</td>
                    <td class="auto-style18">
                        <asp:TextBox ID="DescripciónTextBox" runat="server" Text='<%# Bind("Descripción") %>' Width="200px" />
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style20">Audita:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList12" runat="server" SelectedValue='<%# Bind("Audita") %>'>
                            <asp:ListItem>No</asp:ListItem>
                            <asp:ListItem>Si</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">Módulo: </td>
                    <td class="auto-style18">
                        <asp:DropDownList ID="DropDownList14" runat="server" AutoPostBack="True" DataSourceID="BopDBModulos" DataTextField="Modulo" DataValueField="Modulo" SelectedValue='<%# Bind("Modulo") %>'>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style20">Estado:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList13" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Estado") %>'>
                            <asp:ListItem>Activo</asp:ListItem>
                            <asp:ListItem>Inactivo</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">Url:</td>
                    <td class="auto-style18">
                        <asp:TextBox ID="UrlTextBox" runat="server" Text='<%# Bind("Url") %>' Width="300px" />
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15">Txt:</td>
                    <td class="auto-style18">
                        <asp:TextBox ID="TxtTextBox" runat="server" Text='<%# Bind("Txt") %>' Width="150px" />
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" OnClick="InsertButton_Click1" />
            &nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertCancelButton_Click1" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            Opcion:
            <asp:Label ID="OpcionLabel" runat="server" Text='<%# Eval("Opcion") %>' />
            <br />
            Descripción:
            <asp:Label ID="DescripciónLabel" runat="server" Text='<%# Bind("Descripción") %>' />
            <br />
            Modulo:
            <asp:Label ID="ModuloLabel" runat="server" Text='<%# Bind("Modulo") %>' />
            <br />
            Estado:
            <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
            <br />
            Tipo:
            <asp:Label ID="TipoLabel" runat="server" Text='<%# Bind("Tipo") %>' />
            <br />
            Url:
            <asp:Label ID="UrlLabel" runat="server" Text='<%# Bind("Url") %>' />
            <br />
            Txt:
            <asp:Label ID="TxtLabel" runat="server" Text='<%# Bind("Txt") %>' />
            <br />
            Audita:
            <asp:Label ID="AuditaLabel" runat="server" Text='<%# Bind("Audita") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="BopDBOpcionesFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Opciones] WHERE [Opcion] = @original_Opcion" InsertCommand="p_ValidaInsertaOpcion" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Opciones]" UpdateCommand="UPDATE [Opciones] SET [Descripción] = @Descripción, [Modulo] = @Modulo, [Estado] = @Estado, [Tipo] = @Tipo, [Url] = @Url, [Txt] = @Txt, [Audita] = @Audita WHERE [Opcion] = @original_Opcion" InsertCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="original_Opcion" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Opcion" Type="String" />
            <asp:Parameter Name="Descripción" Type="String" />
            <asp:Parameter Name="Modulo" Type="String" />
            <asp:Parameter Name="Estado" Type="String" />
            <asp:Parameter Name="Tipo" Type="String" />
            <asp:Parameter Name="Url" Type="String" />
            <asp:Parameter Name="tx" Type="String" />
            <asp:Parameter Name="Done" Type="Boolean" />
            <asp:Parameter Name="Msg" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Descripción" Type="String" />
            <asp:Parameter Name="Modulo" Type="String" />
            <asp:Parameter Name="Estado" Type="String" />
            <asp:Parameter Name="Tipo" Type="String" />
            <asp:Parameter Name="Url" Type="String" />
            <asp:Parameter Name="Txt" Type="String" />
            <asp:Parameter Name="Audita" Type="String" />
            <asp:Parameter Name="original_Opcion" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </p>
<p>
    
    </p>
</asp:Content>
