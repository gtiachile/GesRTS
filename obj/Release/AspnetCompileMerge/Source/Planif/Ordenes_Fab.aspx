﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ordenes_Fab.aspx.cs" Inherits="BitOp.Planif.Ordenes_Fab" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style2 {
            width: 398px;
        }
        .auto-style3 {
            width: 232px;
        }
        .auto-style7 {
            width: 340px;
        }
        .auto-style8 {
            width: 194px;
        }
        .auto-style9 {
            width: 178px;
        }
        .auto-style10 {
            width: 359px;
        }
        .auto-style13 {
            width: 394px;
        }
        .auto-style14 {
            width: 391px;
        }
        .auto-style15 {
            width: 388px;
        }
        .auto-style16 {
            width: 384px;
        }
        .auto-style17 {
            width: 372px;
        }
        .auto-style18 {
            width: 357px;
        }
        .auto-style19 {
            width: 355px;
        }
        .auto-style20 {
            width: 345px;
        }
        .auto-style21 {
            width: 332px;
        }
        .auto-style22 {
            width: 327px;
        }
        .auto-style23 {
            width: 308px;
        }
        .auto-style24 {
            width: 178px;
            color: #000000;
            margin-left: 78px;
        }
        .auto-style25 {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        ORDENES DE FABRICACION</p>
        <table style="width:75%;">
            <tr>
                <td class="auto-style2" colspan="5">
        <asp:SqlDataSource ID="BopDBPlanta" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT * FROM [Plantas] where Estado='Activo'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="BopDBAreas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT * FROM [Areas] WHERE ([Planta] = @Planta)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListPlantas" Name="Planta" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="BopDBTurnosPlanta" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT * FROM [TurnoPlanta] where estado='Activo' and [Planta]=@Planta">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListPlantas" Name="Planta" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="BopDBOrdenesFab" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [OrdenesFabricacion] WHERE [OrdenFab] = @OrdenFab" InsertCommand="INSERT INTO [OrdenesFabricacion] ([OrdenFab], [FechaPlanif], [Area], [Turno], [Material], [CantidadPlanif], [TiempoPlanif], [Prioridad], [Fecha Lote], [Observaciones], [Planificador]) VALUES (@OrdenFab, @FechaPlanif, @Area, @Turno, @Material, @CantidadPlanif, @TiempoPlanif, @Prioridad, @Fecha_Lote, @Observaciones, @Planificador)" SelectCommand="SELECT OrdenesFabricacion.FechaPlanif, OrdenesFabricacion.OrdenFab, OrdenesFabricacion.FechaPlanif AS FechaPlanif, OrdenesFabricacion.Area, OrdenesFabricacion.Turno, OrdenesFabricacion.Material +' - '+Productos.Producto as MaterialDesc ,OrdenesFabricacion.Material as Material, OrdenesFabricacion.CantidadPlanif, OrdenesFabricacion.TiempoPlanif, OrdenesFabricacion.Prioridad, OrdenesFabricacion.[Fecha Lote] AS Fecha_Lote, OrdenesFabricacion.Observaciones, OrdenesFabricacion.Planificador FROM OrdenesFabricacion INNER JOIN Productos ON OrdenesFabricacion.Material = Productos.Material WHERE (OrdenesFabricacion.Area = @Area) AND (OrdenesFabricacion.FechaPlanif = @FechaPlanif) AND (OrdenesFabricacion.Turno = @Turno)" UpdateCommand="UPDATE [OrdenesFabricacion] SET [FechaPlanif] = @FechaPlanif, [Area] = @Area, [Turno] = @Turno, [Material] = @Material, [CantidadPlanif] = @CantidadPlanif, [TiempoPlanif] = @TiempoPlanif, [Prioridad] = @Prioridad, [Fecha Lote] = @Fecha_Lote, [Observaciones] = @Observaciones, [Planificador] = @Planificador WHERE [OrdenFab] = @OrdenFab">
            <DeleteParameters>
                <asp:Parameter Name="OrdenFab" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OrdenFab" Type="String" />
                <asp:Parameter Name="FechaPlanif" Type="String" />
                <asp:Parameter Name="Area" Type="String" />
                <asp:Parameter Name="Turno" Type="String" />
                <asp:Parameter Name="Material" Type="String" />
                <asp:Parameter Name="CantidadPlanif" Type="Int32" />
                <asp:Parameter Name="TiempoPlanif" Type="Decimal" />
                <asp:Parameter Name="Prioridad" Type="String" />
                <asp:Parameter Name="Fecha_Lote" Type="String" />
                <asp:Parameter Name="Observaciones" Type="String" />
                <asp:Parameter Name="Planificador" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownAreas" Name="Area" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TextBoxFechaProd" Name="FechaPlanif" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList1" Name="Turno" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FechaPlanif" Type="String" />
                <asp:Parameter Name="Area" Type="String" />
                <asp:Parameter Name="Turno" Type="String" />
                <asp:Parameter Name="Material" Type="String" />
                <asp:Parameter Name="CantidadPlanif" Type="Int32" />
                <asp:Parameter Name="TiempoPlanif" Type="Decimal" />
                <asp:Parameter Name="Prioridad" Type="String" />
                <asp:Parameter Name="Fecha_Lote" Type="String" />
                <asp:Parameter Name="Observaciones" Type="String" />
                <asp:Parameter Name="Planificador" Type="String" />
                <asp:Parameter Name="OrdenFab" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="BopDBMaterialNuevo" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Material], [Producto] FROM [Productos] WHERE ([Planta] = @Planta) and estado='Activo'">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListPlantas" Name="Planta" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Fecha Producción:
                    &nbsp;&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBoxFechaProd" runat="server" TextMode="Date" style="margin-left: 0px" Width="166px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">Planta:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownListPlantas" runat="server" AutoPostBack="True" DataSourceID="BopDBPlanta" DataTextField="Descripción" DataValueField="Planta">
                    </asp:DropDownList>
                </td>
                <td class="auto-style7"><span class="auto-style25">Area:</span>&nbsp;
                    <asp:DropDownList ID="DropDownAreas" runat="server" DataSourceID="BopDBAreas" DataTextField="Descripción" DataValueField="Area">
                    </asp:DropDownList>
                </td>
                <td class="auto-style8"><span class="auto-style25">Turno:</span>&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="BopDBTurnosPlanta" DataTextField="Turno" DataValueField="Codigo" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="ButtonBuscar" runat="server" BorderStyle="None" BorderWidth="0px" OnClick="ButtonBuscar_Click" Text="Buscar" />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrdenFab" DataSourceID="BopDBOrdenesFab" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" ShowFooter="True" style="margin-right: 206px; text-align: right;" Width="100%">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Update" />
                                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/Cancel.png" Text="Cancel" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Select" ImageUrl="~/Images/NewRow.png" />
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Edit" />
                                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" Text="Delete" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="OF" SortExpression="OrdenFab">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("OrdenFab") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TextBoxInsOF" runat="server" Load="TextBoxInsOF_Load" Visible="False" Width="100px"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("OrdenFab") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha" SortExpression="FechaPlanif">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxFechaPlanif" runat="server" style="margin-left: 19px" Text='<%# Bind("FechaPlanif") %>' TextMode="Date" Width="120px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("FechaPlanif") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Area" SortExpression="Area">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" Text='<%# Bind("Area") %>' Width="50px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Area") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Turno" SortExpression="Turno">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="BopDBTurnosPlantaGV" DataTextField="Descripción" DataValueField="Codigo" SelectedValue='<%# Bind("Turno") %>' Width="80px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="BopDBTurnosPlantaGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Codigo], [Descripción] FROM [TurnoPlanta] WHERE ([Planta] = @Planta)  and (Estado = 'Activo')">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DropDownListPlantas" Name="Planta" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Turno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Producto" SortExpression="Material">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="BopBDMaterialGV" DataTextField="Producto" DataValueField="Material" SelectedValue='<%# Bind("Material") %>' Width="200px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="BopBDMaterialGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Material], [Producto] FROM [Productos]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:DropDownList ID="DropDownListMaterial" runat="server" DataSourceID="BopDBMaterial" DataTextField="Producto" DataValueField="Material" Width="200px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="BopDBMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Material], [Producto] FROM [Productos] WHERE ([Planta] = @Planta) and estado='Activo'">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DropDownListPlantas" Name="Planta" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("MaterialDesc") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cantidad Plan" SortExpression="CantidadPlanif">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CantidadPlanif", "{0:D}") %>'  TextMode="Number" Width="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TextBoxCantidadPlanif" runat="server" TextMode="Number" Width="80px"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("CantidadPlanif", "{0:D}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tiempo Est." SortExpression="TiempoPlanif">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TiempoPlanif", "{0:N}") %>' TextMode="Number" Width="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TextBoxTiempoPlan" runat="server" TextMode="Number" Visible="False" Width="80px"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("TiempoPlanif", "{0:N}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Prioridad" SortExpression="Prioridad">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("Prioridad") %>'>
                                            <asp:ListItem>Media</asp:ListItem>
                                            <asp:ListItem>Baja</asp:ListItem>
                                            <asp:ListItem>Alta</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:DropDownList ID="DropDownListPrio" runat="server" Width="60px">
                                            <asp:ListItem>Media</asp:ListItem>
                                            <asp:ListItem>Baja</asp:ListItem>
                                            <asp:ListItem>Alta</asp:ListItem>
                                        </asp:DropDownList>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Prioridad") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fechado" SortExpression="Fecha_Lote">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Fecha_Lote") %>' TextMode="Date" Width="120px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TextBoxFechaLot" runat="server" TextMode="Date" Width="100px"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Fecha_Lote") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Obs." SortExpression="Observaciones">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Observaciones") %>' Width="250px" MaxLength="100" TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TextBoxObs" runat="server" Width="250px" TextMode="MultiLine"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Observaciones") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#003366" ForeColor="White" />
                        </asp:GridView>
                    <asp:Panel ID="EmptyPanel" runat="server" Width="100%">
                        <table style="width: 100%;">
                            <tr>
                                <td class="auto-style23">&nbsp;</td>
                                <td class="auto-style16"><strong>OF</strong></td>
                                <td class="auto-style22"><span class="auto-style25">Producto</span></td>
                                <td class="auto-style21">Cantidad Plan</span></td>
                                <td class="auto-style20">&nbsp;</td>
                                <td class="auto-style19"><span class="auto-style25">Prio.</span></td>
                                <td class="auto-style18">Fechado</span></td>
                                <td class="auto-style24">Obs</td>
                            </tr>
                            <tr>
                                <td class="auto-style23">
                                    <asp:ImageButton ID="BT_Nuevo" runat="server" ImageUrl="~/Images/NewRow.png" OnClick="BT_Nuevo_Click" style="height: 16px" ValidationGroup="VG_nuevo_plan" />
                                </td>
                                <td class="auto-style25">
                                    <asp:TextBox ID="TextBoxInsOF0" runat="server" Width="100px" OnPreRender="TextBoxInsOF0_PreRender"></asp:TextBox>
                                </td>
                                <td class="auto-style13">
                                    <asp:DropDownList ID="DropDownListMaterial0" runat="server" DataSourceID="BopDBMaterialNuevo" DataTextField="Producto" DataValueField="Material" Width="200px">
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style17">
                                    <asp:TextBox ID="TextBoxCantidadPlanif0" runat="server" TextMode="Number" Width="80px" ValidationGroup="VG_nuevo_plan" ></asp:TextBox>
                                </td>
                                <td class="auto-style14">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCantidadPlanif0" ErrorMessage="*" ForeColor="Red" ValidationGroup="VG_nuevo_plan"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style10">
                                    <asp:DropDownList ID="DropDownListPrio0" runat="server" Width="60px">
                                        <asp:ListItem>Media</asp:ListItem>
                                        <asp:ListItem>Baja</asp:ListItem>
                                        <asp:ListItem>Alta</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="TextBoxFechaLot0" runat="server" TextMode="Date" Width="100px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxObs0" runat="server" Width="300px" MaxLength="100" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    </asp:Content>
