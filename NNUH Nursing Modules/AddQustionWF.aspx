<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="AddQustionWF.aspx.vb" Inherits="NNUH_Nursing_Modules.AddQustionWF" %>
<%@ Register src="~/AddQustionUC.ascx" tagname="AddQustionUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:AddQustionUC ID="AddQustionUC1" runat="server" />
</asp:Content>
