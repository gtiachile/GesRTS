<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cons_UbicRuta.aspx.cs" Inherits="BitOp.Sesiones.Cons_UbicRuta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            font-size: medium;
        }
        .auto-style11 {
            width: 64px;
        }
        .auto-style12 {
            width: 251px;
        }
        .auto-style13 {
            width: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style10">
        <strong>CONSULTA PARADAS POR RUTA</strong></p>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style11">Región:</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], ([Region_Chile] + ' - ' + [Descripción]) as Region_Txt, [Region_RTS] 
 FROM [Regiones]
ORDER BY [Region_Txt]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style13">Sesión:</td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="GesDBSesiones" DataTextField="Descripcion" DataValueField="Sesion_Key_RTS">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="GesDBSesiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT 0 AS [Sesion_Key_RTS], ' ' AS [Region_ID], 'Seleccione una sesión' AS [Descripcion]
  FROM [Sesiones]
UNION
SELECT [Sesion_Key_RTS], [Region_ID], [Descripcion] 
  FROM [Sesiones]
WHERE [Region_ID] = @Region">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Region" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">Territorio:</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="GesDBTerritorios" DataTextField="Territorio_Descrip" DataValueField="Territorio_Key_RTS">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="GesDBTerritorios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT 0 AS Territorio_Key_RTS, 0 AS Sesion_Key_RTS, 'Seleccione Territorio' AS Territorio_Descrip,
              0 AS Territorio_Nro, ' ' AS Territorio_ID, ' ' AS Vendedor
  FROM Territorios
UNION
SELECT Territorios.Territorio_Key_RTS, Territorios.Sesion_Key_RTS, Territorios.Territorio_Descrip,
              Territorios.Territorio_Nro, Territorios.Territorio_ID, Territorios.Vendedor
  FROM Territorios
WHERE Territorios.Sesion_Key_RTS = @Sesion_Key_RTS">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="Sesion_Key_RTS" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style13">Ruta:</td>
                <td>
                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="GesDBRutas" DataTextField="Ruta_Descrip" DataValueField="Ruta_Key_RTS">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="GesDBRutas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT  0 AS Ruta_Key_RTS, 0 AS Sesion_Key_RTS, 0 AS Territorio_Key_RTS, 0 AS Ruta_Nro,
               ' ' AS Ruta_ID, 'Seleccione Ruta' AS Ruta_Descrip, ' ' AS Ruta_Inicio_Tipo, ' ' AS Ruta_Inicio_Ubicacion
FROM    Rutas
UNION
SELECT  Rutas.Ruta_Key_RTS, Rutas.Sesion_Key_RTS, Rutas.Territorio_Key_RTS, Rutas.Ruta_Nro, Ruta_ID,
               Rutas.Ruta_Descrip, Rutas.Ruta_Inicio_Tipo, Rutas.Ruta_Inicio_Ubicacion
FROM    Rutas
WHERE  Rutas.Sesion_Key_RTS      = @Sesion_Key_RTS
   AND    Rutas.Territorio_Key_RTS = @Territorio_Key_RTS">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="Sesion_Key_RTS" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DropDownList3" Name="Territorio_Key_RTS" PropertyName="SelectedValue" DefaultValue="" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Parada_Key_RTS" DataSourceID="GesDBParadas" ForeColor="#333333" GridLines="None" PageSize="12" ShowHeaderWhenEmpty="True" Width="90%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Ubicacion_ID" HeaderText="Cliente" SortExpression="Ubicacion_ID">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Nro_Secuencia" HeaderText="Nº Secuencia" SortExpression="Nro_Secuencia">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Hora Llegada" SortExpression="Hora_Llegada">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Hora_Llegada") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Hora_Llegada", "{0:t}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="Tiempo_Servicio" HeaderText="Tiempo Servicio" SortExpression="Tiempo_Servicio">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Tiempo_Viaje" HeaderText="Tiempo Viaje" SortExpression="Tiempo_Viaje">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Distancia" HeaderText="Distancia" SortExpression="Distancia">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Hora Apertura" SortExpression="Hora_Apertura">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Hora_Apertura") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Hora_Apertura", "{0:t}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hora Cierre" SortExpression="Hora_Cierre">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Hora_Cierre") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Hora_Cierre", "{0:t}") %>'></asp:Label>
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
        <asp:SqlDataSource ID="GesDBParadas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Parada_Key_RTS], [Ubicacion_ID], [Nro_Secuencia], [Hora_Llegada], [Tiempo_Servicio], [Tiempo_Viaje],
              [Distancia], [Hora_Apertura], [Hora_Cierre]
 FROM  [Paradas]
WHERE [Sesion_Key_RTS]     = @Sesion_Key_RTS
    AND  [Territory_Key_RTS] = @Territory_Nro
    AND  [Ruta_Key_RTS]        = @Ruta_Key_RTS">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="Sesion_Key_RTS" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList3" DefaultValue="" Name="Territory_Nro" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList4" Name="Ruta_Key_RTS" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
