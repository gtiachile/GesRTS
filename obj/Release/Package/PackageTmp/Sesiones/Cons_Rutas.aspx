<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cons_Rutas.aspx.cs" Inherits="BitOp.Sesiones.Cons_Rutas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            font-size: medium;
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
            width: 511px;
        }
        .auto-style46 {
            width: 53px;
        }
        .auto-style49 {
            width: 57px;
        }
        .auto-style51 {
            width: 167px;
        }
        .auto-style53 {
            width: 207px;
        }
        .auto-style56 {
            width: 31px;
        }
        .auto-style57 {
            width: 67px;
        }
        .auto-style58 {
            width: 224px;
        }
        .auto-style60 {
            width: 27px;
        }
        .auto-style61 {
            width: 41px;
        }
        .auto-style62 {
            width: 40px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style10">
        <strong>CONSULTA RUTAS</strong></p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    &nbsp;
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style49">Región:</td>
                            <td class="auto-style51">
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], ([Region_Chile] + ' - ' + [Descripción]) as Region_Txt, [Region_RTS] 
 FROM [Regiones]
ORDER BY [Region_Txt]"></asp:SqlDataSource>
                            </td>
                            <td class="auto-style56">&nbsp;</td>
                            <td class="auto-style46">Sesión:</td>
                            <td class="auto-style53">
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="GesDBSesiones" DataTextField="Descripcion" DataValueField="Sesion_Key_RTS" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="GesDBSesiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT 0 AS Sesion_Key_RTS,'  ' AS Region_ID,'- Seleccione Sesión -' AS Descripcion FROM [Sesiones]
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
                            <td class="auto-style57">Territorio:</td>
                            <td class="auto-style58">
                                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="GesDBTerritorios" DataTextField="Territorio_Txt" DataValueField="Territorio_Key_RTS" ForeColor="Black" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="GesDBTerritorios" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT 0 AS Territorio_Key_RTS, 0 AS Sesion_Key_RTS, 0 AS Territorio_Nro, ' ' AS Territorio_ID,
              ' ' AS Territorio_Descrip, ' ' AS Vendedor, '- Seleccione Territorio -' AS Territorio_Txt
UNION
SELECT Territorio_Key_RTS, Sesion_Key_RTS, Territorio_Nro, Territorio_ID, Territorio_Descrip, Vendedor,
              (cast(Territorio_Nro as varchar) + ' - ' + Territorio_Descrip) AS Territorio_Txt
  FROM Territorios
WHERE Sesion_Key_RTS = @Sesion_Key_RTS">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="Sesion_Key_RTS" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="auto-style60">&nbsp;</td>
                            <td>
                                <asp:Label ID="Lbl_Ruta" runat="server" Text="Nro_Ruta" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </p>
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Ruta_Key_RTS" DataSourceID="GesDBRutas" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                        <asp:BoundField DataField="Dia_Semana" HeaderText="Día" SortExpression="Dia_Semana">
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ruta_Inicio_Tipo" HeaderText="Tipo Inicial" SortExpression="Ruta_Inicio_Tipo">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ruta_Inicio_Ubicacion" HeaderText="Ubicación Inicial" SortExpression="Ruta_Inicio_Ubicacion">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sesion_Key_RTS" HeaderText="Clave TP (Sesión)" SortExpression="Sesion_Key_RTS">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Territorio_Key_RTS" HeaderText="Clave TP (Terr)" SortExpression="Territorio_Key_RTS">
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
                <asp:SqlDataSource ID="GesDBRutas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT Rutas.Ruta_Key_RTS, Rutas.Sesion_Key_RTS, Territorio_Key_RTS, Ruta_Nro, Ruta_ID, Ruta_Descrip,
              Dia_Semana, Ruta_Inicio_Tipo, Ruta_Inicio_Ubicacion,
              (SELECT COUNT(Parada_Key_RTS) FROM Paradas WHERE Paradas.Ruta_Key_RTS = Rutas.Ruta_Key_RTS) 
  FROM Rutas  INNER JOIN
              Dias_Semana ON Ruta_Dia = Inicial_Dia_Ingles
WHERE Territorio_Key_RTS =  @Territorio_Key_RTS">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList3" Name="Territorio_Key_RTS" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView2" runat="server" DataKeyNames="Ruta_Key_RTS" DataSourceID="GesDBRutasFV" Width="581px">
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
                        <asp:TextBox ID="Sesion_Key_RTSTextBox0" runat="server" Text='<%# Bind("Sesion_Key_RTS") %>' />
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
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
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
                        <asp:ControlParameter ControlID="DropDownList3" DefaultValue="" Name="Territorio_Key_RTS" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="Lbl_Ruta" Name="Ruta_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Parada_Key_RTS" DataSourceID="GesDBParadas" ForeColor="#333333" GridLines="None" Width="100%" ShowHeaderWhenEmpty="True">
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
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hra_Llegada") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Hra_Llegada", "{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tpo.Viaje" SortExpression="Tpo_Viaje">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Tpo_Viaje") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Tpo_Viaje", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Distancia (km)" SortExpression="Distancia_Km">
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Distancia_Km") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Distancia_Km") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apertura" SortExpression="Hora_Apertura">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Hora_Apertura") %>'></asp:TextBox>
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
                                CAST(CONVERT(VARCHAR(8),DATEADD(SECOND,
                                DATEDIFF(SECOND, '05:00:00', Hora_Llegada),0),114) AS DATETIME) AS Hra_Llegada,
                                CONVERT(VARCHAR(8),DATEADD(SECOND,Tiempo_Servicio,0),114) AS Tpo_Servicio,
                                CONVERT(VARCHAR(8),DATEADD(SECOND,Tiempo_Viaje,0),114) AS Tpo_Viaje,
                                CAST((Distancia/100.00) AS DECIMAL(5,2)) AS Distancia_Km,
                                Hora_Apertura, Hora_Cierre
 FROM  Paradas INNER JOIN
              V_ClientesTP ON  Ubicacion_ID = ID
                                     AND Ubicacion_Region = REGION_ID
WHERE cast(Sesion_Key_RTS as nvarchar)      = @Sesion_Key_RTS
    AND  cast(Territorio_Key_RTS as nvarchar) = @Territorio_Nro
    AND  cast(Ruta_Key_RTS as nvarchar)         = @Ruta_Key_RTS
ORDER BY Nro_Secuencia">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="Sesion_Key_RTS" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList3" Name="Territorio_Nro" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="Lbl_Ruta" Name="Ruta_Key_RTS" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
