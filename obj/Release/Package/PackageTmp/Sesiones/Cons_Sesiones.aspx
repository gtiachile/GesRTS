<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cons_Sesiones.aspx.cs" Inherits="BitOp.Sesiones.Cataloga" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            color: #000000;
            }
        .auto-style12 {
            width: 54px;
        }
        .auto-style15 {
            width: 30px;
        }
        .auto-style17 {
            color: #000000;
            font-size: medium;
        }
        .auto-style75 {
            width: 77px;
        }
        .auto-style78 {
            width: 271px;
        }
        .auto-style79 {
            width: 64px;
        }
        .auto-style82 {
            width: 266px;
        }
        .auto-style83 {
            width: 166px;
        }
        .auto-style84 {
            width: 150px;
        }
        .auto-style85 {
            width: 145px;
        }
        .auto-style22 {
            width: 499px;
        }
        .auto-style86 {
            width: 225px;
        }
        .auto-style87 {
            width: 465px;
        }
        .auto-style36 {
            width: 62px;
        }
        .auto-style42 {
            width: 154px;
        }
        .auto-style38 {
            width: 85px;
        }
        .auto-style43 {
            width: 153px;
        }
        .auto-style41 {
            width: 30px;
        }
        .auto-style25 {
            width: 516px;
        }
        .auto-style88 {
            text-align: left;
        }
        .auto-style89 {
            width: 148px;
        }
        .auto-style90 {
            width: 78px;
        }
        .auto-style91 {
            width: 83px;
        }
        .auto-style94 {
            width: 31px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style17">
        <strong>CONSULTA SESIONES DE PLANIFICACION</strong></p>
    <p class="auto-style10">
        <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
            <asp:View ID="View3" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style12">Región:</td>
                        <td class="auto-style86">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="200px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT ' ' AS Region_ID, '- Seleccione Región -' AS Region_Txt, ' ' AS Region_RTS
 FROM Regiones
UNION
SELECT Region_ID, (Region_Chile + ' - ' + Descripción) as Region_Txt, Region_RTS
 FROM Regiones
ORDER BY Region_Txt"></asp:SqlDataSource>
                        </td>
                        <td class="auto-style15">&nbsp;</td>
                        <td class="auto-style83">
                            <asp:Label ID="Lbl_Region" runat="server" BackColor="#00CC66" Font-Bold="True" style="text-align: center" Text="Lbl_Región" Visible="False" Width="100px"></asp:Label>
                        </td>
                        <td class="auto-style84">
                            <asp:Label ID="Lbl_Sesion" runat="server" Text="Lbl_Sesion" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style85">
                            <asp:Label ID="Lbl_Ruta" runat="server" Text="Lbl_Ruta" Visible="False"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td class="auto-style86">&nbsp;</td>
                        <td class="auto-style15">&nbsp;</td>
                        <td class="auto-style83">&nbsp;</td>
                        <td class="auto-style84">
                            <asp:Label ID="Lbl_Territorio" runat="server" Text="Lbl_Territorio" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style85">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Sesion_Key_RTS" DataSourceID="GesDBSesiones" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="7">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Territorios_Button" runat="server" CausesValidation="False" CommandName="Select" OnClick="Territorios_Button_Click" Text="Territorios" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" SortExpression="Descripcion" />
                        <asp:BoundField DataField="Escenario" HeaderText="Escenario" SortExpression="Escenario" />
                        <asp:BoundField DataField="Cant_Territorios" HeaderText="Cant. Territorios" SortExpression="Cant_Territorios" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Fecha Creación" SortExpression="Fecha_Creacion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Fecha_Creacion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Fecha_Creacion", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha Vigencia" SortExpression="Fecha_Vigencia">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Fecha_Vigencia") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Fecha_Vigencia", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha Expiración" SortExpression="Fecha_Expiracion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Fecha_Expiracion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Fecha_Expiracion", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Usuario_Modificacion" HeaderText="Usua. Modifica" SortExpression="Usuario_Modificacion" />
                        <asp:TemplateField HeaderText="Fecha Modifica" SortExpression="Fecha_Modificacion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Fecha_Modificacion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Fecha_Modificacion", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Usuario_Catalogacion" HeaderText="Usua. Cataloga" SortExpression="Usuario_Catalogacion" />
                        <asp:TemplateField HeaderText="Fecha Cataloga" SortExpression="Fecha_Catalogacion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Fecha_Catalogacion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Fecha_Catalogacion", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Clave TP (Sesión)" SortExpression="Sesion_Key_RTS">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Sesion_Key_RTS") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>'></asp:Label>
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
                <asp:SqlDataSource ID="GesDBSesiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Sesion_Key_RTS], [Region_ID], [Descripcion], [Escenario], [Fecha_Creacion], [Fecha_Vigencia],
              [Fecha_Expiracion], [Usuario_Modificacion], [Fecha_Modificacion], [Usuario_Catalogacion],
              [Fecha_Catalogacion],
              (SELECT COUNT(TerritorioS.Territorio_Key_RTS) FROM Territorios
               WHERE Territorios.Sesion_Key_RTS = Sesiones.Sesion_Key_RTS) AS Cant_Territorios
FROM [Sesiones]
WHERE [Region_ID] = @Region_ID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="Region_ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
            <asp:View ID="View4" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Sesion_Key_RTS" DataSourceID="GesDBSesionesFV" Width="656px">
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
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
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
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style75">Región: </td>
                                <td class="auto-style78">
                                    <asp:Label ID="Region_IDLabel" runat="server" BackColor="#00CC66" Font-Bold="True" style="text-align: center" Text='<%# Bind("Region_ID") %>' Width="100px" />
                                </td>
                                <td class="auto-style15">&nbsp;</td>
                                <td class="auto-style79">Sesión: </td>
                                <td class="auto-style82">
                                    <asp:Label ID="Sesion_Key_RTSLabel" runat="server" Text='<%# Eval("Sesion_Key_RTS") %>' Width="80px" BackColor="#00CC66" Font-Bold="True" style="text-align: center" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style75">Descripción: </td>
                                <td class="auto-style78">
                                    <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Bind("Descripcion") %>' Width="250px" />
                                </td>
                                <td class="auto-style15">&nbsp;</td>
                                <td class="auto-style79">Escenario:</td>
                                <td class="auto-style82">
                                    <asp:Label ID="EscenarioLabel" runat="server" Text='<%# Bind("Escenario") %>' Width="200px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="GesDBSesionesFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Sesion_Key_RTS], [Region_ID], [Tipo], [Descripcion], [Escenario]
  FROM [Sesiones]
 WHERE [Sesion_Key_RTS]  = @Sesion_Key_RTS">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Sesion" Name="Sesion_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <p>
                    <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Territorio_Key_RTS" DataSourceID="GesDBTerritorios" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView4_SelectedIndexChanged" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Button ID="Rutas_Button" runat="server" CausesValidation="False" CommandName="Select" OnClick="Rutas_Button_Click1" Text="Rutas" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Territorio_ID" HeaderText="ID Territorio" SortExpression="Territorio_ID" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cant_Rutas" HeaderText="Cant. Rutas" ReadOnly="True" SortExpression="Cant_Rutas" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cant_Ubic" HeaderText="Cant. Ubicaciones" SortExpression="Cant_Ubic" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cant_Paradas" HeaderText="Cant. Paradas" ReadOnly="True" SortExpression="Cant_Paradas">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Territorio_Nro" HeaderText="Nº Territorio" SortExpression="Territorio_Nro" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Territorio_Descrip" HeaderText="Descrip. Territorio" SortExpression="Territorio_Descrip" />
                            <asp:BoundField DataField="Vendedor_Nombre" HeaderText="Vendedor" SortExpression="Vendedor_Nombre" />
                            <asp:TemplateField HeaderText="Clave TP (Sesión)" SortExpression="Sesion_Key_RTS">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Clave TP (Terr)" SortExpression="Territorio_Key_RTS">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Territorio_Key_RTS") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Territorio_Key_RTS") %>'></asp:Label>
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
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style22">&nbsp;</td>
                        <td>
                            <asp:Button ID="ButtonVolver" runat="server" OnClick="ButtonVolver_Click" Text="Volver a Sesiones" />
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="GesDBTerritorios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Territorio_Key_RTS, Sesion_Key_RTS, Territorio_Nro, Territorio_ID, Territorio_Descrip,
              isNull(Vendedor_Nombre, ' ') Vendedor_Nombre,
              (SELECT COUNT(Ruta_Key_RTS) FROM Rutas
                WHERE Rutas.Territorio_Key_RTS = Territorios.Territorio_Key_RTS) AS Cant_Rutas,
              (SELECT COUNT(DISTINCT Ubicacion_ID) FROM Paradas
               WHERE Paradas.Territorio_Key_RTS = Territorios.Territorio_Key_RTS) AS Cant_Ubic,
              (SELECT COUNT(Parada_Key_RTS) FROM Paradas
               WHERE Paradas.Territorio_Key_RTS = Territorios.Territorio_Key_RTS) AS Cant_Paradas
  FROM Territorios LEFT OUTER JOIN
              Vendedores ON Vendedor = Vendedor_ID
WHERE cast(Territorios.Sesion_Key_RTS as varchar) = @Sesion_Key_RTS">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Sesion" Name="Sesion_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
            <asp:View ID="View5" runat="server">
                <asp:FormView ID="FormView2" runat="server" DataKeyNames="Territorio_Key_RTS" DataSourceID="GesDBTerritoriosFV" Width="701px">
                    <EditItemTemplate>
                        Territorio_Key_RTS:
                        <asp:Label ID="Territorio_Key_RTSLabel1" runat="server" Text='<%# Eval("Territorio_Key_RTS") %>' />
                        <br />
                        Sesion_Key_RTS:
                        <asp:TextBox ID="Sesion_Key_RTSTextBox1" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' />
                        <br />
                        Territorio_Nro:
                        <asp:TextBox ID="Territorio_NroTextBox" runat="server" Text='<%# Bind("Territorio_Nro") %>' />
                        <br />
                        Territorio_ID:
                        <asp:TextBox ID="Territorio_IDTextBox" runat="server" Text='<%# Bind("Territorio_ID") %>' />
                        <br />
                        Territorio_Descrip:
                        <asp:TextBox ID="Territorio_DescripTextBox" runat="server" Text='<%# Bind("Territorio_Descrip") %>' />
                        <br />
                        Vendedor:
                        <asp:TextBox ID="VendedorTextBox" runat="server" Text='<%# Bind("Vendedor") %>' />
                        <br />
                        Vendedor_Nombre:
                        <asp:TextBox ID="Vendedor_NombreTextBox" runat="server" Text='<%# Bind("Vendedor_Nombre") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton0" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Territorio_Key_RTS:
                        <asp:TextBox ID="Territorio_Key_RTSTextBox" runat="server" Text='<%# Bind("Territorio_Key_RTS") %>' />
                        <br />
                        Sesion_Key_RTS:
                        <asp:TextBox ID="Sesion_Key_RTSTextBox0" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' />
                        <br />
                        Territorio_Nro:
                        <asp:TextBox ID="Territorio_NroTextBox0" runat="server" Text='<%# Bind("Territorio_Nro") %>' />
                        <br />
                        Territorio_ID:
                        <asp:TextBox ID="Territorio_IDTextBox0" runat="server" Text='<%# Bind("Territorio_ID") %>' />
                        <br />
                        Territorio_Descrip:
                        <asp:TextBox ID="Territorio_DescripTextBox0" runat="server" Text='<%# Bind("Territorio_Descrip") %>' />
                        <br />
                        Vendedor:
                        <asp:TextBox ID="VendedorTextBox0" runat="server" Text='<%# Bind("Vendedor") %>' />
                        <br />
                        Vendedor_Nombre:
                        <asp:TextBox ID="Vendedor_NombreTextBox0" runat="server" Text='<%# Bind("Vendedor_Nombre") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton0" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton0" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style90">Sesión:</td>
                                <td class="auto-style89">
                                    <asp:Label ID="Sesion_Key_RTSLabel2" runat="server" BackColor="#00CC66" Font-Bold="True" style="text-align: center" Text='<%# Bind("Sesion_Key_RTS") %>' Width="80px" />
                                </td>
                                <td class="auto-style15">&nbsp;</td>
                                <td class="auto-style91">Nº Territorio:&nbsp; </td>
                                <td class="auto-style88">
                                    <asp:Label ID="Territorio_NroLabel" runat="server" Text='<%# Bind("Territorio_Nro") %>' BackColor="#00CC66" Font-Bold="True" style="text-align: center" Width="80px" />
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style90">ID Territorio: </td>
                                <td class="auto-style89">
                                    <asp:Label ID="Territorio_IDLabel" runat="server" Text='<%# Bind("Territorio_ID") %>' Font-Bold="True" style="text-align: left" Width="80px" />
                                </td>
                                <td class="auto-style15">&nbsp;</td>
                                <td class="auto-style91">Vendedor:</td>
                                <td class="auto-style88">
                                    <asp:Label ID="Vendedor_NombreLabel" runat="server" Text='<%# Bind("Vendedor_Nombre") %>' Width="300px" />
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="GesDBTerritoriosFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Territorio_Key_RTS], [Sesion_Key_RTS], [Territorio_Nro], [Territorio_ID], [Territorio_Descrip],
               [Vendedor], [Vendedor_Nombre]
  FROM [Territorios] INNER JOIN
              [Vendedores] ON [Vendedor] = [Vendedor_ID]
WHERE cast(Sesion_Key_RTS as nvarchar) = @Nro_Sesion
    AND cast(Territorio_Key_RTS as nvarchar) = @ID_Territorio">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Sesion" Name="Nro_Sesion" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Territorio" Name="ID_Territorio" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Ruta_Key_RTS" DataSourceID="GesDBRutas" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" ShowHeaderWhenEmpty="True" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Paradas_Button" runat="server" CausesValidation="False" CommandName="Select" OnClick="Paradas_Button_Click" Text="Paradas" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Ruta_Nro" HeaderText="Nº Ruta" SortExpression="Ruta_Nro">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Column1" HeaderText="Cant. Paradas" ReadOnly="True" SortExpression="Column1">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ruta_ID" HeaderText="ID Ruta" SortExpression="Ruta_ID">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ruta_Descrip" HeaderText="Descrip. Ruta" SortExpression="Ruta_Descrip" />
                        <asp:BoundField DataField="Dia_Semana" HeaderText="Día" SortExpression="Dia_Semana" />
                        <asp:BoundField DataField="Ruta_Inicio_Tipo" HeaderText="Tipo Inicial" SortExpression="Ruta_Inicio_Tipo">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ruta_Inicio_Ubicacion" HeaderText="Ubic. Inicial" SortExpression="Ruta_Inicio_Ubicacion">
                        <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sesion_Key_RTS" HeaderText="Clave TP (Sesión)" SortExpression="Sesion_Key_RTS">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Territorio_Key_RTS" HeaderText="Clave TP (Terr)" SortExpression="Territorio_Key_RTS">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Clave TP (Ruta)" SortExpression="Ruta_Key_RTS">
                            <EditItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("Ruta_Key_RTS") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Ruta_Key_RTS") %>'></asp:Label>
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
                        <td>&nbsp;</td>
                        <td class="auto-style87">&nbsp;</td>
                        <td>
                            <asp:Button ID="Button_Volver2" runat="server" OnClick="Button_Volver2_Click" Text="Volver a Territorios" />
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="GesDBRutas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Rutas.Ruta_Key_RTS, Rutas.Sesion_Key_RTS, Territorio_Key_RTS, Ruta_Nro, Ruta_ID, Ruta_Descrip,
              Dia_Semana, Ruta_Inicio_Tipo, Ruta_Inicio_Ubicacion,
              (SELECT COUNT(Parada_Key_RTS) FROM Paradas
               WHERE Paradas.Ruta_Key_RTS = Rutas.Ruta_Key_RTS)
  FROM Rutas  INNER JOIN
              Dias_Semana ON Ruta_Dia = Inicial_Dia_Ingles
WHERE cast(Territorio_Key_RTS as nvarchar) =  @Territorio_Key_RTS
ORDER BY Ruta_Nro">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Territorio" DefaultValue="" Name="Territorio_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
            <asp:View ID="View6" runat="server">
                <asp:FormView ID="FormView3" runat="server" DataKeyNames="Ruta_Key_RTS" DataSourceID="GesDBRutasFV" Width="581px">
                    <EditItemTemplate>
                        Ruta_Key_RTS:
                        <asp:Label ID="Ruta_Key_RTSLabel1" runat="server" Text='<%# Eval("Ruta_Key_RTS") %>' />
                        <br />
                        Sesion_Key_RTS:
                        <asp:TextBox ID="Sesion_Key_RTSTextBox3" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' />
                        <br />
                        Territorio_Key_RTS:
                        <asp:TextBox ID="Territorio_Key_RTSTextBox1" runat="server" Text='<%# Bind("Territorio_Key_RTS") %>' />
                        <br />
                        Ruta_Nro:
                        <asp:TextBox ID="Ruta_NroTextBox" runat="server" Text='<%# Bind("Ruta_Nro") %>' />
                        <br />
                        Ruta_ID:
                        <asp:TextBox ID="Ruta_IDTextBox" runat="server" Text='<%# Bind("Ruta_ID") %>' />
                        <br />
                        Ruta_Descrip:
                        <asp:TextBox ID="Ruta_DescripTextBox" runat="server" Text='<%# Bind("Ruta_Descrip") %>' />
                        <br />
                        Dia_Semana:
                        <asp:TextBox ID="Dia_SemanaTextBox" runat="server" Text='<%# Bind("Dia_Semana") %>' />
                        <br />
                        Ruta_Inicio_Tipo:
                        <asp:TextBox ID="Ruta_Inicio_TipoTextBox" runat="server" Text='<%# Bind("Ruta_Inicio_Tipo") %>' />
                        <br />
                        Ruta_Inicio_Ubicacion:
                        <asp:TextBox ID="Ruta_Inicio_UbicacionTextBox" runat="server" Text='<%# Bind("Ruta_Inicio_Ubicacion") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton1" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Ruta_Key_RTS:
                        <asp:TextBox ID="Ruta_Key_RTSTextBox" runat="server" Text='<%# Bind("Ruta_Key_RTS") %>' />
                        <br />
                        Sesion_Key_RTS:
                        <asp:TextBox ID="Sesion_Key_RTSTextBox2" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' />
                        <br />
                        Territorio_Key_RTS:
                        <asp:TextBox ID="Territorio_Key_RTSTextBox0" runat="server" Text='<%# Bind("Territorio_Key_RTS") %>' />
                        <br />
                        Ruta_Nro:
                        <asp:TextBox ID="Ruta_NroTextBox0" runat="server" Text='<%# Bind("Ruta_Nro") %>' />
                        <br />
                        Ruta_ID:
                        <asp:TextBox ID="Ruta_IDTextBox0" runat="server" Text='<%# Bind("Ruta_ID") %>' />
                        <br />
                        Ruta_Descrip:
                        <asp:TextBox ID="Ruta_DescripTextBox0" runat="server" Text='<%# Bind("Ruta_Descrip") %>' />
                        <br />
                        Dia_Semana:
                        <asp:TextBox ID="Dia_SemanaTextBox0" runat="server" Text='<%# Bind("Dia_Semana") %>' />
                        <br />
                        Ruta_Inicio_Tipo:
                        <asp:TextBox ID="Ruta_Inicio_TipoTextBox0" runat="server" Text='<%# Bind("Ruta_Inicio_Tipo") %>' />
                        <br />
                        Ruta_Inicio_Ubicacion:
                        <asp:TextBox ID="Ruta_Inicio_UbicacionTextBox0" runat="server" Text='<%# Bind("Ruta_Inicio_Ubicacion") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton1" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table style="width: 100%;">
                            <tr>
                                <td class="auto-style36">Sesión: </td>
                                <td class="auto-style42">
                                    <asp:Label ID="Lbl_Sesion0" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' BackColor="#00CC66" Font-Bold="True" style="text-align: center" Width="80px" />
                                </td>
                                <td class="auto-style94">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                <td class="auto-style38">Nº Ruta: </td>
                                <td class="auto-style43">
                                    <asp:Label ID="Lbl_Nro_Ruta" runat="server" Text='<%# Bind("Ruta_Nro") %>' BackColor="#00CC66" Font-Bold="True" style="text-align: center" Width="80px" />
                                </td>
                                <td class="auto-style15">&nbsp;&nbsp; &nbsp;</td>
                                <td class="auto-style41">Dia: </td>
                                <td>
                                    <asp:Label ID="Lbl_Dia_Semana" runat="server" Text='<%# Bind("Dia_Semana") %>' Font-Bold="True" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style36">Territorio: </td>
                                <td class="auto-style42">
                                    <asp:Label ID="Lbl_Territorio0" runat="server" Text='<%# Bind("Territorio_Key_RTS") %>' BackColor="#00CC66" Font-Bold="True" style="text-align: center" Width="80px" />
                                </td>
                                <td class="auto-style94">&nbsp;</td>
                                <td class="auto-style38">Descrip.Ruta: </td>
                                <td class="auto-style39" colspan="4">
                                    <asp:Label ID="Lbl_Ruta_Descrip" runat="server" Text='<%# Bind("Ruta_Descrip") %>' Width="250px" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="GesDBRutasFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Ruta_Key_RTS], [Sesion_Key_RTS], [Territorio_Key_RTS], [Ruta_Nro], [Ruta_ID], [Ruta_Descrip],
              [Dia_Semana], [Ruta_Inicio_Tipo], [Ruta_Inicio_Ubicacion]
  FROM [Rutas]  INNER JOIN
              [Dias_Semana] ON [Ruta_Dia] = [Inicial_Dia_Ingles]
WHERE cast(Sesion_Key_RTS     as nvarchar) = @ID_Sesion
    AND cast(Territorio_Key_RTS as nvarchar) = @Territorio_Key_RTS
    AND cast(Ruta_Key_RTS         as nvarchar) = @Ruta_Key_RTS">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Sesion" Name="ID_Sesion" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Territorio" DefaultValue="" Name="Territorio_Key_RTS" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Ruta" Name="Ruta_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Parada_Key_RTS" DataSourceID="GesDBParadas" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Nro_Secuencia" HeaderText="Sec." SortExpression="Nro_Secuencia">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ubicacion_ID" HeaderText="Cliente" SortExpression="Ubicacion_ID">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DESCRIPTION" HeaderText="Nombre" SortExpression="DESCRIPTION" />
                        <asp:BoundField DataField="ADDR_LINE1" HeaderText="Dirección" SortExpression="ADDR_LINE1" />
                        <asp:BoundField DataField="COMUNA" HeaderText="Comuna" SortExpression="COMUNA" />
                        <asp:BoundField DataField="Distancia_Km" HeaderText="Dist. (Km)" ReadOnly="True" SortExpression="Distancia_Km">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Tpo_Viaje" HeaderText="Tpo. Viaje" ReadOnly="True" SortExpression="Tpo_Viaje">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Llegada" SortExpression="Hra_Llegada">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hra_Llegada") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Hra_Llegada", "{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apertura" SortExpression="Hora_Apertura">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Hora_Apertura") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Hora_Apertura", "{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cierre" SortExpression="Hora_Cierre">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Hora_Cierre") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Hora_Cierre", "{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Prom. Fact." SortExpression="Prom_Facturacion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Prom_Facturacion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Prom_Facturacion", "{0:C0}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Prom. Kilos" SortExpression="Prom_Kilos">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Prom_Kilos") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Prom_Kilos", "{0:F0}") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Carga Trab." SortExpression="Carga_Trab">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Carga_Trab") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Carga_Trab", "{0:F5}") %>'></asp:Label>
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
                        <td class="auto-style25">&nbsp;</td>
                        <td>
                            <asp:Button ID="Button_Volver3" runat="server" OnClick="ButtonVolver2_Click" Text="Volver a Rutas" />
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="GesDBParadas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT DISTINCT Parada_Key_RTS, Nro_Secuencia, Paradas.Ubicacion_ID, DESCRIPTION, ADDR_LINE1, COMUNA,
              CAST(CONVERT(VARCHAR(8),DATEADD(SECOND,DATEDIFF(SECOND, '05:00:00',Hora_Llegada),0),114)
                                           AS DATETIME) AS Hra_Llegada,
               CONVERT(VARCHAR(8),DATEADD(SECOND,Tiempo_Servicio,0),114) AS Tpo_Servicio,
               CONVERT(VARCHAR(8),DATEADD(SECOND,Tiempo_Viaje,0),114) AS Tpo_Viaje,
               CAST((Distancia/100.00) AS DECIMAL(5,2)) AS Distancia_Km, Hora_Apertura, Hora_Cierre,
               Prom_Facturacion, Prom_Kilos, Carga_Trab
 FROM  Paradas INNER JOIN
              Ext_Paradas ON Ext_Paradas.Ext_Parada_Key_RTS = Paradas.Ext_Parada_Key_RTS  INNER JOIN
              V_ClientesTP ON  Paradas.Ubicacion_ID          = ID
                                     AND Paradas.Ubicacion_Region = REGION_ID
WHERE cast(Paradas.Sesion_Key_RTS as nvarchar)       = @Sesion_Key_RTS
    AND  cast(Paradas.Territorio_Key_RTS as nvarchar)  = @Territory_Nro
    AND  cast(Ruta_Key_RTS as nvarchar)          = @Ruta_Key_RTS
ORDER BY Nro_Secuencia">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Sesion" DefaultValue="" Name="Sesion_Key_RTS" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Territorio" DefaultValue="" Name="Territory_Nro" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Ruta" Name="Ruta_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
        </asp:MultiView>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
