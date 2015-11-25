<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sesiones.aspx.cs" Inherits="BitOp.Sesiones.SesionesTP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style15 {
            font-size: medium;
            color: #000000;
        }
        .auto-style16 {
            width: 85px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style15">
        <strong>MANTIENE SESIONES</strong></p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
                &nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agrega Sesión</asp:LinkButton>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Sesion_Key_RTS" DataSourceID="GesDBSesionesGV" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="6" ShowHeaderWhenEmpty="True" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ImageUrl="~/Images/saveHS.png" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/Cancel(build)_194_32.bmp" Text="Cancelar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Editar" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); " Text="Eliminar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Sesion_Key_RTS" HeaderText="ID Sesión" ReadOnly="True" SortExpression="Sesion_Key_RTS" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Región" SortExpression="Region_ID"><EditItemTemplate><asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" SelectedValue='<%# Bind("Region_ID") %>'></asp:DropDownList></EditItemTemplate><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("Region_ID") %>'></asp:Label></ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripción" SortExpression="Descripcion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" MaxLength="60" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Escenario" SortExpression="Escenario">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" MaxLength="15" Text='<%# Bind("Escenario") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Escenario") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="F.Creación" SortExpression="Fecha_Creacion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Fecha_Creacion") %>' MaxLength="10" TextMode="Date"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Fecha_Creacion", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="F.Vigencia" SortExpression="Fecha_Vigencia">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Fecha_Vigencia") %>' MaxLength="10" TextMode="Date"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Fecha_Vigencia", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="F.Expiración" SortExpression="Fecha_Expiracion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Fecha_Expiracion") %>' MaxLength="10" TextMode="Date"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Fecha_Expiracion", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Usuario Modif." SortExpression="Usuario_Modificacion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" MaxLength="12" Text='<%# Bind("Usuario_Modificacion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Usuario_Modificacion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="F.Modif." SortExpression="Fecha_Modificacion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Fecha_Modificacion") %>' MaxLength="10" TextMode="Date"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Fecha_Modificacion", "{0:g}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Usuario Cataloga" SortExpression="Usuario_Catalogacion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Usuario_Catalogacion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("Usuario_Catalogacion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="F.Cataloga" SortExpression="Fecha_Catalogacion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Fecha_Catalogacion") %>' MaxLength="50"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Fecha_Catalogacion", "{0:g}") %>'></asp:Label>
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
                <asp:SqlDataSource ID="GesDBSesionesGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Sesiones] WHERE [Sesion_Key_RTS] = @Sesion_Key_RTS" InsertCommand="p_ValidaInsertaSesion" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [Sesiones]" UpdateCommand="UPDATE [Sesiones] SET [Region_ID] = @Region_ID, [Tipo] = @Tipo, [Descripcion] = @Descripcion, [Escenario] = @Escenario, [Fecha_Creacion] = @Fecha_Creacion, [Fecha_Vigencia] = @Fecha_Vigencia, [Fecha_Expiracion] = @Fecha_Expiracion, [Usuario_Modificacion] = @Usuario_Modificacion, [Fecha_Modificacion] = @Fecha_Modificacion, [Usuario_Catalogacion] = @Usuario_Catalogacion, [Fecha_Catalogacion] = @Fecha_Catalogacion WHERE [Sesion_Key_RTS] = @Sesion_Key_RTS">
                    <DeleteParameters>
                        <asp:Parameter Name="Sesion_Key_RTS" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Sesion_Key_RTS" Type="Int32" />
                        <asp:Parameter Name="Region_ID" Type="String" />
                        <asp:Parameter Name="Tipo" Type="Int32" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="Escenario" Type="String" />
                        <asp:Parameter Name="Fecha_Creacion" Type="DateTime" />
                        <asp:Parameter Name="Fecha_Vigencia" Type="DateTime" />
                        <asp:Parameter Name="Fecha_Expiracion" Type="DateTime" />
                        <asp:Parameter Name="Usuario_Modificacion" Type="String" />
                        <asp:Parameter Name="Fecha_Modificacion" Type="DateTime" />
                        <asp:Parameter Name="Usuario_Catalogacion" Type="String" />
                        <asp:Parameter Name="Fecha_Catalogacion" Type="DateTime" />
                        <asp:Parameter Name="Done" Type="Boolean" />
                        <asp:Parameter Name="Msg" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Region_ID" Type="String" />
                        <asp:Parameter Name="Tipo" Type="Int32" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="Escenario" Type="String" />
                        <asp:Parameter Name="Fecha_Creacion" Type="DateTime" />
                        <asp:Parameter Name="Fecha_Vigencia" Type="DateTime" />
                        <asp:Parameter Name="Fecha_Expiracion" Type="DateTime" />
                        <asp:Parameter Name="Usuario_Modificacion" Type="String" />
                        <asp:Parameter Name="Fecha_Modificacion" Type="DateTime" />
                        <asp:Parameter Name="Usuario_Catalogacion" Type="String" />
                        <asp:Parameter Name="Fecha_Catalogacion" Type="DateTime" />
                        <asp:Parameter Name="Sesion_Key_RTS" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Sesion_Key_RTS" DataSourceID="GesDBSesionesFV" DefaultMode="Insert" Width="595px">
                    <EditItemTemplate>
                        Sesion_Key_RTS:
                        <asp:Label ID="Sesion_Key_RTSLabel1" runat="server" Text='<%# Eval("Sesion_Key_RTS") %>' />
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
                        &nbsp;&nbsp;<br />&nbsp;<table style="width:100%;">
                            <tr>
                                <td class="auto-style16">ID Sesión:</td>
                                <td>
                                    <asp:TextBox ID="Sesion_Key_RTSTextBox" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' Height="22px" MaxLength="10" Width="100px" />
                                </td>
                                <td>&nbsp;</td>
                                <td>Tipo:</td>
                                <td>
                                    <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' Height="22px" MaxLength="1" Width="15px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16">Región:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" SelectedValue='<%# Bind("Region_ID") %>' Height="22px" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                                <td>Escenario:</td>
                                <td>
                                    <asp:TextBox ID="EscenarioTextBox" runat="server" Text='<%# Bind("Escenario") %>' Height="22px" MaxLength="15" Width="100px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16">Descripcion:</td>
                                <td>
                                    <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' Height="22px" MaxLength="60" Width="300px" />
                                </td>
                                <td>&nbsp;</td>
                                <td>F.Creación:</td>
                                <td>
                                    <asp:TextBox ID="Fecha_CreacionTextBox" runat="server" Text='<%# Bind("Fecha_Creacion") %>' Height="22px" MaxLength="10" TextMode="Date" Width="120px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16">F.Vigencia:</td>
                                <td>
                                    <asp:TextBox ID="Fecha_VigenciaTextBox" runat="server" Text='<%# Bind("Fecha_Vigencia") %>' TextMode="Date" Height="22px" MaxLength="10" Width="120px" />
                                </td>
                                <td>&nbsp;</td>
                                <td>F.Expiración:</td>
                                <td>
                                    <asp:TextBox ID="Fecha_ExpiracionTextBox" runat="server" Text='<%# Bind("Fecha_Expiracion") %>' Height="22px" MaxLength="10" TextMode="Date" Width="120px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16">Usuario Modif.</td>
                                <td>
                                    <asp:TextBox ID="Usuario_ModificacionTextBox" runat="server" Text='<%# Bind("Usuario_Modificacion") %>' Height="22px" MaxLength="12" Width="120px" />
                                </td>
                                <td>&nbsp;</td>
                                <td>F.Modif.</td>
                                <td>
                                    <asp:TextBox ID="Fecha_ModificacionTextBox" runat="server" Text='<%# Bind("Fecha_Modificacion") %>' Height="22px" MaxLength="10" TextMode="Date" Width="120px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16">Usuario Cataloga:</td>
                                <td>
                                    <asp:TextBox ID="Usuario_CatalogacionTextBox" runat="server" Text='<%# Bind("Usuario_Catalogacion") %>' Height="22px" MaxLength="50" Width="120px" />
                                </td>
                                <td>&nbsp;</td>
                                <td>F.Cataloga:</td>
                                <td>
                                    <asp:TextBox ID="Fecha_CatalogacionTextBox" runat="server" Text='<%# Bind("Fecha_Catalogacion") %>' Height="22px" MaxLength="10" TextMode="Date" Width="120px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click2" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertCancelButton_Click1" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Sesion_Key_RTS:
                        <asp:Label ID="Sesion_Key_RTSLabel" runat="server" Text='<%# Eval("Sesion_Key_RTS") %>' />
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
                        Fecha_Expiracion:
                        <asp:Label ID="Fecha_ExpiracionLabel" runat="server" Text='<%# Bind("Fecha_Expiracion") %>' />
                        <br />
                        Usuario_Modificacion:
                        <asp:Label ID="Usuario_ModificacionLabel" runat="server" Text='<%# Bind("Usuario_Modificacion") %>' />
                        <br />
                        Fecha_Modificacion:
                        <asp:Label ID="Fecha_ModificacionLabel" runat="server" Text='<%# Bind("Fecha_Modificacion") %>' />
                        <br />
                        Usuario_Catalogacion:
                        <asp:Label ID="Usuario_CatalogacionLabel" runat="server" Text='<%# Bind("Usuario_Catalogacion") %>' />
                        <br />
                        Fecha_Catalogacion:
                        <asp:Label ID="Fecha_CatalogacionLabel" runat="server" Text='<%# Bind("Fecha_Catalogacion") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <asp:SqlDataSource ID="GesDBSesionesFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Sesiones] WHERE [Sesion_Key_RTS] = @Sesion_Key_RTS" InsertCommand="p_ValidaInsertaSesion" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [Sesiones]" UpdateCommand="UPDATE [Sesiones] SET [Region_ID] = @Region_ID, [Tipo] = @Tipo, [Descripcion] = @Descripcion, [Escenario] = @Escenario, [Fecha_Creacion] = @Fecha_Creacion, [Fecha_Vigencia] = @Fecha_Vigencia, [Fecha_Expiracion] = @Fecha_Expiracion, [Usuario_Modificacion] = @Usuario_Modificacion, [Fecha_Modificacion] = @Fecha_Modificacion, [Usuario_Catalogacion] = @Usuario_Catalogacion, [Fecha_Catalogacion] = @Fecha_Catalogacion WHERE [Sesion_Key_RTS] = @Sesion_Key_RTS">
                    <DeleteParameters>
                        <asp:Parameter Name="Sesion_Key_RTS" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Sesion_Key_RTS" Type="Int32" />
                        <asp:Parameter Name="Region_ID" Type="String" />
                        <asp:Parameter Name="Tipo" Type="Int32" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="Escenario" Type="String" />
                        <asp:Parameter Name="Fecha_Creacion" Type="DateTime" />
                        <asp:Parameter Name="Fecha_Vigencia" Type="DateTime" />
                        <asp:Parameter Name="Fecha_Expiracion" Type="DateTime" />
                        <asp:Parameter Name="Usuario_Modificacion" Type="String" />
                        <asp:Parameter Name="Fecha_Modificacion" Type="DateTime" />
                        <asp:Parameter Name="Usuario_Catalogacion" Type="String" />
                        <asp:Parameter Name="Fecha_Catalogacion" Type="DateTime" />
                        <asp:Parameter Name="Done" Type="Boolean" />
                        <asp:Parameter Name="Msg" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Region_ID" Type="String" />
                        <asp:Parameter Name="Tipo" Type="Int32" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="Escenario" Type="String" />
                        <asp:Parameter Name="Fecha_Creacion" Type="DateTime" />
                        <asp:Parameter Name="Fecha_Vigencia" Type="DateTime" />
                        <asp:Parameter Name="Fecha_Expiracion" Type="DateTime" />
                        <asp:Parameter Name="Usuario_Modificacion" Type="String" />
                        <asp:Parameter Name="Fecha_Modificacion" Type="DateTime" />
                        <asp:Parameter Name="Usuario_Catalogacion" Type="String" />
                        <asp:Parameter Name="Fecha_Catalogacion" Type="DateTime" />
                        <asp:Parameter Name="Sesion_Key_RTS" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], ([Region_Chile] + ' - ' + [Descripción]) as Region_Txt, [Region_RTS] 
 FROM [Regiones]
ORDER BY [Region_Txt]"></asp:SqlDataSource>
                <br />
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
