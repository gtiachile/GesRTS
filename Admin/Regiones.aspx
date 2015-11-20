<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Regiones.aspx.cs" Inherits="BitOp.Admin.Regiones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 195px;
        }
        .auto-style12 {
            width: 237px;
        }
        .auto-style13 {
            color: #000000;
            font-size: medium;
        }
        .auto-style18 {
            width: 220px;
        }
        .auto-style22 {
            width: 441px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style13">
        <strong>REGIONES</strong></p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click1" />
                &nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click1">Agregar Región</asp:LinkButton>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Region_ID" DataSourceID="GesDBRegionesGV" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="90%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/Cancel.png" Text="Cancelar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Editar" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); " Text="Eliminar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Region_ID" HeaderText="ID Región" ReadOnly="True" SortExpression="Region_ID" />
                        <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
                        <asp:BoundField DataField="Dirección" HeaderText="Dirección" SortExpression="Dirección" />
                        <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
                        <asp:BoundField DataField="Jefe_Zonal" HeaderText="Jefe Zonal" SortExpression="Jefe_Zonal" />
                        <asp:BoundField DataField="Region_Chile" HeaderText="Region Chile" SortExpression="Region_Chile" />
                        <asp:BoundField DataField="Region_RTS" HeaderText="Region RTS" SortExpression="Region_RTS" />
                        <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Estado") %>'>
                                    <asp:ListItem>Activo</asp:ListItem>
                                    <asp:ListItem>Inactivo</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                            </ItemTemplate>
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
                <asp:SqlDataSource ID="GesDBRegionesGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], [Descripción], [Dirección], [Ciudad], [Jefe_Zonal], [Region_Chile], [Region_RTS], [Estado] 
FROM [Regiones]
ORDER BY [Region_Chile]" DeleteCommand="DELETE FROM [Regiones] 
WHERE  [Region_ID] = @Region_ID" InsertCommand="p_ValidaInsertaRegion" InsertCommandType="StoredProcedure" UpdateCommand="UPDATE [Regiones] SET [Descripción] = @Descripción, [Dirección] = @Dirección, [Ciudad] = @Ciudad, [Jefe_Zonal] = @Jefe_Zonal, [Region_Chile] = @Region_Chile, [Region_RTS] = @Region_RTS, [Estado] = @Estado 
WHERE  [Region_ID] = @Region_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="Region_ID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Region_ID" Type="String" />
                        <asp:Parameter Name="Descripción" Type="String" />
                        <asp:Parameter Name="Dirección" Type="String" />
                        <asp:Parameter Name="Ciudad" Type="String" />
                        <asp:Parameter Name="Jefe_Zonal" Type="String" />
                        <asp:Parameter Name="Region_Chile" Type="String" />
                        <asp:Parameter Name="Region_RTS" Type="String" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter Name="Done" Type="Boolean" />
                        <asp:Parameter Name="Msg" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Descripción" />
                        <asp:Parameter Name="Dirección" />
                        <asp:Parameter Name="Ciudad" />
                        <asp:Parameter Name="Jefe_Zonal" />
                        <asp:Parameter Name="Region_Chile" />
                        <asp:Parameter Name="Region_RTS" />
                        <asp:Parameter Name="Estado" />
                        <asp:Parameter Name="Region_ID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Region_ID" DataSourceID="GesDBRegionesGV" DefaultMode="Insert" Width="655px">
                    <EditItemTemplate>
                        Region_ID:
                        <asp:Label ID="Region_IDLabel1" runat="server" Text='<%# Eval("Region_ID") %>' />
                        <br />
                        Descripción:
                        <asp:TextBox ID="DescripciónTextBox" runat="server" Text='<%# Bind("Descripción") %>' />
                        <br />
                        Dirección:
                        <asp:TextBox ID="DirecciónTextBox" runat="server" Text='<%# Bind("Dirección") %>' />
                        <br />
                        Ciudad:
                        <asp:TextBox ID="CiudadTextBox" runat="server" Text='<%# Bind("Ciudad") %>' />
                        <br />
                        Jefe_Zonal:
                        <asp:TextBox ID="Jefe_ZonalTextBox" runat="server" Text='<%# Bind("Jefe_Zonal") %>' />
                        <br />
                        Region_Chile:
                        <asp:TextBox ID="Region_ChileTextBox" runat="server" Text='<%# Bind("Region_Chile") %>' />
                        <br />
                        Region_RTS:
                        <asp:TextBox ID="Region_RTSTextBox" runat="server" Text='<%# Bind("Region_RTS") %>' />
                        <br />
                        Estado:
                        <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style22">ID Región: </td>
                                <td class="auto-style18">
                                    <asp:TextBox ID="Region_IDTextBox" runat="server" Text='<%# Bind("Region_ID") %>' />
                                </td>
                                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                <td class="auto-style12">Descripción:</td>
                                <td>
                                    <asp:TextBox ID="DescripciónTextBox" runat="server" Text='<%# Bind("Descripción") %>' Width="300px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style22">Dirección:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                <td class="auto-style18">
                                    <asp:TextBox ID="DirecciónTextBox" runat="server" Height="22px" Text='<%# Bind("Dirección") %>' Width="300px" />
                                </td>
                                <td class="auto-style11">&nbsp;</td>
                                <td class="auto-style12">Ciudad:</td>
                                <td>
                                    <asp:TextBox ID="CiudadTextBox" runat="server" Height="25px" Text='<%# Bind("Ciudad") %>' Width="147px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style22">Jefe Zonal:</td>
                                <td class="auto-style18">
                                    <asp:TextBox ID="Jefe_ZonalTextBox" runat="server" Text='<%# Bind("Jefe_Zonal") %>' />
                                </td>
                                <td class="auto-style11">&nbsp;</td>
                                <td class="auto-style12">Estado:</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Estado") %>'>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style22">Región Chile:</td>
                                <td class="auto-style18">
                                    <asp:TextBox ID="Region_ChileTextBox" runat="server" Height="22px" Text='<%# Bind("Region_Chile") %>' Width="30px" />
                                </td>
                                <td class="auto-style11">&nbsp;</td>
                                <td class="auto-style12">Región RTS:</td>
                                <td>
                                    <asp:TextBox ID="Region_RTSTextBox" runat="server" Height="22px" Text='<%# Bind("Region_RTS") %>' Width="30px" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click" Text="Insertar" />
                        &nbsp;&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertCancelButton_Click" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Region_ID:
                        <asp:Label ID="Region_IDLabel" runat="server" Text='<%# Eval("Region_ID") %>' />
                        <br />
                        Descripción:
                        <asp:Label ID="DescripciónLabel" runat="server" Text='<%# Bind("Descripción") %>' />
                        <br />
                        Dirección:
                        <asp:Label ID="DirecciónLabel" runat="server" Text='<%# Bind("Dirección") %>' />
                        <br />
                        Ciudad:
                        <asp:Label ID="CiudadLabel" runat="server" Text='<%# Bind("Ciudad") %>' />
                        <br />
                        Jefe_Zonal:
                        <asp:Label ID="Jefe_ZonalLabel" runat="server" Text='<%# Bind("Jefe_Zonal") %>' />
                        <br />
                        Region_Chile:
                        <asp:Label ID="Region_ChileLabel" runat="server" Text='<%# Bind("Region_Chile") %>' />
                        <br />
                        Region_RTS:
                        <asp:Label ID="Region_RTSLabel" runat="server" Text='<%# Bind("Region_RTS") %>' />
                        <br />
                        Estado:
                        <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
                    </ItemTemplate>
                </asp:FormView>
                <br />
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
