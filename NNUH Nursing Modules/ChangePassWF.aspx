<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="ChangePassWF.aspx.vb" Inherits="NNUH_Nursing_Modules.ChangePassWF" %>
<%@ Register src="~/ChangePassUC.ascx" tagname="ChangePassUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ChangePassUC ID="ChangePassUC1" runat="server" />
</asp:Content>
