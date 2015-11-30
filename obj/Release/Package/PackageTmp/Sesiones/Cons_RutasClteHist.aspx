<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cons_RutasClteHist.aspx.cs" Inherits="BitOp.Sesiones.Cons_TerrClteHist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            width: 534px;
        }
        .auto-style11 {
            width: 52px;
        }
        .auto-style14 {
            width: 68px;
        }
        .auto-style16 {
            width: 30px;
        }
        .auto-style17 {
            width: 162px;
        }
        .auto-style18 {
            width: 172px;
        }
        .auto-style19 {
            width: 46px;
        }
        .auto-style20 {
            width: 296px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style10">
        <strong>RUTAS x CLIENTE (Históricas)</strong></p>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style11">Región: </td>
                <td class="auto-style18">
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" Width="150px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], ([Region_Chile] + ' - ' + [Descripción]) as Region_Txt, [Region_RTS] 
 FROM [Regiones]
ORDER BY [Region_Txt]"></asp:SqlDataSource>
                </td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style14">Búsqueda: </td>
                <td class="auto-style17">
        <asp:TextBox ID="TextBoxBusqueda" runat="server" MaxLength="15" OnTextChanged="TextBoxBusqueda_TextChanged" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style19">Cliente: </td>
                <td class="auto-style20">
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="GesDBClientes" DataTextField="Nombre_Cliente" DataValueField="ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="GesDBClientes" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT ' ' AS [REGION_ID], ' ' AS [TYPE], ' ' AS [ID], '- Seleccione Cliente -' AS Nombre_Cliente
  FROM [V_ClientesTP]
UNION
SELECT [REGION_ID], [TYPE], [ID], [ID] + ' - ' + [DESCRIPTION] AS Nombre_Cliente
  FROM [V_ClientesTP]
WHERE [REGION_ID] = @Region_ID
     AND [TYPE]            = 'SIT'
    AND (([DESCRIPTION] LIKE ('%' +@Busqueda + '%'))
       OR  ([ID] LIKE ('%' +@Busqueda + '%')))">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="Region_ID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TextBoxBusqueda" Name="Busqueda" PropertyName="Text" />
            </SelectParameters>
    </asp:SqlDataSource>
                </td>
                <td class="auto-style16">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="GesDBTerritorios" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="90%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Sesion_Key_RTS" HeaderText="ID Sesión" SortExpression="Sesion_Key_RTS">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Descripcion" HeaderText="Descrip. Sesión" SortExpression="Descripcion" />
            <asp:BoundField DataField="Territorio_Key_RTS" HeaderText="ID Territorio" SortExpression="Territorio_Key_RTS">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Territorio_Descrip" HeaderText="Descrip. Territorio" SortExpression="Territorio_Descrip" />
            <asp:BoundField DataField="Ruta_ID" HeaderText="ID Ruta" SortExpression="Ruta_ID">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Ruta_Nro" HeaderText="Nº Ruta" SortExpression="Ruta_Nro">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Dia_Nombre_Corto" HeaderText="Día" SortExpression="Dia_Nombre_Corto">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Nro_Secuencia" HeaderText="Nº Secuencia" SortExpression="Nro_Secuencia">
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
        <asp:SqlDataSource ID="GesDBTerritorios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT	Paradas.Sesion_Key_RTS, Sesiones.Descripcion,
	Rutas.Territorio_Key_RTS, Territorios.Territorio_Descrip,
	Paradas.Ruta_Key_RTS, Rutas.Ruta_ID, Rutas.Ruta_Nro,
	Dia_Nombre_Corto, Paradas.Ubicacion_ID, Paradas.Nro_Secuencia
  FROM     Paradas                                                                                                                            INNER JOIN
	Rutas                ON Paradas.Ruta_Key_RTS         = Rutas.Ruta_Key_RTS                  INNER JOIN
	Territorios        ON Rutas.Territorio_Key_RTS    = Territorios.Territorio_Key_RTS INNER JOIN
	Sesiones           ON Territorios.Sesion_Key_RTS = Sesiones.Sesion_Key_RTS         INNER JOIN
                   Dias_Semana   ON Rutas.Ruta_Dia                     = Inicial_Dia_Ingles
  WHERE   Paradas.Ubicacion_Tipo      = 'SIT'
     AND     Paradas.Ubicacion_Region = @Region_ID
     AND     Paradas.Ubicacion_ID          = @Cliente_ID
ORDER BY Sesiones.Sesion_Key_RTS,
                   Territorios.Territorio_Key_RTS,
                   Rutas.Ruta_Key_RTS">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Region_ID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList2" Name="Cliente_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    <p>
        <br />
    </p>
</asp:Content>
