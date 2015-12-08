<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cataloga.aspx.cs" Inherits="BitOp.Sesiones.Catalo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .auto-style12 {
            width: 304px;
        }
        .auto-style11 {
            color: #000000;
        }
        .auto-style14 {
            width: 72px;
            height: 23px;
        }
        .auto-style15 {
            height: 23px;
            width: 194px;
        }
        .auto-style20 {
            width: 30px;
            height: 23px;
        }
        .auto-style18 {
            height: 23px;
            width: 127px;
        }
        .auto-style22 {
            height: 23px;
            width: 503px;
        }
        .auto-style17 {
            width: 72px;
        }
        .auto-style16 {
            width: 194px;
        }
        .auto-style21 {
            width: 30px;
        }
        .auto-style19 {
            width: 91px;
        }
        .auto-style23 {
            width: 503px;
        }
        .auto-style25 {
            width: 152px;
        }
        .auto-style27 {
            width: 100px;
        }
        .auto-style32 {
        }
        .auto-style33 {
            width: 111px;
        }
        .auto-style34 {
            width: 144px;
        }
        .auto-style39 {
            width: 21px;
        }
        .auto-style40 {
            width: 81px;
        }
        .auto-style41 {
            width: 132px;
        }
        .auto-style42 {
            width: 210px;
        }
        .auto-style43 {
            width: 127px;
        }
        .auto-style44 {
        }
        .auto-style45 {
            width: 31px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
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
                            <asp:SqlDataSource ID="GesDBCriterios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT '- Seleccione Criterio -' AS Criterio_ID, ' ' AS Fecha_Desde, ' ' AS Inicio_Nombre, ' ' AS Region,
              ' ' AS Supervisor, ' ' AS Estado
UNION 
SELECT [Criterio_ID], [Fecha_Desde], [Inicio_Nombre], [Region], [Supervisor], [Estado] 
  FROM [Criterios]
WHERE [Estado] = 'Activo'
ORDER BY [Criterio_ID]"></asp:SqlDataSource>
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
                        <td class="auto-style22">
                            <asp:Label ID="Lbl_Fecha_Aux" runat="server" Text="Lbl_Fecha_Aux" Visible="False"></asp:Label>
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
                        <td class="auto-style43">Inicio Descrip.: </td>
                        <td class="auto-style23">
                            <asp:Label ID="Lbl_Inicio_Descrip" runat="server" Text="Lbl_Inicio_Descrip"></asp:Label>
                        </td>
                        <td class="auto-style23">&nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PKEY" DataSourceID="GesDBSesionesTP" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="95%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Select" ImageUrl="~/Images/Select.png" OnClick="ImageButton1_Click" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
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
                        <asp:BoundField DataField="Cant_Territorios" HeaderText="Cant.Territorios" SortExpression="Cant_Territorios">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SCENARIO" HeaderText="Escenario" SortExpression="SCENARIO" />
                        <asp:TemplateField HeaderText="Fecha Creación" SortExpression="SESSION_DATE">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SESSION_DATE") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("SESSION_DATE", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="USER_MODIFIED" HeaderText="Usuario Modifica" SortExpression="USER_MODIFIED" />
                        <asp:TemplateField HeaderText="Fecha Modifica" SortExpression="DATE_MODIFIED">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DATE_MODIFIED") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("DATE_MODIFIED", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Catalogada" HeaderText="Catalogada" SortExpression="Catalogada">
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
                <br />
                <table style="width:100%;">
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="Cataloga_Button" runat="server" style="margin-left: 467px" Text="Cataloga Sesión" OnClick="Cataloga_Button_Click" Visible="False" BackColor="#CCFFFF" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:SqlDataSource ID="GesDBSesionesTP" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [PKEY], [REGION_ID], [DESCRIPTION],
              Cant_Territorios = (SELECT COUNT(*) FROM V_TerritoriosTP
                                                 WHERE V_TerritoriosTP.RN_SESSION_PKEY = V_SesionesTP.PKEY
                                                      AND V_TerritoriosTP.TERRITORY_NUMBER &lt;&gt; 0),
              [SCENARIO], [SESSION_DATE], [USER_MODIFIED], [DATE_MODIFIED],
              Catalogada =
                  CASE (SELECT COUNT(*) FROM Sesiones WHERE Sesion_Key_RTS = PKEY)
                       WHEN 0   THEN '  '
                       ELSE          'si'
                   END
  FROM [V_SesionesTP]
WHERE [REGION_ID]          =  @Region_ID
    AND [TYPE]                     =  1
    AND [DESCRIPTION]  LIKE (@Inicio_Descrip + '%')
    AND CAST([DATE_MODIFIED] AS DATE) &gt;= CAST(@Fecha_Desde AS DATE)
ORDER BY [DATE_MODIFIED] DESC
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Region" Name="Region_ID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Inicio_Descrip" Name="Inicio_Descrip" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Fecha_Aux" Name="Fecha_Desde" PropertyName="Text" DefaultValue="01-01-2014" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Ses_Key_RTS" DataSourceID="GesDBSesion_TempFV" DefaultMode="Edit" >
                    <EditItemTemplate>
                        <table style="width: 95%;">
                            <tr>
                                <td class="auto-style33">Sesión: </td>
                                <td class="auto-style25">
                                    <asp:Label ID="Ses_Key_RTSLabel1" runat="server" Text='<%# Eval("Ses_Key_RTS") %>' BackColor="#009900" Width="60px" Font-Bold="True" ForeColor="#FFFF99" style="text-align: center" />
                                </td>
                                <td class="auto-style39">&nbsp;</td>
                                <td class="auto-style27">Fecha Creación:</td>
                                <td class="auto-style34">
                                    <asp:TextBox ID="Fec_CreacionTextBox" runat="server" BackColor="#CCCCCC" ReadOnly="True" Text='<%# Bind("Fec_Creacion", "{0:d}") %>' TextMode="Date" Width="70px" />
                                </td>
                                <td class="auto-style45">&nbsp;</td>
                                <td class="auto-style44">Región:</td>
                                <td class="auto-style40">
                                    <asp:TextBox ID="Reg_IDTextBox" runat="server" BackColor="#CCCCCC" ReadOnly="True" Text='<%# Bind("Reg_ID") %>' Width="90px" />
                                </td>
                                <td class="auto-style41">
                                    <asp:TextBox ID="TipTextBox" runat="server" ReadOnly="True" Text='<%# Bind("Tip") %>' Visible="False" Width="20px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style33">Descripción: </td>
                                <td class="auto-style25">
                                    <asp:TextBox ID="DescrTextBox" runat="server" BackColor="#CCCCCC" ReadOnly="True" Text='<%# Bind("Descr") %>' Width="250px" />
                                </td>
                                <td class="auto-style39">&nbsp;</td>
                                <td class="auto-style27">Escenario:</td>
                                <td class="auto-style34">
                                    <asp:TextBox ID="EscTextBox" runat="server" BackColor="#CCCCCC" ReadOnly="True" Text='<%# Bind("Esc") %>' Width="180px" />
                                </td>
                                <td class="auto-style45">&nbsp;</td>
                                <td class="auto-style44" colspan="3">
                                    <asp:RangeValidator ID="Valida_Fec_Vigencia" runat="server" ControlToValidate="Fec_VigenciaTextBox" ErrorMessage="Fecha Vigencia Inválida" Font-Bold="True" ForeColor="Red" MaximumValue="31-12-2025" MinimumValue="01-01-2015" Width="180px"></asp:RangeValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style33">Usuario Modifica: </td>
                                <td class="auto-style25">
                                    <asp:TextBox ID="Usua_ModificacionTextBox" runat="server" BackColor="#CCCCCC" ReadOnly="True" Text='<%# Bind("Usua_Modificacion") %>' Width="200px" />
                                </td>
                                <td class="auto-style39">&nbsp;</td>
                                <td class="auto-style27">Fecha Modifica:</td>
                                <td class="auto-style34">
                                    <asp:TextBox ID="Fec_ModificacionTextBox" runat="server" BackColor="#CCCCCC" ReadOnly="True" Text='<%# Bind("Fec_Modificacion", "{0:d}") %>' TextMode="Date" Width="70px" />
                                </td>
                                <td class="auto-style45">&nbsp;</td>
                                <td class="auto-style44">Vigencia Desde:</td>
                                <td class="auto-style40">
                                    <asp:TextBox ID="Fec_VigenciaTextBox" runat="server" Text='<%# Bind("Fec_Vigencia", "{0:d}") %>' Width="70px" MaxLength="10" TextMode="Date" />
                                </td>
                                <td class="auto-style41" style="color: #FF0000">dd-mm-aaaa</td>
                            </tr>
                            <tr>
                                <td class="auto-style33">Usuario Cataloga: </td>
                                <td class="auto-style25">
                                    <asp:TextBox ID="Usua_CatalogacionTextBox" runat="server" BackColor="#CCCCCC" ReadOnly="True" Text='<%# Bind("Usua_Catalogacion") %>' Width="200px" />
                                </td>
                                <td class="auto-style39">&nbsp;</td>
                                <td class="auto-style27">Fecha Cataloga:</td>
                                <td class="auto-style34">
                                    <asp:TextBox ID="Fec_CatalogacionTextBox" runat="server" BackColor="#CCCCCC" ReadOnly="True" Text='<%# Bind("Fec_Catalogacion", "{0:d}") %>' TextMode="Date" Width="70px" />
                                </td>
                                <td class="auto-style45">&nbsp;</td>
                                <td class="auto-style44">Fecha Expiración:</td>
                                <td class="auto-style40">
                                    <asp:TextBox ID="Fec_ExpiracionTextBox" runat="server" Text='<%# Bind("Fec_Expiracion", "{0:d}") %>' Width="70px" MaxLength="10" TextMode="Date" />
                                </td>
                                <td class="auto-style41" style="color: #FF0000">dd-mm-aaaa</td>
                            </tr>
                            <tr>
                                <td class="auto-style33">&nbsp;</td>
                                <td class="auto-style25">&nbsp;</td>
                                <td class="auto-style39">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td class="auto-style34">
                                    &nbsp;</td>
                                <td class="auto-style45">&nbsp;</td>
                                <td class="auto-style32" colspan="2">
                                    <asp:RangeValidator ID="Valida_Fec_Expira" runat="server" ControlToValidate="Fec_ExpiracionTextBox" ErrorMessage="Fecha Expiración Inválida" Font-Bold="True" ForeColor="Red" MaximumValue="31-12-2025" MinimumValue="01-01-2015" Width="180px"></asp:RangeValidator>
                                </td>
                                <td class="auto-style41" style="color: #FF0000">&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" OnClick="UpdateButton_Click" OnClientClick="return confirm('¿Está seguro de catalogar esta sesión?'); " Text="Catalogar" Font-Bold="True" Width="65px"></asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" OnClick="UpdateCancelButton_Click" Font-Bold="True" ForeColor="#CC3300" />
                        <br />
                        <br />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Ses_Key_RTS:
                        <asp:TextBox ID="Ses_Key_RTSTextBox" runat="server" Text='<%# Bind("Ses_Key_RTS") %>' />
                        <br />
                        Reg_ID:
                        <asp:TextBox ID="Reg_IDTextBox" runat="server" Text='<%# Bind("Reg_ID") %>' />
                        <br />
                        Tip:
                        <asp:TextBox ID="TipTextBox" runat="server" Text='<%# Bind("Tip") %>' />
                        <br />
                        Descr:
                        <asp:TextBox ID="DescrTextBox" runat="server" Text='<%# Bind("Descr") %>' />
                        <br />
                        Esc:
                        <asp:TextBox ID="EscTextBox" runat="server" Text='<%# Bind("Esc") %>' />
                        <br />
                        Fec_Creacion:
                        <asp:TextBox ID="Fec_CreacionTextBox" runat="server" Text='<%# Bind("Fec_Creacion") %>' />
                        <br />
                        Fec_Vigencia:
                        <asp:TextBox ID="Fec_VigenciaTextBox" runat="server" Text='<%# Bind("Fec_Vigencia") %>' />
                        <br />
                        Fec_Expiracion:
                        <asp:TextBox ID="Fec_ExpiracionTextBox" runat="server" Text='<%# Bind("Fec_Expiracion") %>' />
                        <br />
                        Usua_Modificacion:
                        <asp:TextBox ID="Usua_ModificacionTextBox" runat="server" Text='<%# Bind("Usua_Modificacion") %>' />
                        <br />
                        Fec_Modificacion:
                        <asp:TextBox ID="Fec_ModificacionTextBox" runat="server" Text='<%# Bind("Fec_Modificacion") %>' />
                        <br />
                        Usua_Catalogacion:
                        <asp:TextBox ID="Usua_CatalogacionTextBox" runat="server" Text='<%# Bind("Usua_Catalogacion") %>' />
                        <br />
                        Fec_Catalogacion:
                        <asp:TextBox ID="Fec_CatalogacionTextBox" runat="server" Text='<%# Bind("Fec_Catalogacion") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Ses_Key_RTS:
                        <asp:Label ID="Ses_Key_RTSLabel" runat="server" Text='<%# Eval("Ses_Key_RTS") %>' />
                        <br />
                        Reg_ID:
                        <asp:Label ID="Reg_IDLabel" runat="server" Text='<%# Bind("Reg_ID") %>' />
                        <br />
                        Tip:
                        <asp:Label ID="TipLabel" runat="server" Text='<%# Bind("Tip") %>' />
                        <br />
                        Descr:
                        <asp:Label ID="DescrLabel" runat="server" Text='<%# Bind("Descr") %>' />
                        <br />
                        Esc:
                        <asp:Label ID="EscLabel" runat="server" Text='<%# Bind("Esc") %>' />
                        <br />
                        Fec_Creacion:
                        <asp:Label ID="Fec_CreacionLabel" runat="server" Text='<%# Bind("Fec_Creacion") %>' />
                        <br />
                        Fec_Vigencia:
                        <asp:Label ID="Fec_VigenciaLabel" runat="server" Text='<%# Bind("Fec_Vigencia") %>' />
                        <br />
                        Fec_Expiracion:
                        <asp:Label ID="Fec_ExpiracionLabel" runat="server" Text='<%# Bind("Fec_Expiracion") %>' />
                        <br />
                        Usua_Modificacion:
                        <asp:Label ID="Usua_ModificacionLabel" runat="server" Text='<%# Bind("Usua_Modificacion") %>' />
                        <br />
                        Fec_Modificacion:
                        <asp:Label ID="Fec_ModificacionLabel" runat="server" Text='<%# Bind("Fec_Modificacion") %>' />
                        <br />
                        Usua_Catalogacion:
                        <asp:Label ID="Usua_CatalogacionLabel" runat="server" Text='<%# Bind("Usua_Catalogacion") %>' />
                        <br />
                        Fec_Catalogacion:
                        <asp:Label ID="Fec_CatalogacionLabel" runat="server" Text='<%# Bind("Fec_Catalogacion") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                    </ItemTemplate>
                </asp:FormView>
                <table style="width:100%;">
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style42">
                        </td>
                        <td>
                            <asp:Button ID="Confirma_Button" runat="server" OnClick="Confirma_Button_Click" OnClientClick="return confirm('Sesión ya catalogada...  ¿Desea catalogarla nuevamente?'); " Text="Sesión ya catalogada.  Favor Confirme." Visible="False" BackColor="#CCFFCC" Height="26px" Width="288px" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:SqlDataSource ID="GesDBSesion_TempFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Ses_Key_RTS], [Reg_ID], [Tip], [Descr], [Esc], [Fec_Creacion], [Fec_Vigencia], [Fec_Expiracion],
              [Usua_Modificacion], [Fec_Modificacion], [Usua_Catalogacion], [Fec_Catalogacion]
 FROM [Sesion_Temp]
WHERE [Ses_Key_RTS] = @Ses_Key_RTS" UpdateCommand="UPDATE [Sesion_Temp]
         SET [Reg_ID] = @Reg_ID, [Tip] = @Tip, [Descr] = @Descr, [Esc] = @Esc,
                [Fec_Creacion] = @Fec_Creacion, [Fec_Vigencia] = @Fec_Vigencia, [Fec_Expiracion] = @Fec_Expiracion,
                [Usua_Modificacion] = @Usua_Modificacion, [Fec_Modificacion] = @Fec_Modificacion,
                [Usua_Catalogacion] = @Usua_Catalogacion, [Fec_Catalogacion] = @Fec_Catalogacion
 WHERE [Ses_Key_RTS] = @Ses_Key_RTS">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Sesion" Name="Ses_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Reg_ID" Type="String" />
                        <asp:Parameter Name="Tip" Type="Int32" />
                        <asp:Parameter Name="Descr" Type="String" />
                        <asp:Parameter Name="Esc" Type="String" />
                        <asp:Parameter Name="Fec_Creacion" Type="DateTime" />
                        <asp:Parameter Name="Fec_Vigencia" Type="DateTime" />
                        <asp:Parameter Name="Fec_Expiracion" Type="DateTime" />
                        <asp:Parameter Name="Usua_Modificacion" Type="String" />
                        <asp:Parameter Name="Fec_Modificacion" Type="DateTime" />
                        <asp:Parameter Name="Usua_Catalogacion" Type="String" />
                        <asp:Parameter Name="Fec_Catalogacion" Type="DateTime" />
                        <asp:Parameter Name="Ses_Key_RTS" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Terr_Key_RTS" DataSourceID="GesDBTerritorios_Temp" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" PageSize="7" Width="90%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/Cancel(build)_194_32.bmp" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nº Territorio" SortExpression="Terr_Nro">
                            <EditItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Terr_Nro") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Terr_Nro") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID Territorio" SortExpression="Terr_ID">
                            <EditItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Terr_ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Terr_ID") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripción" SortExpression="Terr_Descrip">
                            <EditItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Terr_Descrip") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Terr_Descrip") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Vendedor" SortExpression="Vend">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="GesDBVendedores" DataTextField="Vendedor_Nombre" DataValueField="Vendedor_ID" SelectedValue='<%# Bind("Vend") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Vend") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Clave TP (Sesión)" SortExpression="Ses_Key_RTS">
                            <EditItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Ses_Key_RTS") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Ses_Key_RTS") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Terr_Key_RTS" HeaderText="Clave TP (Terr)" ReadOnly="True" SortExpression="Terr_Key_RTS">
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
                <br />
                <asp:SqlDataSource ID="GesDBTerritorios_Temp" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Terr_Key_RTS], [Ses_Key_RTS], [Terr_Nro], [Terr_ID], [Terr_Descrip], [Vend]
  FROM [Territorio_Temp]
WHERE [Ses_Key_RTS] = @Sesion_Key_RTS" UpdateCommand="UPDATE [Territorio_Temp] SET [Ses_Key_RTS] = @Ses_Key_RTS, [Terr_Nro] = @Terr_Nro, [Terr_ID] = @Terr_ID, [Terr_Descrip] = @Terr_Descrip, [Vend] = @Vend WHERE [Terr_Key_RTS] = @Terr_Key_RTS">
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
                <br />
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
