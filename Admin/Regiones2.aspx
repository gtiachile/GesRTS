<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Opciones.aspx.cs" Inherits="BitOp.Admin.Opciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

    .auto-style2 {
        height: 25px;
        width: 73px;
    }
    .auto-style4 {
        height: 25px;
        width: 245px;
    }
    .auto-style7 {
        width: 73px;
    }
    .auto-style5 {
        width: 245px;
    }
        .auto-style13 {
            color: #000000;
        }
        .auto-style15 {
            width: 115px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="auto-style13"><strong>REGIONES</strong></h3>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" Width="16px" />
                    &nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agregar Región</asp:LinkButton>
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Region_ID" DataSourceID="BopDBRegionesGV" Width="80%">
                        <Columns>
                            <asp:BoundField DataField="Region_ID" HeaderText="Region_ID" ReadOnly="True" SortExpression="Region_ID" />
                            <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
                            <asp:BoundField DataField="Dirección" HeaderText="Dirección" SortExpression="Dirección" />
                            <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
                            <asp:BoundField DataField="Jefe_Zonal" HeaderText="Jefe_Zonal" SortExpression="Jefe_Zonal" />
                            <asp:BoundField DataField="Region_Chile" HeaderText="Region_Chile" SortExpression="Region_Chile" />
                            <asp:BoundField DataField="Region_RTS" HeaderText="Region_RTS" SortExpression="Region_RTS" />
                            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                        </Columns>
                        <HeaderStyle BackColor="#364E6F" BorderColor="#003366" ForeColor="White" />
                    </asp:GridView>
                </p>
                <p>
                    <asp:SqlDataSource ID="BopDBRegionesGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Regiones]">
                    </asp:SqlDataSource>
                </p>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Region_ID" DataSourceID="BopDBRegionesFV">
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
                        &nbsp;<br />
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style15">Region_ID:</td>
                                <td>
                                    <asp:TextBox ID="Region_IDTextBox" runat="server" Text='<%# Bind("Region_ID") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style15">Descripción:</td>
                                <td>
                                    <asp:TextBox ID="DescripciónTextBox" runat="server" Height="22px" Text='<%# Bind("Descripción") %>' Width="178px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style15">Dirección:</td>
                                <td>
                                    <asp:TextBox ID="DirecciónTextBox" runat="server" Height="22px" Text='<%# Bind("Dirección") %>' Width="348px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style15">Ciudad:</td>
                                <td>
                                    <asp:TextBox ID="CiudadTextBox" runat="server" Text='<%# Bind("Ciudad") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style15">Jefe_Zonal: </td>
                                <td>
                                    <asp:TextBox ID="Jefe_ZonalTextBox" runat="server" Height="22px" Text='<%# Bind("Jefe_Zonal") %>' Width="222px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style15">Region_Chile:</td>
                                <td>
                                    <asp:TextBox ID="Region_ChileTextBox" runat="server" Height="22px" Text='<%# Bind("Region_Chile") %>' Width="18px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style15">Region_RTS:</td>
                                <td>
                                    <asp:TextBox ID="Region_RTSTextBox" runat="server" Height="22px" Text='<%# Bind("Region_RTS") %>' Width="18px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style15">Estado:</td>
                                <td>
                                    <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
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
                    </ItemTemplate>
                </asp:FormView>
                <br />
    <asp:SqlDataSource ID="BopDBRegionesFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Regiones]">
    </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </p>
<p>
    
    </p>
</asp:Content>
