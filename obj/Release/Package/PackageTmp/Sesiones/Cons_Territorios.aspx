<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cons_Territorios.aspx.cs" Inherits="BitOp.Sesiones.Cons_Territorios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            font-size: medium;
            color: #000000;
        }
        .auto-style22 {
            width: 467px;
        }
        .auto-style36 {
            width: 62px;
        }
        .auto-style42 {
            width: 154px;
        }
        .auto-style61 {
            width: 41px;
        }
        .auto-style38 {
            width: 85px;
        }
        .auto-style43 {
            width: 153px;
        }
        .auto-style62 {
            width: 40px;
        }
        .auto-style41 {
            width: 30px;
        }
        .auto-style25 {
            width: 515px;
        }
        .auto-style66 {
            width: 52px;
        }
        .auto-style67 {
            width: 222px;
        }
        .auto-style68 {
            width: 51px;
        }
        .auto-style70 {
            width: 260px;
        }
        .auto-style71 {
            width: 126px;
        }
        .auto-style73 {
            width: 133px;
        }
        .auto-style76 {
            width: 58px;
        }
        .auto-style77 {
            width: 79px;
        }
        .auto-style78 {
            width: 83px;
        }
        .auto-style79 {
            width: 127px;
        }
        .auto-style80 {
            width: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p class="auto-style10">
                    <strong>CONSULTA TERRITORIOS</strong></p>
                <p>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style66">Región:</td>
                            <td class="auto-style67">
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" Width="250px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], ([Region_Chile] + ' - ' + [Descripción]) as Region_Txt, [Region_RTS] 
 FROM [Regiones]
ORDER BY [Region_Txt]"></asp:SqlDataSource>
                            </td>
                            <td class="auto-style76">&nbsp;</td>
                            <td class="auto-style68">Sesión:</td>
                            <td class="auto-style70">
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="GesDBSesiones" DataTextField="Descripcion" DataValueField="Sesion_Key_RTS" Width="250px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="GesDBSesiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT 0 AS Sesion_Key_RTS,'  ' AS Region_ID,'- Seleccione sesión -' AS Descripcion FROM [Sesiones]
UNION
SELECT [Sesion_Key_RTS], [Region_ID], [Descripcion] 
  FROM [Sesiones]
WHERE [Region_ID] = @Region_ID">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="Region_ID" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="auto-style41">&nbsp;</td>
                            <td class="auto-style71">
                                <asp:Label ID="Lbl_Region" runat="server" Font-Bold="False" style="text-align: left" Text="Lbl_Region" Visible="False" Width="120px"></asp:Label>
                            </td>
                            <td class="auto-style73">
                                <asp:Label ID="Lbl_Territorio" runat="server" Text="Lbl_Territorio" Visible="False"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style66">&nbsp;</td>
                            <td class="auto-style67">&nbsp;</td>
                            <td class="auto-style76">&nbsp;</td>
                            <td class="auto-style68">&nbsp;</td>
                            <td class="auto-style70">&nbsp;</td>
                            <td class="auto-style41">&nbsp;</td>
                            <td class="auto-style71">
                                <asp:Label ID="Lbl_Sesion" runat="server" Text="Lbl_Sesion" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style73">
                                <asp:Label ID="Lbl_Ruta" runat="server" Text="Lbl_Ruta" Visible="False"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Territorio_Key_RTS" DataSourceID="GesDBTerritorios" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowHeaderWhenEmpty="True" Width="95%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Button ID="Rutas_Button" runat="server" CausesValidation="False" CommandName="Select" OnClick="Rutas_Button_Click" Text="Rutas" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Territorio_ID" HeaderText="ID Territorio" SortExpression="Territorio_ID">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cant_Rutas" HeaderText="Cant. Rutas" ReadOnly="True" SortExpression="Cant_Rutas">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cant_Paradas" HeaderText="Cant. Paradas" ReadOnly="True" SortExpression="Cant_Paradas">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Territorio_Nro" HeaderText="Nº Territorio" SortExpression="Territorio_Nro">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Territorio_Descrip" HeaderText="Descrip. Territorio" SortExpression="Territorio_Descrip"></asp:BoundField>
                            <asp:BoundField DataField="Vendedor_Nombre" HeaderText="Vendedor" SortExpression="Vendedor_Nombre">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
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
                <p>
                    <asp:SqlDataSource ID="GesDBTerritorios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Territorio_Key_RTS, Sesion_Key_RTS, Territorio_Nro, Territorio_ID, Territorio_Descrip,
              isNull(Vendedores.Vendedor_Nombre,' ') Vendedor_Nombre,
              (SELECT COUNT(Ruta_Key_RTS) FROM Rutas
                WHERE Rutas.Territorio_Key_RTS = Territorios.Territorio_Key_RTS) AS Cant_Rutas,
              (SELECT COUNT(Parada_Key_RTS) FROM Paradas
               WHERE Paradas.Territorio_Key_RTS = Territorios.Territorio_Key_RTS) AS Cant_Paradas
  FROM Territorios LEFT OUTER JOIN
              Vendedores ON Vendedor = Vendedor_ID
WHERE cast(Sesion_Key_RTS as varchar) = @Sesion_Key_RTS">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="Sesion_Key_RTS" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </p>
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                <p class="auto-style10">
                    <strong>CONSULTA TERRITORIOS</strong></p>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Territorio_Key_RTS" DataSourceID="GesDBTerritoriosFV" Width="662px">
                    <EditItemTemplate>
                        Territorio_Key_RTS:
                        <asp:Label ID="Territorio_Key_RTSLabel1" runat="server" Text='<%# Eval("Territorio_Key_RTS") %>' />
                        <br />
                        Sesion_Key_RTS:
                        <asp:TextBox ID="Sesion_Key_RTSTextBox" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' />
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
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
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
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style77">Sesión:</td>
                                <td class="auto-style79">
                                    <asp:Label ID="Sesion_Key_RTSLabel" runat="server" BackColor="#00CC66" Font-Bold="True" style="text-align: center" Text='<%# Bind("Sesion_Key_RTS") %>' Width="80px" />
                                </td>
                                <td class="auto-style80">&nbsp;</td>
                                <td class="auto-style78">Nº Territorio:&nbsp; </td>
                                <td>
                                    <asp:Label ID="Territorio_NroLabel" runat="server" Text='<%# Bind("Territorio_Nro") %>' BackColor="#00CC66" Font-Bold="True" style="text-align: center" Width="80px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style77">ID Territorio: </td>
                                <td class="auto-style79">
                                    <asp:Label ID="Territorio_IDLabel" runat="server" Text='<%# Bind("Territorio_ID") %>' Font-Bold="True" style="text-align: left" Width="80px" />
                                </td>
                                <td class="auto-style80">&nbsp;</td>
                                <td class="auto-style78">Vendedor:</td>
                                <td>
                                    <asp:Label ID="Vendedor_NombreLabel" runat="server" Text='<%# Bind("Vendedor_Nombre") %>' Width="300px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="GesDBTerritoriosFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Territorio_Key_RTS, Sesion_Key_RTS, Territorio_Nro, Territorio_ID, Territorio_Descrip,
              Vendedor, isNull(Vendedor_Nombre,' ') Vendedor_Nombre
  FROM Territorios LEFT OUTER JOIN
              Vendedores ON Vendedor = Vendedor_ID
WHERE cast(Sesion_Key_RTS as nvarchar) = @Nro_Sesion
    AND cast(Territorio_Key_RTS as nvarchar) = @ID_Territorio">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="Nro_Sesion" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="Lbl_Territorio" Name="ID_Territorio" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Ruta_Key_RTS" DataSourceID="GesDBRutas" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" ShowHeaderWhenEmpty="True" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Paradas_Button" runat="server" CausesValidation="False" CommandName="Select" OnClick="Button1_Click" Text="Paradas" />
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
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Ruta_Key_RTS") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Ruta_Key_RTS") %>'></asp:Label>
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
                <br />
                <table style="width:100%;">
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style22">&nbsp;</td>
                        <td>
                            <asp:Button ID="ButtonVolver" runat="server" OnClick="ButtonVolver_Click" Text="Volver a Territorios" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:SqlDataSource ID="GesDBRutas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Rutas.Ruta_Key_RTS, Rutas.Sesion_Key_RTS, Territorio_Key_RTS, Ruta_Nro, Ruta_ID, Ruta_Descrip,
              Dia_Semana, Ruta_Inicio_Tipo, Ruta_Inicio_Ubicacion,
              (SELECT COUNT(Parada_Key_RTS) FROM Paradas WHERE Paradas.Ruta_Key_RTS = Rutas.Ruta_Key_RTS) 
  FROM Rutas  INNER JOIN
              Dias_Semana ON Ruta_Dia = Inicial_Dia_Ingles
WHERE cast(Territorio_Key_RTS as nvarchar) =  @Territorio_Key_RTS">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Territorio" DefaultValue="" Name="Territorio_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
            <asp:View ID="View3" runat="server">
                <p class="auto-style10">
                    <strong>CONSULTA TERRITORIOS</strong></p>
                <asp:FormView ID="FormView2" runat="server" DataKeyNames="Ruta_Key_RTS" DataSourceID="GesDBRutasFV" Width="581px">
                    <EditItemTemplate>
                        Ruta_Key_RTS:
                        <asp:Label ID="Ruta_Key_RTSLabel1" runat="server" Text='<%# Eval("Ruta_Key_RTS") %>' />
                        <br />
                        Sesion_Key_RTS:
                        <asp:TextBox ID="Sesion_Key_RTSTextBox1" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' />
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
                        <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton0" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
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
                        <asp:LinkButton ID="InsertButton0" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton0" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table style="width: 100%;">
                            <tr>
                                <td class="auto-style36">Sesión: </td>
                                <td class="auto-style42">
                                    <asp:Label ID="Lbl_Sesion" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' BackColor="#00CC66" Font-Bold="True" style="text-align: center" Width="80px" />
                                </td>
                                <td class="auto-style61">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                <td class="auto-style38">Nº Ruta: </td>
                                <td class="auto-style43">
                                    <asp:Label ID="Lbl_Nro_Ruta" runat="server" Text='<%# Bind("Ruta_Nro") %>' BackColor="#00CC66" Font-Bold="True" style="text-align: center" Width="80px" />
                                </td>
                                <td class="auto-style62">&nbsp;&nbsp; &nbsp;</td>
                                <td class="auto-style41">Dia: </td>
                                <td>
                                    <asp:Label ID="Lbl_Dia_Semana" runat="server" Text='<%# Bind("Dia_Semana") %>' Font-Bold="True" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style36">Territorio: </td>
                                <td class="auto-style42">
                                    <asp:Label ID="Lbl_Territorio" runat="server" Text='<%# Bind("Territorio_Key_RTS") %>' BackColor="#00CC66" Font-Bold="True" style="text-align: center" Width="80px" />
                                </td>
                                <td class="auto-style61">&nbsp;</td>
                                <td class="auto-style38">Descrip.Ruta: </td>
                                <td class="auto-style39" colspan="4">
                                    <asp:Label ID="Lbl_Ruta_Descrip" runat="server" Text='<%# Bind("Ruta_Descrip") %>' />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="GesDBRutasFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Ruta_Key_RTS], [Sesion_Key_RTS], [Territorio_Key_RTS], [Ruta_Nro], [Ruta_ID], [Ruta_Descrip],
              [Dia_Semana], [Ruta_Inicio_Tipo], [Ruta_Inicio_Ubicacion] 
  FROM [Rutas]  INNER JOIN
              [Dias_Semana] ON [Ruta_Dia] = [Inicial_Dia_Ingles]
WHERE cast(Sesion_Key_RTS as nvarchar)     = @ID_Sesion
    AND cast(Territorio_Key_RTS as nvarchar) = @Territorio_Key_RTS
    AND cast(Ruta_Key_RTS as nvarchar)         = @Ruta_Key_RTS">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="ID_Sesion" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="Lbl_Territorio" DefaultValue="" Name="Territorio_Key_RTS" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Ruta" Name="Ruta_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Parada_Key_RTS" DataSourceID="GesDBParadas" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Nro_Secuencia" HeaderText="Secuencia" SortExpression="Nro_Secuencia">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ubicacion_ID" HeaderText="Cliente" SortExpression="Ubicacion_ID">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DESCRIPTION" HeaderText="Descripción" SortExpression="DESCRIPTION" />
                        <asp:BoundField DataField="ADDR_LINE1" HeaderText="Dirección" SortExpression="ADDR_LINE1" />
                        <asp:BoundField DataField="COMUNA" HeaderText="Comuna" SortExpression="COMUNA" />
                        <asp:TemplateField HeaderText="Llegada" SortExpression="Hra_Llegada">
                            <EditItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("Hra_Llegada") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Hra_Llegada", "{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tpo.Viaje" SortExpression="Tpo_Viaje">
                            <EditItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("Tpo_Viaje") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Tpo_Viaje", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Distancia (km)" SortExpression="Distancia_Km">
                            <EditItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("Distancia_Km") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Distancia_Km") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apertura" SortExpression="Hora_Apertura">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Hora_Apertura") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Hora_Apertura", "{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cierre" SortExpression="Hora_Cierre">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Hora_Cierre") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Hora_Cierre", "{0:t}") %>'></asp:Label>
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
                            <asp:Button ID="ButtonVolver2" runat="server" OnClick="ButtonVolver2_Click" Text="Volver a Rutas" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:SqlDataSource ID="GesDBParadas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT DISTINCT Parada_Key_RTS, Nro_Secuencia, Ubicacion_ID, DESCRIPTION, ADDR_LINE1, COMUNA,
                                CAST(CONVERT(VARCHAR(8),DATEADD(SECOND,DATEDIFF(SECOND, '05:00:00', Hora_Llegada),0),114) AS DATETIME) AS Hra_Llegada,
                                CONVERT(VARCHAR(8),DATEADD(SECOND,Tiempo_Servicio,0),114) AS Tpo_Servicio,
                                CONVERT(VARCHAR(8),DATEADD(SECOND,Tiempo_Viaje,0),114) AS Tpo_Viaje,
                                CAST((Distancia/100.00) AS DECIMAL(5,2)) AS Distancia_Km,
                                Hora_Apertura, Hora_Cierre
 FROM  Paradas INNER JOIN
              V_ClientesTP ON  Ubicacion_ID = ID
                                     AND Ubicacion_Region = REGION_ID
WHERE cast(Sesion_Key_RTS as nvarchar)     = @Sesion_Key_RTS
    AND  cast(Territorio_Key_RTS as nvarchar) = @Territory_Nro
    AND  cast(Ruta_Key_RTS as nvarchar)        = @Ruta_Key_RTS
ORDER BY Nro_Secuencia">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="Sesion_Key_RTS" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="Lbl_Territorio" DefaultValue="" Name="Territory_Nro" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Ruta" Name="Ruta_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
