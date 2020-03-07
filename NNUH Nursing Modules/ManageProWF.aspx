<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="ManageProWF.aspx.vb" Inherits="NNUH_Nursing_Modules.ManageProWF" %>
<%@ Register src="~/ManageProUC.ascx" tagname="ManageProUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ManageProUC ID="ManageProUC1" runat="server" />
</asp:Content>
