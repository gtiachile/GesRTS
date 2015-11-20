<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="BitOp.Inicio" %>
<%@ MasterType virtualpath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <p>
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/edificioCIAL.jpeg" Height="182px" Width="196px" />
                </td>
                <td>
                    &nbsp;</td>
                <td align="center">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/GesRTS.png" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td align="right">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/logo Gtia Small.png" />
                </td>
            </tr>
        </table>
    </p>
    </asp:Content>
