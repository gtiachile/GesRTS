﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Autorizaciones.aspx.cs" Inherits="BitOp.Admin.Autorizaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            width: 93px;
        }
        .auto-style4 {
            width: 115px;
            text-align: center;
        }
        .auto-style10 {
            width: 42px;
        }
        .auto-style11 {
            text-align: left;
            width: 302px;
            color: #000000;
            font-weight: bold;
        }
        .auto-style12 {
            width: 42px;
            color: #000000;
            font-weight: bold;
        }
        .auto-style14 {
            width: 93px;
            text-align: center;
            font-size: xx-small;
        }
        .auto-style15 {
            font-size: medium;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style15"><strong>AUTORIZACIONES</strong></p>
    <p>
        <asp:DropDownList ID="DropDownListPerfil" runat="server" DataSourceID="BopDBPerfiles" DataTextField="Descripción" DataValueField="Perfil" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="BopDBPerfiles" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Perfil], [Descripción] FROM [Perfiles]"></asp:SqlDataSource>
    </p>
                    <asp:SqlDataSource ID="BopDBOpciones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT * FROM [Opciones] 
  WHERE Estado='Activo'
      and opcion not in (SELECT [Opcion] FROM [Autorizaciones] WHERE [Perfil] = @Perfil)
order by modulo, opcion">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListPerfil" Name="Perfil" PropertyName="SelectedValue" />
                        </SelectParameters>
    </asp:SqlDataSource>
    <p>
        <table style="width:80%;">
            <tr>
                <td class="auto-style12" style="text-align: left">OPCIONES DISPONIBLES</td>
                <td class="auto-style3" style="text-align: left">&nbsp;</td>
                <td class="auto-style11">AUTORIZACIONES</td>
            </tr>
            <tr>
                <td class="auto-style10" valign="top">
                    <asp:GridView ID="GridViewAutDisp" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Opcion" DataSourceID="BopDBOpciones" Width="330px" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="AutorOnOff" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Módulo" SortExpression="Modulo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Modulo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Modulo" runat="server" Text='<%# Bind("Modulo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Opción" SortExpression="Opcion">
                                <ItemTemplate>
                                    <asp:Label ID="Opcion" runat="server" Text='<%# Bind("Opcion") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </td>
                <td class="auto-style14" valign="middle">
                    <asp:Button ID="ButtonAgregaAut" runat="server" OnClick="ButtonAgregaAut_Click" style="text-align: left" Text="&gt;&gt;" />
                    <br />
                    <br />
                    <asp:Button ID="ButtonElimAut" runat="server" OnClick="ButtonElimAut_Click" Text="&lt;&lt;" />
                    <br />
                    <br />
                    <asp:Button ID="ButtonAsigAll" runat="server" OnClick="ButtonAgrAll_Click" Text="&gt;&gt;&gt;" />
                    <br />
                    <br />
                    <asp:Button ID="ButtonElimAll" runat="server" OnClick="ButtonElimAll_Click" Text="&lt;&lt;&lt;" />
                </td>
                <td valign="top">
                    <asp:GridView ID="GridViewAutAsig" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="BopDBAutorizaciones" Width="330px" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBoxAut" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Módulo" SortExpression="Modulo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Modulo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Modulo" runat="server" Text='<%# Bind("Modulo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Opción" SortExpression="Opcion">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Opcion") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Opcion" runat="server" Text='<%# Bind("Opcion") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="BopDBAutorizaciones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" DeleteCommand="DELETE FROM [Autorizaciones] WHERE [uid] = @uid" InsertCommand="INSERT INTO [Autorizaciones] ([Modulo], [Opcion], [uid]) VALUES (@Modulo, @Opcion, @uid)" SelectCommand="SELECT [Modulo], [Opcion] FROM [Autorizaciones] WHERE ([Perfil] = @Perfil)" UpdateCommand="UPDATE [Autorizaciones] SET [Modulo] = @Modulo, [Opcion] = @Opcion WHERE [uid] = @uid">
                        <DeleteParameters>
                            <asp:Parameter Name="uid" Type="Object" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Modulo" Type="String" />
                            <asp:Parameter Name="Opcion" Type="String" />
                            <asp:Parameter Name="uid" Type="Object" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListPerfil" Name="Perfil" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Modulo" Type="String" />
                            <asp:Parameter Name="Opcion" Type="String" />
                            <asp:Parameter Name="uid" Type="Object" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
