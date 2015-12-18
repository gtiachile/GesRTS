<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cons_RutasClteTrab.aspx.cs" Inherits="BitOp.Sesiones.Cons_TerrClte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            font-size: medium;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style10">
        <strong>RUTAS x CLIENTE (En Fase Diseño)</strong></p>
    <p>
        Región:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Búsqueda:
        <asp:TextBox ID="TextBoxBusqueda" runat="server" MaxLength="15" OnTextChanged="TextBoxBusqueda_TextChanged" AutoPostBack="True"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; Cliente :
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="GesDBClientes" DataTextField="Nombre_Cliente" DataValueField="ID">
        </asp:DropDownList>
    </p>
        <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], ([Region_Chile] + ' - ' + [Descripción]) as Region_Txt, [Region_RTS] 
 FROM [Regiones]
ORDER BY [Region_Txt]"></asp:SqlDataSource>
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
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="GesRTSTerritorios" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="RN_SESSION_PKEY" HeaderText="ID Sesión" SortExpression="RN_SESSION_PKEY">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="DESCRIPTION" HeaderText="Nombre Sesión" SortExpression="DESCRIPTION" />
            <asp:BoundField DataField="TERRITORY_PKEY" HeaderText="ID Territorio" SortExpression="TERRITORY_PKEY">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="DESCRIPTION1" HeaderText="Descrip. Territorio" SortExpression="DESCRIPTION1" />
            <asp:BoundField DataField="ROUTE_ID" HeaderText="ID Ruta" SortExpression="ROUTE_ID">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ROUTE_NUMBER" HeaderText="Nº Ruta" SortExpression="ROUTE_NUMBER">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Dia" SortExpression="INITIAL_DAY">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("INITIAL_DAY") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Dia_Nombre_Corto") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="SEQUENCE_NUMBER" HeaderText="Sec" SortExpression="SEQUENCE_NUMBER">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="STOP_IX" HeaderText="Parada" SortExpression="STOP_IX">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Prom. Fact." SortExpression="CYCLE_QTY_SIZE1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CYCLE_QTY_SIZE1") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CYCLE_QTY_SIZE1", "{0:C0}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Prom. Kilos" SortExpression="CYCLE_QTY_SIZE2">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CYCLE_QTY_SIZE2") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CYCLE_QTY_SIZE2", "{0:F0}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Carga Trab." SortExpression="CYCLE_QTY_SIZE3">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CYCLE_QTY_SIZE3") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("CYCLE_QTY_SIZE3", "{0:F5}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
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
        <asp:SqlDataSource ID="GesRTSTerritorios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT	V_ParadasTP.RN_SESSION_PKEY, V_SesionesTP.DESCRIPTION,
	V_RutasTP.TERRITORY_PKEY, V_TerritoriosTP.DESCRIPTION,
	V_ParadasTP.ROUTE_PKEY, V_RutasTP.ROUTE_ID, V_RutasTP.ROUTE_NUMBER,
	Dia_Nombre_Corto,V_ParadasTP.LOCATION_ID, V_ParadasTP.SEQUENCE_NUMBER,
	V_ParadasTP.STOP_IX, V_Ext_ParadasTP.CYCLE_QTY_SIZE1, V_Ext_ParadasTP.CYCLE_QTY_SIZE2,
	V_Ext_ParadasTP.CYCLE_QTY_SIZE3 
  FROM     V_ParadasTP                                                                                                                      INNER JOIN
	V_Ext_ParadasTP ON V_Ext_ParadasTP.PKEY                       = V_ParadasTP.LOCATION_EXTENSION_PKEY
                                                                                                                                                               INNER JOIN
                   V_RutasTP            ON V_ParadasTP.ROUTE_PKEY               = V_RutasTP.PKEY         INNER JOIN
	V_TerritoriosTP    ON V_RutasTP.TERRITORY_PKEY           = V_TerritoriosTP.PKEY INNER JOIN
	V_SesionesTP       ON V_TerritoriosTP.RN_SESSION_PKEY = V_SesionesTP.PKEY    INNER JOIN
                   Dias_Semana       ON INITIAL_DAY                                       = Inicial_Dia_Ingles
  WHERE   V_ParadasTP.LOCATION_TYPE            = 'SIT'
     AND     V_ParadasTP.LOCATION_REGION_ID = @Region_ID
     AND     V_ParadasTP.LOCATION_ID                 = @Cliente_ID
ORDER BY V_SesionesTP.DATE_MODIFIED DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Region_ID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList2" Name="Cliente_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Content>
