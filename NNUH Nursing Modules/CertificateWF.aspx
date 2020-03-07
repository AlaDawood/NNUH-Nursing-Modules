<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="CertificateWF.aspx.vb" Inherits="NNUH_Nursing_Modules.CertificateWF" %>
<%@ Register src="~/CertificateUC.ascx" tagname="CertificateUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <uc1:CertificateUC ID="CertificateUC1" runat="server" />
</asp:Content>
