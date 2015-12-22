<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cons_TerrVend.aspx.cs" Inherits="BitOp.Sesiones.Cons_TerrVend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            font-size: medium;
            color: #000000;
        }
        .auto-style12 {
            width: 61px;
        }
        .auto-style14 {
            width: 248px;
        }
        .auto-style15 {
            width: 72px;
        }
        .auto-style16 {
            width: 320px;
        }
        .auto-style17 {
            width: 127px;
        }
        .auto-style22 {
            width: 460px;
        }
        .auto-style25 {
            width: 509px;
        }
        .auto-style36 {
            width: 62px;
        }
        .auto-style39 {
        }
        .auto-style41 {
            width: 30px;
        }
        .auto-style43 {
            width: 116px;
        }
        .auto-style61 {
            width: 47px;
        }
        .auto-style63 {
            width: 86px;
        }
        .auto-style64 {
            width: 79px;
        }
        .auto-style65 {
            width: 93px;
        }
        .auto-style66 {
            width: 29px;
        }
        .auto-style67 {
            width: 31px;
        }
        .auto-style68 {
            width: 125px;
        }
        .auto-style69 {
            width: 91px;
        }
        .auto-style70 {
            width: 90px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style10">
        <strong>HISTORICO DE TERRITORIOS x VENDEDOR</strong></p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style17">
                                <asp:Label ID="Lbl_Sesion" runat="server" Text="Lbl_Sesion" Visible="False"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style12">Región:</td>
                            <td class="auto-style14">
                                <asp:DropDownList ID="DropDownRegion" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" Height="22px" Width="200px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], ([Region_Chile] + ' - ' + [Descripción]) as Region_Txt, [Region_RTS] 
 FROM [Regiones]
ORDER BY [Region_Txt]"></asp:SqlDataSource>
                            </td>
                            <td class="auto-style15">Vendedor:</td>
                            <td class="auto-style16">
                                <asp:DropDownList ID="DropDownVendedor" runat="server" AutoPostBack="True" DataSourceID="GesDBVendedores" DataTextField="Vendedor_Nombre" DataValueField="Vendedor_ID" Height="22px" OnSelectedIndexChanged="DropDownVendedor_SelectedIndexChanged" Width="250px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="GesDBVendedores" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT ' ' AS [Vendedor_ID], ' ' AS [Vendedor_Tipo], '- Seleccione Vendedor -' AS [Vendedor_Nombre],
              ' ' AS [Region], ' ' AS [Supervisor], ' ' AS [Estado]
  FROM [Vendedores]
UNION
SELECT [Vendedor_ID], [Vendedor_Tipo], [Vendedor_Nombre], [Region], [Supervisor], [Estado]
  FROM [Vendedores]
WHERE [Region] = @Region_ID
    AND [Vendedor_Tipo] = 'Vendedor'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownRegion" DefaultValue="" Name="Region_ID" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="auto-style17">
                                <asp:Label ID="Lbl_Territorio" runat="server" Text="Lbl_Territorio" Visible="False"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style17">
                                <asp:Label ID="Lbl_Ruta" runat="server" Text="Lbl_Ruta" Visible="False"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </p>
                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Territorio_Key_RTS" DataSourceID="GesRTSTerritorios" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="100%" OnSelectedIndexChanged="GridView3_SelectedIndexChanged1">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Rutas_Button" runat="server" CausesValidation="False" CommandName="Select" OnClick="Button1_Click1" Text="Rutas" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Territorio_Nro" HeaderText="Nº Territorio" SortExpression="Territorio_Nro">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Territorio_ID" HeaderText="ID Territorio" SortExpression="Territorio_ID">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Territorio_Descrip" HeaderText="Descrip. Territorio" SortExpression="Territorio_Descrip" />
                        <asp:BoundField DataField="Vendedor_Nombre" HeaderText="Vendedor" SortExpression="Vendedor_Nombre" />
                        <asp:BoundField DataField="Cant_Rutas" HeaderText="Cant. Rutas" SortExpression="Cant_Rutas">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cant_Ubic" HeaderText="Cant. Ubicaciones" SortExpression="Cant_Ubic">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cant_Paradas" HeaderText="Cant. Paradas" SortExpression="Cant_Paradas">
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
                <br />
                <asp:SqlDataSource ID="GesRTSTerritorios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Territorio_Key_RTS, Territorios.Sesion_Key_RTS, Territorio_Nro, Territorio_ID, Territorio_Descrip,
              isNull(Vendedor_Nombre, ' ') Vendedor_Nombre,
              (SELECT COUNT(Ruta_Key_RTS) FROM Rutas
                WHERE Rutas.Territorio_Key_RTS = Territorios.Territorio_Key_RTS) AS Cant_Rutas,
              (SELECT COUNT(DISTINCT Ubicacion_ID) FROM Paradas
               WHERE Paradas.Territorio_Key_RTS = Territorios.Territorio_Key_RTS) AS Cant_Ubic,
              (SELECT COUNT(Parada_Key_RTS) FROM Paradas
               WHERE Paradas.Territorio_Key_RTS = Territorios.Territorio_Key_RTS) AS Cant_Paradas
  FROM Territorios                                                                                   LEFT OUTER JOIN
              Vendedores ON Vendedor                           = Vendedor_ID  INNER JOIN
              Sesiones      ON Sesiones.Sesion_Key_RTS = Territorios.Sesion_Key_RTS
WHERE  Region_ID = @Region_ID
     AND Vendedor  = @Vendedor_ID
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownRegion" Name="Region_ID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownVendedor" Name="Vendedor_ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Territorio_Key_RTS" DataSourceID="GesDBTerritoriosFV" Width="665px">
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
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style64">Sesión:</td>
                                <td class="auto-style61">
                                    <asp:Label ID="Sesion_Key_RTSLabel" runat="server" BackColor="#00CC66" Font-Bold="True" style="text-align: center" Text='<%# Bind("Sesion_Key_RTS") %>' Width="80px" />
                                </td>
                                <td class="auto-style41">&nbsp; &nbsp;</td>
                                <td class="auto-style63">Nº Territorio:&nbsp; </td>
                                <td>
                                    <asp:Label ID="Territorio_NroLabel" runat="server" Text='<%# Bind("Territorio_Nro") %>' BackColor="#00CC66" Font-Bold="True" style="text-align: center" Width="80px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style64">ID Territorio: </td>
                                <td class="auto-style61">
                                    <asp:Label ID="Territorio_IDLabel" runat="server" Text='<%# Bind("Territorio_ID") %>' Font-Bold="True" Width="80px" BackColor="#00CC66" style="text-align: center" />
                                </td>
                                <td class="auto-style41">&nbsp;</td>
                                <td class="auto-style63">Vendedor:</td>
                                <td>
                                    <asp:Label ID="Vendedor_NombreLabel" runat="server" Text='<%# Bind("Vendedor_Nombre") %>' Width="300px" BackColor="#00CC66" style="font-weight: 700; text-align: center" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="GesDBTerritoriosFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Territorio_Key_RTS, Sesion_Key_RTS, Territorio_Nro, Territorio_ID, Territorio_Descrip,
              isNull(Vendedor, 0) Vendedor, isNull(Vendedor_Nombre, ' ') Vendedor_Nombre
  FROM Territorios LEFT OUTER JOIN
              Vendedores ON Vendedor = Vendedor_ID
WHERE cast(Sesion_Key_RTS     as nvarchar) = @Nro_Sesion
    AND cast(Territorio_Key_RTS as nvarchar) = @ID_Territorio">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Sesion" Name="Nro_Sesion" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Territorio" Name="ID_Territorio" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Ruta_Key_RTS" DataSourceID="GesDBRutas" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="100%" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
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
                        <asp:BoundField DataField="Ruta_Descrip" HeaderText="Descrip. Ruta" SortExpression="Ruta_Descrip">
                        </asp:BoundField>
                        <asp:BoundField DataField="Dia_Semana" HeaderText="Día" SortExpression="Dia_Semana">
                        </asp:BoundField>
                        <asp:BoundField DataField="Ruta_Inicio_Tipo" HeaderText="Tipo Inicial" SortExpression="Ruta_Inicio_Tipo" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ruta_Inicio_Ubicacion" HeaderText="Ubic. Inicial" SortExpression="Ruta_Inicio_Ubicacion" >
                        <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sesion_Key_RTS" HeaderText="Clave TP (Sesión)" SortExpression="Sesion_Key_RTS" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Territorio_Key_RTS" HeaderText="Clave TP (Terr)" SortExpression="Territorio_Key_RTS" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Clave TP (Ruta)" SortExpression="Ruta_Key_RTS">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Ruta_Key_RTS") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Ruta_Key_RTS") %>'></asp:Label>
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
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:FormView ID="FormView2" runat="server" DataKeyNames="Ruta_Key_RTS" DataSourceID="GesDBRutasFV" Width="948px">
                    <EditItemTemplate>
                        Ruta_Key_RTS:
                        <asp:Label ID="Ruta_Key_RTSLabel1" runat="server" Text='<%# Eval("Ruta_Key_RTS") %>' />
                        <br />
                        Sesion_Key_RTS:
                        <asp:TextBox ID="Sesion_Key_RTSTextBox" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' />
                        <br />
                        Territorio_Key_RTS:
                        <asp:TextBox ID="Territorio_Key_RTSTextBox" runat="server" Text='<%# Bind("Territorio_Key_RTS") %>' />
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
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Ruta_Key_RTS:
                        <asp:TextBox ID="Ruta_Key_RTSTextBox" runat="server" Text='<%# Bind("Ruta_Key_RTS") %>' />
                        <br />
                        Sesion_Key_RTS:
                        <asp:TextBox ID="Sesion_Key_RTSTextBox" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' />
                        <br />
                        Territorio_Key_RTS:
                        <asp:TextBox ID="Territorio_Key_RTSTextBox" runat="server" Text='<%# Bind("Territorio_Key_RTS") %>' />
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
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style36">Sesión: </td>
                                <td class="auto-style68">
                                    <asp:Label ID="Sesion_Key_RTSLabel" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' BackColor="#00CC66" Font-Bold="True" style="text-align: center" Width="80px" />
                                </td>
                                <td class="auto-style66">&nbsp;</td>
                                <td class="auto-style65">Nº Territorio: </td>
                                <td class="auto-style43">
                                    <asp:Label ID="Territorio_Key_RTSLabel" runat="server" BackColor="#00CC66" Font-Bold="True" style="text-align: center" Text='<%# Bind("Territorio_Key_RTS") %>' Width="80px" />
                                </td>
                                <td class="auto-style67">&nbsp;</td>
                                <td class="auto-style70">ID Territorio: </td>
                                <td>
                                    <asp:Label ID="ID_TerritorioLabel" runat="server" BackColor="#00CC66" style="font-weight: 700; text-align: center" Text='<%# Bind("Territorio_ID") %>' Width="90px"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style36">&nbsp;Nº Ruta:</td>
                                <td class="auto-style68">
                                    <asp:Label ID="Ruta_NroLabel" runat="server" BackColor="#00CC66" Font-Bold="True" style="text-align: center" Text='<%# Bind("Ruta_Nro") %>' Width="80px" />
                                </td>
                                <td class="auto-style66">&nbsp;</td>
                                <td class="auto-style65">Descrip. Ruta: </td>
                                <td class="auto-style39">
                                    <asp:Label ID="Ruta_DescripLabel" runat="server" Text='<%# Bind("Ruta_Descrip") %>' Width="250px" BackColor="#00CC66" style="font-weight: 700; text-align: center" />
                                </td>
                                <td class="auto-style67">&nbsp;</td>
                                <td class="auto-style70">Día:</td>
                                <td class="auto-style39">
                                    <asp:Label ID="Dia_SemanaLabel" runat="server" BackColor="#00CC66" Font-Bold="True" style="text-align: center" Text='<%# Bind("Dia_Semana") %>' Width="90px" />
                                </td>
                                <td class="auto-style39">&nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="GesDBRutasFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Rutas.Ruta_Key_RTS, Rutas.Sesion_Key_RTS, Rutas.Territorio_Key_RTS, Territorios.Territorio_ID,
              Rutas.Ruta_Nro, Rutas.Ruta_ID, Rutas.Ruta_Descrip, Dias_Semana.Dia_Semana, Rutas.Ruta_Inicio_Tipo,
              Rutas.Ruta_Inicio_Ubicacion
  FROM Rutas                                                                                                                            INNER JOIN
              Territorios      ON Territorios.Territorio_Key_RTS   = Rutas.Territorio_Key_RTS INNER JOIN
              Dias_Semana ON Dias_Semana.Inicial_Dia_Ingles = Rutas.Ruta_Dia
WHERE cast(Rutas.Sesion_Key_RTS     as nvarchar) = @ID_Sesion
    AND cast(Rutas.Territorio_Key_RTS as nvarchar) = @Territorio_Key_RTS
    AND cast(Rutas.Ruta_Key_RTS         as nvarchar) = @Ruta_Key_RTS">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Sesion" Name="ID_Sesion" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Territorio" DefaultValue="" Name="Territorio_Key_RTS" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Ruta" Name="Ruta_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Parada_Key_RTS" DataSourceID="GesDBParadas" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridView4_SelectedIndexChanged" ShowHeaderWhenEmpty="True">
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
                        <asp:BoundField DataField="Distancia_Km" HeaderText="Dist. (km)" ReadOnly="True" SortExpression="Distancia_Km">
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
                        <asp:TemplateField HeaderText="Prom. Fact." SortExpression="Prom_Fact">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Prom_Fact") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Prom_Fact", "{0:C0}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Prom. Kilos" SortExpression="Prom_Kil">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Prom_Kil") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Prom_Kil", "{0:F0}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Carga Trab." SortExpression="Carga_Trabajo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Carga_Trabajo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Carga_Trabajo", "{0:F5}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Descr_Entrega_Espanol" HeaderText="Días" SortExpression="Descr_Entrega_Espanol" />
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
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="GesDBParadas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT DISTINCT Parada_Key_RTS, Nro_Secuencia, Paradas.Ubicacion_ID, DESCRIPTION, ADDR_LINE1, COMUNA,
              CAST(CONVERT(VARCHAR(8),DATEADD(SECOND,DATEDIFF(SECOND, '05:00:00',
              Hora_Llegada),0),114) AS DATETIME) AS Hra_Llegada,
              CONVERT(VARCHAR(8),DATEADD(SECOND,Tiempo_Servicio,0),114) AS Tpo_Servicio,
              CONVERT(VARCHAR(8),DATEADD(SECOND,Tiempo_Viaje,0),114) AS Tpo_Viaje,
              CAST((Distancia/100.00) AS DECIMAL(5,2)) AS Distancia_Km, Hora_Apertura, Hora_Cierre,
              Descr_Entrega_Espanol, (Prom_Facturacion / Cant_Dias) AS Prom_Fact,
              (Prom_Kilos / Cant_Dias) AS Prom_Kil, (Carga_Trab / Cant_Dias) AS Carga_Trabajo
 FROM  Paradas INNER JOIN
              Ext_Paradas ON Ext_Paradas.Ext_Parada_Key_RTS     = Paradas.Ext_Parada_Key_RTS        INNER JOIN
              Dias_Entrega  ON Dias_Entrega.Dias_Entrega_Ingles = Ext_Paradas.Dias_Entrega_Ingles  INNER JOIN
              V_ClientesTP ON  Paradas.Ubicacion_ID          = ID
                                     AND Paradas.Ubicacion_Region = REGION_ID
WHERE cast(Paradas.Sesion_Key_RTS as nvarchar)      = @Sesion_Key_RTS
    AND  cast(Paradas.Territorio_Key_RTS as nvarchar) = @Territorio_Nro
    AND  cast(Paradas.Ruta_Key_RTS as nvarchar)         = @Ruta_Key_RTS
ORDER BY Nro_Secuencia">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Sesion" DefaultValue="" Name="Sesion_Key_RTS" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Territorio" Name="Territorio_Nro" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Lbl_Ruta" Name="Ruta_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </p>
    </asp:Content>
