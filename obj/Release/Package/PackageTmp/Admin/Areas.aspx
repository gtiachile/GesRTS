<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Areas.aspx.cs" Inherits="BitOp.Admin.Areas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>AREAS</h3>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <p>
                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton3_Click" />
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton3_Click">Agregar Area</asp:LinkButton>
            </p>
            <p>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Area" DataSourceID="BopDBAreas" Width="60%">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png"  />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/StopHS.png"  />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png"  />
                                &nbsp;<asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/DeleteHS.png" OnClientClick="return confirm('¿Está seguro que desea eliminar?'); "  />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Area" HeaderText="Area" ReadOnly="True" SortExpression="Area" />
                        <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
                        <asp:TemplateField HeaderText="Planta" SortExpression="Planta">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="BopDBPlantasDet0" DataTextField="Descripción" DataValueField="Planta" SelectedValue='<%# Bind("Planta") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="BopDBPlantasDet" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="BopDBPlantasDet0" DataTextField="Descripción" DataValueField="Planta" Enabled="False" SelectedValue='<%# Bind("Planta") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="BopDBPlantasDet0" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Planta], [Descripción] FROM [Plantas]"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="C.Costo" SortExpression="CCosto">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" MaxLength="10" Text='<%# Bind("CCosto") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("CCosto") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="BopDBEstado" DataTextField="Estado" DataValueField="Estado" SelectedValue='<%# Bind("Estado") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="BopDBEstado" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT * FROM [Estados]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="#003366" ForeColor="White" />
                </asp:GridView>
            </p>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Area" DataSourceID="BopDBAreas" DefaultMode="Insert">
                <EditItemTemplate>
                    Area:
                    <asp:Label ID="AreaLabel1" runat="server" Text='<%# Eval("Area") %>' />
                    <br />
                    Descripción:
                    <asp:TextBox ID="DescripciónTextBox" runat="server" Text='<%# Bind("Descripción") %>' />
                    <br />
                    Estado:
                    <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                    <br />
                    Planta:
                    <asp:TextBox ID="PlantaTextBox" runat="server" Text='<%# Bind("Planta") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style10">Area:</td>
                            <td>
                                <asp:TextBox ID="AreaTextBox" runat="server" MaxLength="10" Text='<%# Bind("Area") %>' Width="51px" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AreaTextBox" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Descripción:</td>
                            <td>
                                <asp:TextBox ID="DescripciónTextBox0" runat="server" MaxLength="20" Text='<%# Bind("Descripción") %>' Width="196px" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DescripciónTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Planta:</td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="BopDBPlantas" DataTextField="Descripción" DataValueField="Planta" SelectedValue='<%# Bind("Planta") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="BopDBPlantas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT null as [Planta], 'Seleccione Planta' as [Descripción]
union
SELECT [Planta], [Descripción] FROM [Plantas]"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">C.Costo:</td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" Text='<%# Bind("CCosto") %>'></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Estado:</td>
                            <td>
                                <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                                    <asp:ListItem>Activo</asp:ListItem>
                                    <asp:ListItem>Inactivo</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertButton_Click" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Area:
                    <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area") %>' />
                    <br />
                    Descripción:
                    <asp:Label ID="DescripciónLabel" runat="server" Text='<%# Bind("Descripción") %>' />
                    <br />
                    Estado:
                    <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                    <br />
                    Planta:
                    <asp:Label ID="PlantaLabel" runat="server" Text='<%# Bind("Planta") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="BopDBAreas" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Areas] WHERE [Area] = @Area" InsertCommand="p_ValidaInsertaAREAS" InsertCommandType="StoredProcedure" SelectCommand="SELECT [Area], [Descripción], [Estado], [Planta], [CCosto] FROM [Areas]" UpdateCommand="UPDATE [Areas] SET [Descripción] = @Descripción, [Estado] = @Estado, [Planta] = @Planta, [CCosto] = @CCosto WHERE [Area] = @Area">
                <DeleteParameters>
                    <asp:Parameter Name="Area" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Area" Type="String" />
                    <asp:Parameter Name="Descripción" Type="String" />
                    <asp:Parameter Name="Estado" Type="String" />
                    <asp:Parameter Name="Planta" Type="String" />
                    <asp:Parameter Name="CCosto" Type="String" />
                    <asp:Parameter Name="Done" Type="Boolean" />
                    <asp:Parameter Name="Msg" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Descripción" Type="String" />
                    <asp:Parameter Name="Estado" Type="String" />
                    <asp:Parameter Name="Planta" Type="String" />
                    <asp:Parameter Name="CCosto" Type="String" />
                    <asp:Parameter Name="Area" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
    <br />
</asp:Content>
