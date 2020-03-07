<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="UserManagmentWF.aspx.vb" Inherits="NNUH_Nursing_Modules.UserManagmentWF" %>
<%@ Register src="~/UserManagmentUC.ascx" tagname="UserManagmentUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UserManagmentUC ID="UserManagmentUC1" runat="server" />
</asp:Content>
