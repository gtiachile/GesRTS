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
            width: 503px;
        }
        .auto-style23 {
            width: 503px;
        }
        .auto-style24 {
            width: 638px;
        }
        .auto-style28 {
            width: 71px;
        }
        .auto-style29 {
            width: 162px;
        }
        .auto-style30 {
            width: 36px;
        }
        .auto-style31 {
            width: 153px;
        }
        .auto-style32 {
            width: 117px;
        }
        .auto-style34 {
            width: 105px;
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
                            <asp:Label ID="Lbl_Region" runat="server" Text="Lbl_Region"></asp:Label>
                        </td>
                        <td class="auto-style20">&nbsp;</td>
                        <td class="auto-style18">Supervisor:</td>
                        <td class="auto-style22">
                            <asp:Label ID="Lbl_Supervisor" runat="server" Text="Lbl_Supervisor"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17">F.Desde:</td>
                        <td class="auto-style16">
                            <asp:Label ID="Lbl_Fecha_Desde" runat="server" Text="Lbl_Fecha_Desde"></asp:Label>
                        </td>
                        <td class="auto-style21">
                            <asp:Label ID="Lbl_Sesion" runat="server" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style19">Inicio Descrip.: </td>
                        <td class="auto-style23">
                            <asp:Label ID="Lbl_Inicio_Descrip" runat="server" Text="Lbl_Inicio_Descrip"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PKEY" DataSourceID="GesDBSesionesTP" ForeColor="#333333" GridLines="None" Width="90%" PageSize="8" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" OnClick="Button1_Click" Text="Sel" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID Sesión" SortExpression="PKEY">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("PKEY") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("PKEY") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
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
                        <td class="auto-style24">
                            <asp:SqlDataSource ID="GesDBSesionesTP" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [PKEY], [REGION_ID], [TYPE], [DESCRIPTION], [SCENARIO], [SESSION_DATE], [USER_MODIFIED],
              [DATE_MODIFIED]
  FROM [V_SesionesTP]
WHERE [REGION_ID]           =     @Region_ID
    AND CAST([DATE_MODIFIED] AS DATE)  &gt;=  CAST(@Fecha_Desde AS DATE)
    AND [DESCRIPTION]      LIKE (@Inicio_Descrip + '%')
ORDER BY [PKEY]"><SelectParameters>
                                    <asp:ControlParameter ControlID="Lbl_Region" Name="Region_ID" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="Lbl_Fecha_Desde" Name="Fecha_Desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="Lbl_Inicio_Descrip" Name="Inicio_Descrip" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:Button ID="CatalogaSesion0" runat="server" CssClass="bold" Height="42px" OnClick="CatalogaSesion_Click" Text="Cataloga Sesión" Width="118px" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="PKEY" DataSourceID="GesDBSesiones" DefaultMode="Edit" Width="972px">
                    <EditItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style32">Sesión: </td>
                                <td class="auto-style29">
                                    <asp:Label ID="PKEYLabel1" runat="server" Text='<%# Eval("PKEY") %>' />
                                </td>
                                <td class="auto-style30">
                                    <asp:TextBox ID="TYPETextBox" runat="server" Height="22px" ReadOnly="True" Text='<%# Bind("TYPE") %>' Visible="False" Width="20px" />
                                </td>
                                <td class="auto-style28">F. Creación: </td>
                                <td class="auto-style31">
                                    <asp:TextBox ID="SESSION_DATETextBox" runat="server" BackColor="#CCCCCC" Height="22px" ReadOnly="True" Text='<%# Bind("SESSION_DATE", "{0:d}") %>' Width="100px" />
                                </td>
                                <td class="auto-style30">&nbsp;</td>
                                <td class="auto-style34">Región:</td>
                                <td>
                                    <asp:TextBox ID="REGION_IDTextBox" runat="server" BackColor="#CCCCCC" Height="22px" ReadOnly="True" Text='<%# Bind("REGION_ID") %>' Width="150px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style32">Descrip. Sesión: </td>
                                <td class="auto-style29">
                                    <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" BackColor="#CCCCCC" Height="22px" ReadOnly="True" Text='<%# Bind("DESCRIPTION") %>' Width="200px" />
                                </td>
                                <td class="auto-style30">&nbsp;</td>
                                <td class="auto-style28">Escenario: </td>
                                <td class="auto-style31">
                                    <asp:TextBox ID="SCENARIOTextBox" runat="server" BackColor="#CCCCCC" Height="22px" ReadOnly="True" Text='<%# Bind("SCENARIO") %>' Width="150px" />
                                </td>
                                <td class="auto-style30">&nbsp;</td>
                                <td class="auto-style34">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style32">Usuario Modifica: </td>
                                <td class="auto-style29">
                                    <asp:TextBox ID="USER_MODIFIEDTextBox" runat="server" BackColor="#CCCCCC" Height="22px" ReadOnly="True" Text='<%# Bind("USER_MODIFIED") %>' Width="100px" />
                                </td>
                                <td class="auto-style30">&nbsp;</td>
                                <td class="auto-style28">F.Modifica: </td>
                                <td class="auto-style31">
                                    <asp:TextBox ID="DATE_MODIFIEDTextBox" runat="server" BackColor="#CCCCCC" Height="22px" ReadOnly="True" Text='<%# Bind("DATE_MODIFIED", "{0:d}") %>' Width="100px" />
                                </td>
                                <td class="auto-style30">&nbsp;</td>
                                <td class="auto-style34">Vigencia Desde: </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style32">Usuario cataloga:</td>
                                <td class="auto-style29">&nbsp;</td>
                                <td class="auto-style30">&nbsp;</td>
                                <td class="auto-style28">F.Cataloga: </td>
                                <td class="auto-style31">&nbsp;</td>
                                <td class="auto-style30">&nbsp;</td>
                                <td class="auto-style34">Expiración: </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" OnClick="UpdateButton_Click1" Text="Actualizar" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="UpdateCancelButton_Click1" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        PKEY:
                        <asp:TextBox ID="PKEYTextBox" runat="server" Text='<%# Bind("PKEY") %>' />
                        <br />
                        REGION_ID:
                        <asp:TextBox ID="REGION_IDTextBox" runat="server" Text='<%# Bind("REGION_ID") %>' />
                        <br />
                        TYPE:
                        <asp:TextBox ID="TYPETextBox" runat="server" Text='<%# Bind("TYPE") %>' />
                        <br />
                        DESCRIPTION:
                        <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' />
                        <br />
                        SCENARIO:
                        <asp:TextBox ID="SCENARIOTextBox" runat="server" Text='<%# Bind("SCENARIO") %>' />
                        <br />
                        SESSION_DATE:
                        <asp:TextBox ID="SESSION_DATETextBox" runat="server" Text='<%# Bind("SESSION_DATE") %>' />
                        <br />
                        USER_MODIFIED:
                        <asp:TextBox ID="USER_MODIFIEDTextBox" runat="server" Text='<%# Bind("USER_MODIFIED") %>' />
                        <br />
                        DATE_MODIFIED:
                        <asp:TextBox ID="DATE_MODIFIEDTextBox" runat="server" Text='<%# Bind("DATE_MODIFIED") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        PKEY:
                        <asp:Label ID="PKEYLabel" runat="server" Text='<%# Eval("PKEY") %>' />
                        <br />
                        REGION_ID:
                        <asp:Label ID="REGION_IDLabel" runat="server" Text='<%# Bind("REGION_ID") %>' />
                        <br />
                        TYPE:
                        <asp:Label ID="TYPELabel" runat="server" Text='<%# Bind("TYPE") %>' />
                        <br />
                        DESCRIPTION:
                        <asp:Label ID="DESCRIPTIONLabel" runat="server" Text='<%# Bind("DESCRIPTION") %>' />
                        <br />
                        SCENARIO:
                        <asp:Label ID="SCENARIOLabel" runat="server" Text='<%# Bind("SCENARIO") %>' />
                        <br />
                        SESSION_DATE:
                        <asp:Label ID="SESSION_DATELabel" runat="server" Text='<%# Bind("SESSION_DATE") %>' />
                        <br />
                        USER_MODIFIED:
                        <asp:Label ID="USER_MODIFIEDLabel" runat="server" Text='<%# Bind("USER_MODIFIED") %>' />
                        <br />
                        DATE_MODIFIED:
                        <asp:Label ID="DATE_MODIFIEDLabel" runat="server" Text='<%# Bind("DATE_MODIFIED") %>' />
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                <br />
            </asp:View>
        </asp:MultiView>
    </p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Terr_Key_RTS" DataSourceID="GesDBTerritorios" ForeColor="#333333" GridLines="None" PageSize="8" Width="90%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Actualizar" />
                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/Cancel(build)_194_32.bmp" Text="Cancelar" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Editar" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nº Territorio" SortExpression="Terr_Nro">
                    <EditItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Terr_Nro") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Terr_Nro") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID Territorio" SortExpression="Terr_ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Terr_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Terr_ID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descripción Territorio" SortExpression="Terr_Descrip">
                    <EditItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Terr_Descrip") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Terr_Descrip") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Vendedor" SortExpression="Vend">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="GesDBVendedores" DataTextField="Vendedor_Nombre" DataValueField="Vendedor_ID" SelectedValue='<%# Bind("Vend") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Vend") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Clave TP (Sesión)" SortExpression="Ses_Key_RTS">
                    <EditItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Ses_Key_RTS") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Ses_Key_RTS") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Clave TP (Terr)" SortExpression="Terr_Key_RTS">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Terr_Key_RTS") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Terr_Key_RTS") %>'></asp:Label>
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
    </p>
    <p>
        <asp:SqlDataSource ID="GesDBSesiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [PKEY], [REGION_ID], [TYPE], [DESCRIPTION], [SCENARIO], [SESSION_DATE], [USER_MODIFIED],
              [DATE_MODIFIED]
 FROM [V_SesionesTP]
WHERE [PKEY] = @Sesion_Key_RTS">
            <SelectParameters>
                <asp:ControlParameter ControlID="Lbl_Sesion" Name="Sesion_Key_RTS" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="GesDBTerritorios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Terr_Key_RTS], [Ses_Key_RTS], [Terr_Nro], [Terr_ID], [Terr_Descrip], [Vend]
  FROM [Territorio_Temp]
WHERE  [Ses_Key_RTS] = @Sesion_Key_RTS" UpdateCommand="UPDATE [Territorio_Temp]
        SET [Ses_Key_RTS] = @Ses_Key_RTS, [Terr_Nro] = @Terr_Nro, [Terr_ID] = @Terr_ID,
               [Terr_Descrip] = @Terr_Descrip, [Vend] = @Vend
 WHERE [Terr_Key_RTS] = @Terr_Key_RTS">
            <SelectParameters>
                <asp:ControlParameter ControlID="Lbl_Sesion" Name="Sesion_Key_RTS" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ses_Key_RTS" Type="Int32" />
                <asp:Parameter Name="Terr_Nro" Type="Int32" />
                <asp:Parameter Name="Terr_ID" Type="String" />
                <asp:Parameter Name="Terr_Descrip" Type="String" />
                <asp:Parameter Name="Vend" Type="String" />
                <asp:Parameter Name="Terr_Key_RTS" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="GesDBVendedores" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Vendedor_ID], [Vendedor_Tipo], [Vendedor_Nombre], [Region], [Supervisor], [Estado]
  FROM [Vendedores]
WHERE [Region]                = @Region_ID
     AND [Vendedor_Tipo] = 'Vendedor'
     AND [Estado]                = 'Activo'">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Region" DefaultValue="" Name="Region_ID" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
    </p>
</asp:Content>
