<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cons_Audita.aspx.cs" Inherits="BitOp.Sesiones.Con_Audita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            font-size: medium;
        }
        .auto-style13 {
            width: 30px;
        }
        .auto-style16 {
            width: 48px;
        }
        .auto-style19 {
            width: 44px;
        }
        .auto-style21 {
            width: 200px;
        }
        .auto-style22 {
            width: 158px;
        }
        .auto-style23 {
            width: 45px;
        }
        .auto-style24 {
            width: 201px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <span class="auto-style10"><strong>CONSULTAS DE AUDITORIA</strong></span><br />
    </p>
    <p>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style19">Región:</td>
                <td class="auto-style21">
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" Width="200px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], ([Region_Chile] + ' - ' + [Descripción]) as Region_Txt, [Region_RTS] 
 FROM [Regiones]
ORDER BY [Region_Txt]"></asp:SqlDataSource>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style16">Usuario:</td>
                <td class="auto-style22">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="GesDBUsuarios" DataTextField="Nombre" DataValueField="Usuario" Width="180px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="GesDBUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT  ' ' AS Usuario, '- Seleccione Usuario -' AS Nombre
  FROM  Usuarios
UNION
SELECT  Usuario, Nombre
  FROM  Usuarios"></asp:SqlDataSource>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style23">Opción: </td>
                <td class="auto-style24">
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="GesDBOpciones" DataTextField="Descripción" DataValueField="Opcion" Width="180px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="GesDBOpciones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT ' ' AS Opcion, '- Seleccione Opción -' AS Descripción
  FROM Opciones
UNION
SELECT Opcion, Descripción
  FROM Opciones
WHERE Audita = 'Si'"></asp:SqlDataSource>
                </td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style19">Desde:</td>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style16">Hasta:</td>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style23">&nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
            </tr>
        </table>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Fecha_Hora_Evento" DataSourceID="GesDBAudita" ForeColor="#333333" GridLines="None" PageSize="12" ShowHeaderWhenEmpty="True" Width="90%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Fecha Evento" SortExpression="Fecha_Hora_Evento">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Fecha_Hora_Evento") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Fecha_Hora_Evento", "{0:g}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="Opcion_ID" HeaderText="Opción" SortExpression="Opcion_ID">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                <asp:BoundField DataField="Region" HeaderText="Región" SortExpression="Region">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Accion" HeaderText="Acción" SortExpression="Accion" />
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
        <asp:SqlDataSource ID="GesDBAudita" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="IF  @Usuario = ' '
    IF @Opcion_ID = ' '
        BEGIN
           SELECT Fecha_Hora_Evento, Opcion_ID, Usuario, Region, Accion
             FROM Audita
             WHERE Region      = @Region_ID
             ORDER BY Fecha_Hora_Evento DESC
        END
    ELSE
        BEGIN
           SELECT Fecha_Hora_Evento, Opcion_ID, Usuario, Region, Accion
             FROM Audita
             WHERE Region      = @Region_ID
                 AND Opcion_ID = @Opcion_ID
             ORDER BY Fecha_Hora_Evento DESC
        END
ELSE
    IF @Opcion_ID = ' '
        BEGIN
           SELECT Fecha_Hora_Evento, Opcion_ID, Usuario, Region, Accion
             FROM Audita
           WHERE Region      = @Region_ID
               AND Usuario      = @Usuario
           ORDER BY Fecha_Hora_Evento DESC
        END
    ELSE
        BEGIN
            SELECT Fecha_Hora_Evento, Opcion_ID, Usuario, Region, Accion
              FROM Audita
            WHERE Region      = @Region_ID
                AND Usuario      = @Usuario
                AND Opcion_ID = @Opcion_ID
           ORDER BY Fecha_Hora_Evento DESC
       END">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="Usuario" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList3" DefaultValue="" Name="Opcion_ID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="Region_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
</asp:Content>
