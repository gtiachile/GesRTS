<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rep_Sesiones.aspx.cs" Inherits="BitOp.Sesiones.Rep_Sesiones" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        REPORTE SESIONES</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="GesDBRegiones" DataTextField="Region_Txt" DataValueField="Region_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="GesDBRegiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT [Region_ID], ([Region_Chile] + ' - ' + [Descripción]) as Region_Txt, [Region_RTS] 
 FROM [Regiones]
ORDER BY [Region_Txt]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
        <LocalReport ReportPath="Sesiones\Rep_Sesiones.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="GesDBSesiones" Name="DSSesiones" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="GesDBSesiones" runat="server" ConnectionString="<%$ ConnectionStrings:BopDBConnectionString %>" SelectCommand="SELECT * FROM [Sesiones] where region_id=@region_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="RM" Name="region_id" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
</asp:Content>
