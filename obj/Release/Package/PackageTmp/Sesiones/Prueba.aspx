<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Prueba.aspx.cs" Inherits="BitOp.Sesiones.Prueba" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <asp:Panel ID="Panel1" runat="server" Width="31%">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </asp:Panel>
    <p>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
