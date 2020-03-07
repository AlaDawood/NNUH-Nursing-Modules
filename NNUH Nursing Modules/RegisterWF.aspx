<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="RegisterWF.aspx.vb" Inherits="NNUH_Nursing_Modules.RegisterWF" %>
<%@ Register src="~/RegisteredUC.ascx" tagname="RegisteredUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:RegisteredUC ID="RegisteredUC1" runat="server" />
</asp:Content>
