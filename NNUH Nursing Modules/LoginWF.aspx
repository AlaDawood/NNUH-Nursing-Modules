<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="LoginWF.aspx.vb" Inherits="NNUH_Nursing_Modules.LoginWF" %>
<%@ Register src="~/LoginUC.ascx" tagname="LoginUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:LoginUC ID="LoginUC1" runat="server" />
</asp:Content>
