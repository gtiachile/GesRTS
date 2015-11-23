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
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="GesDBTerritorios" DataTextField="Territorio_Txt" DataValueField="Territorio_Key_RTS">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="GesDBTerritorios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT 0 AS Territorio_Key_RTS, 0 AS Sesion_Key_RTS, 'Seleccione Territorio' AS Territorio_Txt,
              0 AS Territorio_Nro, ' ' AS Territorio_ID, ' ' AS Vendedor
  FROM Territorios
UNION
SELECT Territorio_Key_RTS, Sesion_Key_RTS, Territorio_ID + ' - ' +Territorio_Descrip AS Territorio_Txt,
              Territorio_Nro, Territorio_ID, Vendedor
  FROM Territorios
WHERE Territorios.Sesion_Key_RTS = @Sesion_Key_RTS
ORDER BY Territorio_Txt">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList3" DefaultValue="" Name="Sesion_Key_RTS" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style13">Ruta:</td>
                <td>
                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="GesDBRutas" DataTextField="Descripcion_Txt" DataValueField="Ruta_Key_RTS">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="GesDBRutas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT  0 AS Ruta_Key_RTS, 0 AS Sesion_Key_RTS, 0 AS Territorio_Key_RTS, 0 AS Ruta_Nro,
               ' ' AS Ruta_ID, 'Seleccione Ruta' AS Descripcion_Txt, ' ' AS Ruta_Inicio_Tipo, ' ' AS Ruta_Inicio_Ubicacion
FROM    Rutas
UNION
SELECT  Ruta_Key_RTS, Sesion_Key_RTS, Territorio_Key_RTS, Ruta_Nro, Ruta_ID,
               CAST(Ruta_Nro AS VARCHAR(5)) + ' - ' + Ruta_Descrip AS Descripcion_Txt, Ruta_Inicio_Tipo, Ruta_Inicio_Ubicacion
FROM    Rutas
WHERE  Sesion_Key_RTS      = @Sesion_Key_RTS
   AND    Territorio_Key_RTS = @Territorio_Key_RTS">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList3" DefaultValue="" Name="Sesion_Key_RTS" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DropDownList2" Name="Territorio_Key_RTS" PropertyName="SelectedValue" DefaultValue="" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Parada_Key_RTS" DataSourceID="GesDBParadas" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Nro_Secuencia" HeaderText="Secuencia" SortExpression="Nro_Secuencia">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Ubicacion_ID" HeaderText="Cliente" SortExpression="Ubicacion_ID">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DESCRIPTION" HeaderText="Nombre" SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="ADDR_LINE1" HeaderText="Dirección" SortExpression="ADDR_LINE1" />
                <asp:BoundField DataField="COMUNA" HeaderText="Comuna" SortExpression="COMUNA" />
                <asp:TemplateField HeaderText="Llegada" SortExpression="Hra_Llegada">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hra_Llegada") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Hra_Llegada", "{0:t}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tpo.Viaje" SortExpression="Tpo_Viaje">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Tpo_Viaje") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Tpo_Viaje", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Distancia (km)" SortExpression="Distancia_Km">
                    <EditItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Distancia_Km") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Distancia_Km", "{0:N}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apertura" SortExpression="Hora_Apertura">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Hora_Apertura") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Hora_Apertura", "{0:t}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cierre" SortExpression="Hora_Cierre">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Hora_Cierre") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Hora_Cierre", "{0:t}") %>'></asp:Label>
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
        <asp:SqlDataSource ID="GesDBParadas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT DISTINCT Parada_Key_RTS, Nro_Secuencia, Ubicacion_ID, DESCRIPTION, ADDR_LINE1, COMUNA,
                                CAST(CONVERT(VARCHAR(8),DATEADD(SECOND,DATEDIFF(SECOND, '05:00:00', Hora_Llegada),0),114) AS DATETIME) AS Hra_Llegada,
                                CONVERT(VARCHAR(8),DATEADD(SECOND,Tiempo_Servicio,0),114) AS Tpo_Servicio,
                                CONVERT(VARCHAR(8),DATEADD(SECOND,Tiempo_Viaje,0),114) AS Tpo_Viaje,
                                CAST((Distancia/100.00) AS DECIMAL(5,2)) AS Distancia_Km,
                                Hora_Apertura, Hora_Cierre
 FROM  Paradas INNER JOIN
              V_ClientesTP ON  Ubicacion_ID = ID
                                     AND Ubicacion_Region = REGION_ID
WHERE Sesion_Key_RTS     = @Sesion_Key_RTS
    AND  Territory_Key_RTS = @Territory_Nro
    AND  Ruta_Key_RTS        = @Ruta_Key_RTS
ORDER BY Nro_Secuencia">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" DefaultValue="" Name="Sesion_Key_RTS" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="Territory_Nro" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList4" Name="Ruta_Key_RTS" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
