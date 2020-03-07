<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="EditMedWF.aspx.vb" Inherits="NNUH_Nursing_Modules.EditMedWF" %>
<%@ Register src="~/EditMedUC.ascx" tagname="EditMedUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:EditMedUC ID="EditMedUC1" runat="server" />
</asp:Content>
