<%@ Page Title="Validation User Number" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="ValidationWF.aspx.vb" Inherits="NNUH_Nursing_Modules.ValidationWF" %>
<%@ Register src="~/ValidationUC.ascx" tagname="ValidationUC" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="~/Content/style.css" rel="stylesheet" />
    <uc2:ValidationUC ID="ValidationUC1" runat="server" />
    
</asp:Content>
