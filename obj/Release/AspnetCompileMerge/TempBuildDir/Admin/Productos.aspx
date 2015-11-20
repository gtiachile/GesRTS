﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="BitOp.Admin.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 251px;
        }
        .auto-style10 {
            width: 356px;
            text-align: left;
        }
        .auto-style11 {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>PRODUCTOS</h3>
    <p>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Material" DataSourceID="BopDBProductosFV" DefaultMode="Insert">
        <EditItemTemplate>
            Material:
            <asp:Label ID="MaterialLabel1" runat="server" Text='<%# Eval("Material") %>' />
            <br />
            Producto:
            <asp:TextBox ID="ProductoTextBox" runat="server" Text='<%# Bind("Producto") %>' />
            <br />
            CodigoMarca:
            <asp:TextBox ID="CodigoMarcaTextBox" runat="server" Text='<%# Bind("CodigoMarca") %>' />
            <br />
            Planta:
            <asp:TextBox ID="PlantaTextBox" runat="server" Text='<%# Bind("Planta") %>' />
            <br />
            Proceso:
            <asp:TextBox ID="ProcesoTextBox" runat="server" Text='<%# Bind("Proceso") %>' />
            <br />
            CodigoFamilia:
            <asp:TextBox ID="CodigoFamiliaTextBox" runat="server" Text='<%# Bind("CodigoFamilia") %>' />
            <br />
            IndSemielaborado:
            <asp:TextBox ID="IndSemielaboradoTextBox" runat="server" Text='<%# Bind("IndSemielaborado") %>' />
            <br />
            PesoNeto:
            <asp:TextBox ID="PesoNetoTextBox" runat="server" Text='<%# Bind("PesoNeto") %>' />
            <br />
            PesoNetoCaja:
            <asp:TextBox ID="PesoNetoCajaTextBox" runat="server" Text='<%# Bind("PesoNetoCaja") %>' />
            <br />
            Estado:
            <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
            <br />
            Unidad:
            <asp:TextBox ID="UnidadTextBox" runat="server" Text='<%# Bind("Unidad") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style11">Material:</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="MaterialTextBox" runat="server" MaxLength="10" Text='<%# Bind("Material") %>' Width="38px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="MaterialTextBox" ErrorMessage="*Obligatorio" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style11">Proceso:</td>
                    <td>
                        <asp:DropDownList ID="DropDownListProcesoFV" runat="server" DataSourceID="BopDBProcesosFV" DataTextField="Descripción" DataValueField="Proceso" SelectedValue='<%# Bind("Proceso") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="BopDBProcesosFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Proceso], [Descripción] FROM [Procesos]"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style11">Peso Neto Caja:</td>
                    <td>
                        <asp:TextBox ID="PesoNetoCajaTextBox" runat="server" Text='<%# Bind("PesoNetoCaja") %>' TextMode="Number" Width="70px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Producto:</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="ProductoTextBox" runat="server" MaxLength="50" Text='<%# Bind("Producto") %>' Width="224px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ProductoTextBox" ErrorMessage="*Obligatorio" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style11">Familia:</td>
                    <td>
                        <asp:DropDownList ID="DropDownListFamiliaFV" runat="server" DataSourceID="BopDBFamiliasFV" DataTextField="FamiliaProducto" DataValueField="Codigo">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="BopDBFamiliasFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Codigo], [FamiliaProducto] FROM [FamiliaProductos]"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style11">Unidad:</td>
                    <td>
                        <asp:DropDownList ID="DropDownListUnidadFV" runat="server" DataSourceID="BopDBUnidadFV" DataTextField="Descripcion" DataValueField="Unidad" SelectedValue='<%# Bind("Unidad") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="BopDBUnidadFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Unidad], [Descripcion] FROM [Unidades] where Tipo='Producto' and estado='Activo'"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Marca:</td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="DropDownListMarcaFV" runat="server" DataSourceID="BopDBMarcasFV" DataTextField="Marca" DataValueField="Codigo" SelectedValue='<%# Bind("CodigoMarca") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="BopDBMarcasFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Codigo], [Marca] FROM [Marcas]"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style11">Semielab.:</td>
                    <td>
                        <asp:DropDownList ID="DropDownListSemiFV" runat="server" SelectedValue='<%# Bind("IndSemielaborado") %>'>
                            <asp:ListItem>Si</asp:ListItem>
                            <asp:ListItem Selected="True">No</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">Estado:</td>
                    <td>
                        <asp:DropDownList ID="DropDownListEstadoFV" runat="server">
                            <asp:ListItem>Activo</asp:ListItem>
                            <asp:ListItem>Inactivo</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Planta:</td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="DropDownListPlantaFV" runat="server" DataSourceID="BopDBPlantasFV" DataTextField="Descripción" DataValueField="Planta">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="BopDBPlantasFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas]"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style11">PesoNeto:</td>
                    <td>
                        <asp:TextBox ID="PesoNetoTextBox" runat="server" Height="16px" Text='<%# Bind("PesoNeto") %>' TextMode="Number" Width="70px" />
                    </td>
                    <td class="auto-style11">Formato: </td>
                    <td>
                        <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="BopDBFormatoFV" DataTextField="descr" DataValueField="Formato" SelectedValue='<%# Bind("Formato") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="BopDBFormatoFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT RTRIM( FamiliaProductos.FamiliaProducto) + '-' + Rtrim(Formatos.Formato)  AS descr, Formatos.Formato FROM Formatos INNER JOIN FamiliaProductos ON Formatos.CodigoFamilia = FamiliaProductos.Codigo"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Material:
            <asp:Label ID="MaterialLabel" runat="server" Text='<%# Eval("Material") %>' />
            <br />
            Producto:
            <asp:Label ID="ProductoLabel" runat="server" Text='<%# Bind("Producto") %>' />
            <br />
            CodigoMarca:
            <asp:Label ID="CodigoMarcaLabel" runat="server" Text='<%# Bind("CodigoMarca") %>' />
            <br />
            Planta:
            <asp:Label ID="PlantaLabel" runat="server" Text='<%# Bind("Planta") %>' />
            <br />
            Proceso:
            <asp:Label ID="ProcesoLabel" runat="server" Text='<%# Bind("Proceso") %>' />
            <br />
            CodigoFamilia:
            <asp:Label ID="CodigoFamiliaLabel" runat="server" Text='<%# Bind("CodigoFamilia") %>' />
            <br />
            IndSemielaborado:
            <asp:Label ID="IndSemielaboradoLabel" runat="server" Text='<%# Bind("IndSemielaborado") %>' />
            <br />
            PesoNeto:
            <asp:Label ID="PesoNetoLabel" runat="server" Text='<%# Bind("PesoNeto") %>' />
            <br />
            PesoNetoCaja:
            <asp:Label ID="PesoNetoCajaLabel" runat="server" Text='<%# Bind("PesoNetoCaja") %>' />
            <br />
            Estado:
            <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
            <br />
            Unidad:
            <asp:Label ID="UnidadLabel" runat="server" Text='<%# Bind("Unidad") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
        <asp:SqlDataSource ID="BopDBProductosFV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Productos] WHERE [Material] = @Material" InsertCommand="p_ValidaInsertaPRODUCTOS" SelectCommand="SELECT * FROM [Productos]" UpdateCommand="UPDATE [Productos] SET [Producto] = @Producto, [CodigoMarca] = @CodigoMarca, [Planta] = @Planta, [Proceso] = @Proceso, [CodigoFamilia] = @CodigoFamilia, [IndSemielaborado] = @IndSemielaborado, [PesoNeto] = @PesoNeto, [PesoNetoCaja] = @PesoNetoCaja, [Estado] = @Estado, [Unidad] = @Unidad WHERE [Material] = @Material" OnInserted="On_Inserted" InsertCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Material" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Material" Type="String" />
                <asp:Parameter Name="Producto" Type="String" />
                <asp:Parameter Name="CodigoMarca" Type="String" />
                <asp:Parameter Name="Planta" Type="String" />
                <asp:Parameter Name="Proceso" Type="String" />
                <asp:Parameter Name="CodigoFamilia" Type="String" />
                <asp:Parameter Name="IndSemielaborado" Type="String" />
                <asp:Parameter Name="PesoNeto" Type="Decimal" />
                <asp:Parameter Name="PesoNetoCaja" Type="Decimal" />
                <asp:Parameter Name="Estado" Type="String" />
                <asp:Parameter Name="Unidad" Type="String" />
                <asp:Parameter Name="Formato" Type="String" />
                <asp:Parameter Name="Done" Type="Boolean" />
                <asp:Parameter Name="Msg" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Producto" Type="String" />
                <asp:Parameter Name="CodigoMarca" Type="String" />
                <asp:Parameter Name="Planta" Type="String" />
                <asp:Parameter Name="Proceso" Type="String" />
                <asp:Parameter Name="CodigoFamilia" Type="String" />
                <asp:Parameter Name="IndSemielaborado" Type="String" />
                <asp:Parameter Name="PesoNeto" Type="Decimal" />
                <asp:Parameter Name="PesoNetoCaja" Type="Decimal" />
                <asp:Parameter Name="Estado" Type="String" />
                <asp:Parameter Name="Unidad" Type="String" />
                <asp:Parameter Name="Material" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
<p>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="BopDBProductos" DataTextField="FamiliaProducto" DataValueField="Codigo">
    </asp:DropDownList>
    <asp:SqlDataSource ID="BopDBProductos" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Codigo], [FamiliaProducto] FROM [FamiliaProductos]"></asp:SqlDataSource>
</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Material" DataSourceID="BopDBProdDet" Width="100%">
        <Columns>
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Images/StopHS.png" DeleteImageUrl="~/Images/DeleteHS.png" EditImageUrl="~/Images/EditTableHS.png" SelectImageUrl="~/Images/ZoomHS.png" ShowDeleteButton="True" ShowEditButton="True" UpdateImageUrl="~/Images/saveHS.png" CausesValidation="False" />
            <asp:BoundField DataField="Material" HeaderText="Material" ReadOnly="True" SortExpression="Material" />
            <asp:TemplateField HeaderText="Producto" SortExpression="Producto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Producto") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("Producto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Marca" SortExpression="CodigoMarca">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListMarcaGV" runat="server" DataSourceID="BopDBMarcasGV" DataTextField="Marca" DataValueField="Codigo" SelectedValue='<%# Bind("CodigoMarca") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BopDBMarcasGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Codigo], [Marca] FROM [Marcas]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownListMarcaGV" runat="server" DataSourceID="BopDBMarcasGV" DataTextField="Marca" DataValueField="Codigo" Enabled="False" SelectedValue='<%# Bind("CodigoMarca") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BopDBMarcasGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Codigo], [Marca] FROM [Marcas]"></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Planta" SortExpression="Planta">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownPlantaGV" runat="server" DataSourceID="BopDBPlantasGV" DataTextField="Planta" DataValueField="Planta" SelectedValue='<%# Bind("Planta") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BopDBPlantasGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownPlantaGV" runat="server" DataSourceID="BopDBPlantasGV" DataTextField="Planta" DataValueField="Planta" Enabled="False" SelectedValue='<%# Bind("Planta") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BopDBPlantasGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas]"></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Proceso" SortExpression="Proceso">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListProcesoGV" runat="server" DataSourceID="BopDBProcesosGV" DataTextField="Descripción" DataValueField="Proceso" SelectedValue='<%# Bind("Proceso") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BopDBProcesosGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Proceso], [Descripción] FROM [Procesos]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownListProcesoGV" runat="server" DataSourceID="BopDBProcesosGV" DataTextField="Descripción" DataValueField="Proceso" Enabled="False" SelectedValue='<%# Bind("Proceso") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BopDBProcesosGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Proceso], [Descripción] FROM [Procesos]"></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Familia" SortExpression="CodigoFamilia">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListFamiliaGV" runat="server" DataSourceID="BopDBFamiliasGV" DataTextField="FamiliaProducto" DataValueField="Codigo" SelectedValue='<%# Bind("CodigoFamilia") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BopDBFamiliasGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Codigo], [FamiliaProducto] FROM [FamiliaProductos]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownListFamiliaGV" runat="server" DataSourceID="BopDBFamiliasGV" DataTextField="FamiliaProducto" DataValueField="Codigo" Enabled="False" SelectedValue='<%# Bind("CodigoFamilia") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BopDBFamiliasGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Codigo], [FamiliaProducto] FROM [FamiliaProductos]"></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Semi. Elab." SortExpression="IndSemielaborado">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListSemiGV" runat="server" SelectedValue='<%# Bind("IndSemielaborado") %>'>
                        <asp:ListItem>Si</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("IndSemielaborado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kg. Neto" SortExpression="PesoNeto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PesoNeto") %>' TextMode="Number" Width="47px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("PesoNeto", "{0:N3}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kg. Caja" SortExpression="PesoNetoCaja">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PesoNetoCaja") %>' TextMode="Number" Width="47px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("PesoNetoCaja", "{0:N2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UM" SortExpression="Unidad">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListUnidadGV" runat="server" DataSourceID="BopDBUnidadesGV" DataTextField="Unidad" DataValueField="Unidad" SelectedValue='<%# Bind("Unidad") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BopDBUnidadesGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Unidad], [Descripcion] FROM [Unidades] where tipo='Producto'"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Unidad") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Formato" SortExpression="Formato">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="BopDBFormatoGV" DataTextField="Formato" DataValueField="Formato" SelectedValue='<%# Bind("Formato") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BopDBFormatoGV" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT RTrim([Formato]) as Formato FROM [Formatos]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Formato") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="BopDBEstados" DataTextField="Estado" DataValueField="Estado" SelectedValue='<%# Bind("Estado") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BopDBEstados" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Estado] FROM [Estados]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#003366" ForeColor="White" />
        <RowStyle Font-Overline="False" Font-Size="Small" />
    </asp:GridView>
    <asp:SqlDataSource ID="BopDBProdDet" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Productos] WHERE [Material] = @original_Material" InsertCommand="INSERT INTO [Productos] ([Material], [Producto], [CodigoMarca], [Planta], [Proceso], [CodigoFamilia], [IndSemielaborado], [PesoNeto], [PesoNetoCaja],[Unidad], [Estado], [Formato]) VALUES (@Material, @Producto, @CodigoMarca, @Planta, @Proceso, @CodigoFamilia, @IndSemielaborado, @PesoNeto, @PesoNetoCaja, @Estado, @Formato)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Material, Producto, CodigoMarca, Planta, Proceso, CodigoFamilia, IndSemielaborado, PesoNeto, PesoNetoCaja, Estado, Unidad, RTrim(Formato) as Formato FROM Productos WHERE (CodigoFamilia = @CodigoFamilia)" UpdateCommand="UPDATE [Productos] SET [Producto] = @Producto, [CodigoMarca] = @CodigoMarca, [Planta] = @Planta, [Proceso] = @Proceso, [CodigoFamilia] = @CodigoFamilia, [IndSemielaborado] = @IndSemielaborado, [PesoNeto] = @PesoNeto, [PesoNetoCaja] = @PesoNetoCaja, [Estado] = @Estado, [Formato]=@Formato WHERE [Material] = @original_Material">
        <DeleteParameters>
            <asp:Parameter Name="original_Material" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Material" Type="String" />
            <asp:Parameter Name="Producto" Type="String" />
            <asp:Parameter Name="CodigoMarca" Type="String" />
            <asp:Parameter Name="Planta" Type="String" />
            <asp:Parameter Name="Proceso" Type="String" />
            <asp:Parameter Name="CodigoFamilia" Type="String" />
            <asp:Parameter Name="IndSemielaborado" Type="String" />
            <asp:Parameter Name="PesoNeto" Type="Decimal" />
            <asp:Parameter Name="PesoNetoCaja" Type="Decimal" />
            <asp:Parameter Name="Estado" Type="String" />
            <asp:Parameter Name="Formato" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="CodigoFamilia" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Producto" Type="String" />
            <asp:Parameter Name="CodigoMarca" Type="String" />
            <asp:Parameter Name="Planta" Type="String" />
            <asp:Parameter Name="Proceso" Type="String" />
            <asp:Parameter Name="CodigoFamilia" Type="String" />
            <asp:Parameter Name="IndSemielaborado" Type="String" />
            <asp:Parameter Name="PesoNeto" Type="Decimal" />
            <asp:Parameter Name="PesoNetoCaja" Type="Decimal" />
            <asp:Parameter Name="Estado" Type="String" />
            <asp:Parameter Name="Formato" />
            <asp:Parameter Name="original_Material" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
</asp:Content>
