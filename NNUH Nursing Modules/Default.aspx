<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="Default.aspx.vb" Inherits="NNUH_Nursing_Modules.TestWF" %>
<%@ Register src="~/FirstUC.ascx" tagname="FirstUC" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <uc3:FirstUC ID="FirstUC1" runat="server" />
    
</asp:Content>
