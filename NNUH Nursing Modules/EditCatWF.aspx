<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="EditCatWF.aspx.vb" Inherits="NNUH_Nursing_Modules.EditCatWF" %>
<%@ Register src="~/EditCatUC.ascx" tagname="EditCatUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:EditCatUC ID="EditCatUC1" runat="server" />
</asp:Content>
