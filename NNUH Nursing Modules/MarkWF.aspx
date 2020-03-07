<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="MarkWF.aspx.vb" Inherits="NNUH_Nursing_Modules.MarkWF" %>
<%@ Register src="~/MarkUC.ascx" tagname="MarkUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:MarkUC ID="MarkUC1" runat="server" />
</asp:Content>
