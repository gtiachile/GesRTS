<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cataloga.aspx.cs" Inherits="BitOp.Sesiones.Cataloga1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            font-size: medium;
            color: #000000;
        }
        .auto-style11 {
            color: #000000;
        }
        .auto-style12 {
            width: 304px;
        }
        .auto-style14 {
            width: 72px;
            height: 23px;
        }
        .auto-style15 {
            height: 23px;
            width: 194px;
        }
        .auto-style16 {
            width: 194px;
        }
        .auto-style17 {
            width: 72px;
        }
        .auto-style18 {
            height: 23px;
            width: 91px;
        }
        .auto-style19 {
            width: 91px;
        }
        .auto-style20 {
            width: 30px;
            height: 23px;
        }
        .auto-style21 {
            width: 30px;
        }
        .auto-style22 {
            height: 23px;
            width: 528px;
        }
        .auto-style23 {
            width: 528px;
        }
        .auto-style24 {
            width: 638px;
        }
        .auto-style29 {
            width: 149px;
        }
        .auto-style30 {
            width: 100px;
        }
        .auto-style32 {
            width: 33px;
        }
        .auto-style41 {
            width: 141px;
        }
        .auto-style42 {
            width: 77px;
        }
        .auto-style43 {
            width: 376px;
        }
        .auto-style44 {
            width: 89px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style10">
        <strong>CATALOGA SESIONES DE PLANIFICACION&nbsp; (Desde TP)</strong></p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style12" rowspan="2"><span class="auto-style11">Criterio:</span>&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="GesDBCriterios" DataTextField="Criterio_ID" DataValueField="Criterio_ID" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                            </asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            <asp:SqlDataSource ID="GesDBCriterios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT 'Seleccione Criterio' AS Criterio_ID, ' ' AS Fecha_Desde, ' ' AS Inicio_Nombre, ' ' AS Region,
              ' ' AS Supervisor, ' ' AS Estado
UNION 
SELECT [Criterio_ID], [Fecha_Desde], [Inicio_Nombre], [Region], [Supervisor], [Estado] 
  FROM [Criterios]
WHERE [Estado] = 'Activo'"></asp:SqlDataSource>
                        </td>
                        <td class="auto-style14">Región:</td>
                        <td class="auto-style15">
                            <asp:Label ID="Lbl_Region" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="auto-style20">&nbsp;</td>
                        <td class="auto-style18">Supervisor:</td>
                        <td class="auto-style22">
                            <asp:Label ID="Lbl_Supervisor" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17">F.Desde:</td>
                        <td class="auto-style16">
                            <asp:Label ID="Lbl_Fecha_Desde" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="auto-style21">&nbsp;</td>
                        <td class="auto-style19">Inicio Descrip.: </td>
                        <td class="auto-style23">
                            <asp:Label ID="Lbl_Inicio_Descrip" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PKEY" DataSourceID="GesDBSesionesTP" ForeColor="#333333" GridLines="None" Width="90%" PageSize="8" ShowHeaderWhenEmpty="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" OnClick="Button1_Click" Text="Sel" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PKEY" HeaderText="ID Sesión" ReadOnly="True" SortExpression="PKEY" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="REGION_ID" HeaderText="Región" SortExpression="REGION_ID" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DESCRIPTION" HeaderText="Descripción" SortExpression="DESCRIPTION" />
                        <asp:BoundField DataField="SCENARIO" HeaderText="Escenario" SortExpression="SCENARIO" />
                        <asp:TemplateField HeaderText="F.Sesión" SortExpression="SESSION_DATE">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SESSION_DATE") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("SESSION_DATE", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="USER_MODIFIED" HeaderText="Usuario Modif." SortExpression="USER_MODIFIED" />
                        <asp:TemplateField HeaderText="F.Modif." SortExpression="DATE_MODIFIED">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DATE_MODIFIED") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("DATE_MODIFIED", "{0:g}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
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
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style24">&nbsp;</td>
                        <td>
                            <asp:Button ID="CatalogaSesion0" runat="server" CssClass="bold" Height="42px" OnClick="CatalogaSesion_Click" Text="Cataloga Sesión" Width="118px" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="GesDBSesionesTP" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [PKEY], [REGION_ID], [TYPE], [DESCRIPTION], [SCENARIO], [SESSION_DATE], [USER_MODIFIED],                            [DATE_MODIFIED]
 FROM [V_SesionesTP]
WHERE [REGION_ID] = 'DMC2'
ORDER BY [PKEY]"></asp:SqlDataSource>
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Sesion_Key_RTS" DataSourceID="GesDBSesiones" DefaultMode="Edit" Width="469px">
                    <EditItemTemplate>
                        <br />
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style41">ID Sesión:</td>
                                <td class="auto-style29">
                                    <asp:Label ID="Lbl_ID_Sesion" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' />
                                </td>
                                <td class="auto-style42">&nbsp;</td>
                                <td class="auto-style30">Nombre Sesión:</td>
                                <td class="auto-style43">
                                    <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' Width="250px" />
                                </td>
                                <td class="auto-style44">&nbsp;</td>
                                <td class="auto-style32">Región:</td>
                                <td>
                                    <asp:TextBox ID="Region_IDTextBox" runat="server" Height="22px" Text='<%# Bind("Region_ID") %>' Width="35px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style41">F.Creación:</td>
                                <td class="auto-style29">
                                    <asp:TextBox ID="Fecha_CreacionTextBox" runat="server" Text='<%# Bind("Fecha_Creacion", "{0:d}") %>' />
                                </td>
                                <td class="auto-style42">&nbsp;</td>
                                <td class="auto-style30">Escenario: </td>
                                <td class="auto-style43">
                                    <asp:TextBox ID="EscenarioTextBox" runat="server" Text='<%# Bind("Escenario") %>' />
                                </td>
                                <td class="auto-style44">&nbsp;</td>
                                <td class="auto-style32">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style41">F.Vigencia:</td>
                                <td class="auto-style29">
                                    <asp:TextBox ID="Fecha_VigenciaTextBox" runat="server" Text='<%# Bind("Fecha_Vigencia", "{0:d}") %>' />
                                </td>
                                <td class="auto-style42">&nbsp;</td>
                                <td class="auto-style30">F.Expiración:</td>
                                <td class="auto-style43">
                                    <asp:TextBox ID="Fecha_ExpiracionTextBox" runat="server" Text='<%# Bind("Fecha_Expiracion", "{0:d}") %>' />
                                </td>
                                <td class="auto-style44">&nbsp;</td>
                                <td class="auto-style32">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style41">Usuario Modif.:</td>
                                <td class="auto-style29">
                                    <asp:TextBox ID="Usuario_ModificacionTextBox" runat="server" Text='<%# Bind("Usuario_Modificacion") %>' />
                                </td>
                                <td class="auto-style42">&nbsp;</td>
                                <td class="auto-style30">F.Modificación:</td>
                                <td class="auto-style43">
                                    <asp:TextBox ID="Fecha_ModificacionTextBox" runat="server" Text='<%# Bind("Fecha_Modificacion", "{0:d}") %>' />
                                </td>
                                <td class="auto-style44">&nbsp;</td>
                                <td class="auto-style32">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style41">Usuario cataloga:</td>
                                <td class="auto-style29">
                                    <asp:TextBox ID="Usuario_CatalogacionTextBox" runat="server" Text='<%# Bind("Usuario_Catalogacion") %>' />
                                </td>
                                <td class="auto-style42">&nbsp;</td>
                                <td class="auto-style30">F.Catalogación:</td>
                                <td class="auto-style43">
                                    <asp:TextBox ID="Fecha_CatalogacionTextBox" runat="server" Text='<%# Bind("Fecha_Catalogacion", "{0:d}") %>' />
                                </td>
                                <td class="auto-style44">&nbsp;</td>
                                <td class="auto-style32">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" OnClick="UpdateButton_Click" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="UpdateCancelButton_Click" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Sesion_Key_RTS:
                        <asp:TextBox ID="Sesion_Key_RTSTextBox" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' />
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
                        Fecha_Catalogacion:
                        <asp:TextBox ID="Fecha_CatalogacionTextBox" runat="server" Text='<%# Bind("Fecha_Catalogacion") %>' />
                        <br />
                        Usuario_Catalogacion:
                        <asp:TextBox ID="Usuario_CatalogacionTextBox" runat="server" Text='<%# Bind("Usuario_Catalogacion") %>' />
                        <br />
                        Fecha_Modificacion:
                        <asp:TextBox ID="Fecha_ModificacionTextBox" runat="server" Text='<%# Bind("Fecha_Modificacion") %>' />
                        <br />
                        Usuario_Modificacion:
                        <asp:TextBox ID="Usuario_ModificacionTextBox" runat="server" Text='<%# Bind("Usuario_Modificacion") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
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
                        Fecha_Catalogacion:
                        <asp:Label ID="Fecha_CatalogacionLabel" runat="server" Text='<%# Bind("Fecha_Catalogacion") %>' />
                        <br />
                        Usuario_Catalogacion:
                        <asp:Label ID="Usuario_CatalogacionLabel" runat="server" Text='<%# Bind("Usuario_Catalogacion") %>' />
                        <br />
                        Fecha_Modificacion:
                        <asp:Label ID="Fecha_ModificacionLabel" runat="server" Text='<%# Bind("Fecha_Modificacion") %>' />
                        <br />
                        Usuario_Modificacion:
                        <asp:Label ID="Usuario_ModificacionLabel" runat="server" Text='<%# Bind("Usuario_Modificacion") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Territorio_Key_RTS" DataSourceID="GesDBTerritorios" ForeColor="#333333" GridLines="None" PageSize="6" Width="90%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Actualizar" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/Cancel(build)_194_32.bmp" Text="Cancelar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Editar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Territorio_Nro" HeaderText="Nº Territorio" SortExpression="Territorio_Nro">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Territorio_ID" HeaderText="ID Territorio" SortExpression="Territorio_ID">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Territorio_Descrip" HeaderText="Descrip. Territorio" SortExpression="Territorio_Descrip" />
                        <asp:BoundField DataField="Vendedor" HeaderText="Vendedor" SortExpression="Vendedor">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sesion_Key_RTS" HeaderText="ID Sesión" SortExpression="Sesion_Key_RTS">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Territorio_Key_RTS" HeaderText="Clave TP (Terr)" ReadOnly="True" SortExpression="Territorio_Key_RTS">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
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
            </asp:View>
        </asp:MultiView>
    </p>
    <p>
        <asp:SqlDataSource ID="GesDBSesiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Sesion_Key_RTS], [Region_ID], [Tipo], [Descripcion], [Escenario], [Fecha_Creacion], [Fecha_Vigencia], [Fecha_Expiracion], [Fecha_Catalogacion], [Usuario_Catalogacion], [Fecha_Modificacion], [Usuario_Modificacion] FROM [Sesiones]" UpdateCommand="UPDATE [Sesiones] SET [Region_ID] = @Region_ID, [Tipo] = @Tipo, [Descripcion] = @Descripcion, [Escenario] = @Escenario, [Fecha_Creacion] = @Fecha_Creacion, [Fecha_Vigencia] = @Fecha_Vigencia, [Fecha_Expiracion] = @Fecha_Expiracion, [Fecha_Catalogacion] = @Fecha_Catalogacion, [Usuario_Catalogacion] = @Usuario_Catalogacion, [Fecha_Modificacion] = @Fecha_Modificacion, [Usuario_Modificacion] = @Usuario_Modificacion WHERE [Sesion_Key_RTS] = @Sesion_Key_RTS">
            <UpdateParameters>
                <asp:Parameter Name="Region_ID" Type="String" />
                <asp:Parameter Name="Tipo" Type="Int32" />
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="Escenario" Type="String" />
                <asp:Parameter Name="Fecha_Creacion" Type="DateTime" />
                <asp:Parameter Name="Fecha_Vigencia" Type="DateTime" />
                <asp:Parameter Name="Fecha_Expiracion" Type="DateTime" />
                <asp:Parameter Name="Fecha_Catalogacion" Type="DateTime" />
                <asp:Parameter Name="Usuario_Catalogacion" Type="String" />
                <asp:Parameter Name="Fecha_Modificacion" Type="DateTime" />
                <asp:Parameter Name="Usuario_Modificacion" Type="String" />
                <asp:Parameter Name="Sesion_Key_RTS" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="GesDBTerritorios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Territorios] WHERE [Territorio_Key_RTS] = @Territorio_Key_RTS" InsertCommand="INSERT INTO [Territorios] ([Territorio_Key_RTS], [Sesion_Key_RTS], [Territorio_Nro], [Territorio_ID], [Territorio_Descrip], [Vendedor]) VALUES (@Territorio_Key_RTS, @Sesion_Key_RTS, @Territorio_Nro, @Territorio_ID, @Territorio_Descrip, @Vendedor)" SelectCommand="SELECT * FROM [Territorios]
WHERE Sesion_Key_RTS = @Sesion_Key_RTS" UpdateCommand="UPDATE [Territorios] SET [Sesion_Key_RTS] = @Sesion_Key_RTS, [Territorio_Nro] = @Territorio_Nro, [Territorio_ID] = @Territorio_ID, [Territorio_Descrip] = @Territorio_Descrip, [Vendedor] = @Vendedor WHERE [Territorio_Key_RTS] = @Territorio_Key_RTS">
            <DeleteParameters>
                <asp:Parameter Name="Territorio_Key_RTS" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Territorio_Key_RTS" Type="Int32" />
                <asp:Parameter Name="Sesion_Key_RTS" Type="Int32" />
                <asp:Parameter Name="Territorio_Nro" Type="Int32" />
                <asp:Parameter Name="Territorio_ID" Type="String" />
                <asp:Parameter Name="Territorio_Descrip" Type="String" />
                <asp:Parameter Name="Vendedor" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="Sesion_Key_RTS" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Sesion_Key_RTS" Type="Int32" />
                <asp:Parameter Name="Territorio_Nro" Type="Int32" />
                <asp:Parameter Name="Territorio_ID" Type="String" />
                <asp:Parameter Name="Territorio_Descrip" Type="String" />
                <asp:Parameter Name="Vendedor" Type="String" />
                <asp:Parameter Name="Territorio_Key_RTS" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
