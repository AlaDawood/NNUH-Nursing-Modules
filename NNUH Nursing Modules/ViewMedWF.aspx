<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="ViewMedWF.aspx.vb" Inherits="NNUH_Nursing_Modules.ViewMedWF" %>
<%@ Register src="~/ViewMedUC.ascx" tagname="ViewMedUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ViewMedUC ID="ViewMedUC1" runat="server" />
</asp:Content>
