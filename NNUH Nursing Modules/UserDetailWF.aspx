<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="UserDetailWF.aspx.vb" Inherits="NNUH_Nursing_Modules.UserDetailWF" %>
<%@ Register src="~/UserDetailsUC.ascx" tagname="UserDetailsUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UserDetailsUC ID="UserDetailsUC1" runat="server" />
</asp:Content>
