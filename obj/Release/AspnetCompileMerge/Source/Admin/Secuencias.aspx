<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Secuencias.aspx.cs" Inherits="BitOp.Admin.Secuencias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style10 {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>SECUENCIAS</h3>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AddMark_10580_inverse.png" OnClick="ImageButton1_Click" />
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="ImageButton1_Click">Agregar Secuencia</asp:LinkButton>
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="tipo" DataSourceID="BopDBSecuencias" Width="50%">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Images/saveHS.png" Text="Actualizar" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Images/Cancel.png" Text="Cancelar" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/EditTableHS.png" Text="Editar" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="tipo" HeaderText="Tipo" ReadOnly="True" SortExpression="tipo" />
                            <asp:BoundField DataField="inicial" HeaderText="Inicial" SortExpression="inicial" />
                            <asp:BoundField DataField="actual" HeaderText="Actual" SortExpression="actual" />
                            <asp:BoundField DataField="incremento" HeaderText="Incremento" SortExpression="incremento" />
                        </Columns>
                        <HeaderStyle BackColor="#003366" ForeColor="White" />
                    </asp:GridView>
                </p>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="tipo" DataSourceID="BopDBSecuencias" DefaultMode="Insert">
                    <EditItemTemplate>
                        tipo:
                        <asp:Label ID="tipoLabel1" runat="server" Text='<%# Eval("tipo") %>' />
                        <br />
                        inicial:
                        <asp:TextBox ID="inicialTextBox" runat="server" Text='<%# Bind("inicial") %>' />
                        <br />
                        actual:
                        <asp:TextBox ID="actualTextBox" runat="server" Text='<%# Bind("actual") %>' />
                        <br />
                        incremento:
                        <asp:TextBox ID="incrementoTextBox" runat="server" Text='<%# Bind("incremento") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style10">Tipo:</td>
                                <td>
                                    <asp:TextBox ID="tipoTextBox" runat="server" MaxLength="10" Text='<%# Bind("tipo") %>' Width="55px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tipoTextBox" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Inicial:</td>
                                <td>
                                    <asp:TextBox ID="inicialTextBox0" runat="server" Text='<%# Bind("inicial") %>' TextMode="Number" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="inicialTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Actual:</td>
                                <td>
                                    <asp:TextBox ID="actualTextBox0" runat="server" Text='<%# Bind("actual") %>' TextMode="Number" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="actualTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Incremento:</td>
                                <td>
                                    <asp:TextBox ID="incrementoTextBox0" runat="server" Height="16px" Text='<%# Bind("Incremento") %>' TextMode="Number" Width="46px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="incrementoTextBox0" ErrorMessage="*Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="InsertCancelButton_Click" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        tipo:
                        <asp:Label ID="tipoLabel" runat="server" Text='<%# Eval("tipo") %>' />
                        <br />
                        inicial:
                        <asp:Label ID="inicialLabel" runat="server" Text='<%# Bind("inicial") %>' />
                        <br />
                        actual:
                        <asp:Label ID="actualLabel" runat="server" Text='<%# Bind("actual") %>' />
                        <br />
                        incremento:
                        <asp:Label ID="incrementoLabel" runat="server" Text='<%# Bind("incremento") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="BopDBSecuencias" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Secuencias] WHERE [tipo] = @tipo" InsertCommand="p_ValidaInsertaSECUENCIAS" InsertCommandType="StoredProcedure" SelectCommand="SELECT [tipo], [inicial], [actual], [incremento] FROM [Secuencias]" UpdateCommand="UPDATE [Secuencias] SET [inicial] = @inicial, [actual] = @actual, [incremento] = @incremento WHERE [tipo] = @tipo">
                    <DeleteParameters>
                        <asp:Parameter Name="tipo" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="tipo" Type="String" />
                        <asp:Parameter Name="inicial" Type="Int64" />
                        <asp:Parameter Name="actual" Type="Int64" />
                        <asp:Parameter Name="incremento" Type="Int32" />
                        <asp:Parameter Name="fechaUltAct" Type="DateTime" />
                        <asp:Parameter Name="Done" Type="Boolean" />
                        <asp:Parameter Name="Msg" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="inicial" Type="Int64" />
                        <asp:Parameter Name="actual" Type="Int64" />
                        <asp:Parameter Name="incremento" Type="Int32" />
                        <asp:Parameter Name="tipo" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>
