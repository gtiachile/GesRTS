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
        .auto-style18 {
            width: 87px;
        }
        .auto-style20 {
            width: 118px;
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
                                <asp:Label ID="Lbl_Sesion" runat="server" Text="Label"></asp:Label>
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
                                <asp:DropDownList ID="DropDownVendedor" runat="server" AutoPostBack="True" DataSourceID="GesDBVendedores" DataTextField="Vendedor_Nombre" DataValueField="Vendedor_ID" Height="22px" OnSelectedIndexChanged="DropDownVendedor_SelectedIndexChanged" Width="180px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="GesDBVendedores" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT ' ' AS [Vendedor_ID], ' ' AS [Vendedor_Tipo], 'Seleccione Vendedor' AS [Vendedor_Nombre],
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
                                <asp:Label ID="Lbl_Territorio" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style17">
                                &nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </p>
                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Territorio_Key_RTS" DataSourceID="GesRTSTerritorios" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="90%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Rutas" runat="server" CausesValidation="False" CommandName="Select" OnClick="Rutas_Click1" Text="Rutas" />
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
                        <asp:TemplateField HeaderText="Clave TP (Terr)" SortExpression="Territorio_Key_RTS">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Territorio_Key_RTS") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Territorio_Key_RTS") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Clave TP (Sesión)" SortExpression="Sesion_Key_RTS">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>'></asp:Label>
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
                <asp:SqlDataSource ID="GesRTSTerritorios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Territorio_Key_RTS, Sesion_Key_RTS, Territorio_Nro, Territorio_ID, Territorio_Descrip, Vendedor_Nombre
  FROM Territorios INNER JOIN
              Vendedores ON Vendedor = Vendedor_ID
WHERE  Vendedor = @Vendedor_ID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownVendedor" Name="Vendedor_ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Territorio_Key_RTS" DataSourceID="GesDBTerritoriosFV">
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
                        Vendedor_Nombre:
                        <asp:TextBox ID="Vendedor_NombreTextBox" runat="server" Text='<%# Bind("Vendedor_Nombre") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style18">ID Sesión:</td>
                                <td>
                                    <asp:Label ID="Sesion_Key_RTSLabel" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' />
                                </td>
                                <td>&nbsp;</td>
                                <td class="auto-style20">&nbsp;</td>
                                <td>
                                    <asp:Label ID="Territorio_Key_RTSLabel" runat="server" Text='<%# Eval("Territorio_Key_RTS") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style18">Nº Territorio:</td>
                                <td>
                                    <asp:Label ID="Territorio_NroLabel" runat="server" Text='<%# Bind("Territorio_Nro") %>' />
                                </td>
                                <td>&nbsp;</td>
                                <td class="auto-style20">Descrip. Territorio:</td>
                                <td>
                                    <asp:Label ID="Territorio_DescripLabel" runat="server" Text='<%# Bind("Territorio_Descrip") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style18">ID Territorio:</td>
                                <td>
                                    <asp:Label ID="Territorio_IDLabel" runat="server" Text='<%# Bind("Territorio_ID") %>' />
                                </td>
                                <td>&nbsp;</td>
                                <td class="auto-style20">Vendedor:</td>
                                <td>
                                    <asp:Label ID="Vendedor_NombreLabel" runat="server" Text='<%# Bind("Vendedor_Nombre") %>' />
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="GesDBTerritoriosFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Territorio_Key_RTS, Sesion_Key_RTS, Territorio_Nro, Territorio_ID, Territorio_Descrip, Vendedor_Nombre
  FROM Territorios INNER JOIN
              Vendedores ON Vendedor = Vendedor_ID
WHERE  Territorio_Key_RTS = @Territorio_Key_RTS">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Lbl_Territorio" Name="Territorio_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Ruta_Key_RTS" DataSourceID="GesDBRutas" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="90%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Paradas" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Ruta_Nro" HeaderText="Nº Ruta" SortExpression="Ruta_Nro">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ruta_ID" HeaderText="ID Ruta" SortExpression="Ruta_ID">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ruta_Descrip" HeaderText="Descripción Ruta" SortExpression="Ruta_Descrip" />
                        <asp:BoundField DataField="Dia_Semana" HeaderText="Dia" SortExpression="Dia_Semana" />
                        <asp:BoundField DataField="Ruta_Inicio_Tipo" HeaderText="Tipo Inicio" SortExpression="Ruta_Inicio_Tipo" />
                        <asp:BoundField DataField="Ruta_Inicio_Ubicacion" HeaderText="Ubicación Inicio" SortExpression="Ruta_Inicio_Ubicacion" />
                        <asp:BoundField DataField="Ruta_Key_RTS" HeaderText="Clave TP (Ruta)" ReadOnly="True" SortExpression="Ruta_Key_RTS">
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
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="ButtonVolver" runat="server" OnClick="ButtonVolver_Click" Text="Volver" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:SqlDataSource ID="GesDBRutas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Ruta_Key_RTS], [Sesion_Key_RTS], [Territorio_Key_RTS], [Ruta_Nro], [Ruta_ID], [Ruta_Descrip],
              [Dia_Semana], [Ruta_Inicio_Tipo], [Ruta_Inicio_Ubicacion] 
  FROM [Rutas]  INNER JOIN
              [Dias_Semana] ON [Ruta_Dia] = [Inicial_Dia_Ingles]
WHERE Territorio_Key_RTS =  @Territorio_Key_RTS">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="FormView1" Name="Territorio_Key_RTS" PropertyName="SelectedValue" DefaultValue="0" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </p>
    </asp:Content>
