<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cons_TerrVend.aspx.cs" Inherits="BitOp.Sesiones.Cons_TerrVend" %>
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
        <strong>HISTORICO DE TERRITORIOS x VENDEDOR</strong></p>
    <p>
    </p>
    <p>
        Región:&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vendedor:
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="GesDBVendedores" DataTextField="Vendedor_Nombre" DataValueField="Vendedor_ID">
        </asp:DropDownList>
    </p>
    <p>
        <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], ([Region_Chile] + ' - ' + [Descripción]) as Region_Txt, [Region_RTS] 
 FROM [Regiones]
ORDER BY [Region_Txt]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="GesDBVendedores" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT ' ' AS [Vendedor_ID], ' ' AS [Vendedor_Tipo], 'Seleccione Vendedor' AS [Vendedor_Nombre],
              ' ' AS [Region], ' ' AS [Supervisor], ' ' AS [Estado]
  FROM [Vendedores]
UNION
SELECT [Vendedor_ID], [Vendedor_Tipo], [Vendedor_Nombre], [Region], [Supervisor], [Estado]
  FROM [Vendedores]
WHERE [Region] = @Region_ID
    AND [Vendedor_Tipo] = 'Vendedor'">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="Region_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Territorio_Key_RTS" DataSourceID="GesRTSTerritorios" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="90%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Rutas" runat="server" CausesValidation="False" CommandName="Select" Text="Rutas" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Territorio_Nro" HeaderText="Nº Territorio" SortExpression="Territorio_Nro">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Territorio_ID" HeaderText="ID Territorio" SortExpression="Territorio_ID" />
                <asp:BoundField DataField="Territorio_Descrip" HeaderText="Descripción" SortExpression="Territorio_Descrip" />
                <asp:BoundField DataField="Vendedor" HeaderText="Vendedor" SortExpression="Vendedor" />
                <asp:BoundField DataField="Sesion_Key_RTS" HeaderText="ID Sesión" SortExpression="Sesion_Key_RTS">
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
    </p>
    <p>
        <asp:SqlDataSource ID="GesRTSTerritorios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Territorio_Key_RTS], [Sesion_Key_RTS], [Territorio_Nro], [Territorio_ID], [Territorio_Descrip],[Vendedor]
  FROM [Territorios]
WHERE [Vendedor] = @Vendedor_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="Vendedor_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
