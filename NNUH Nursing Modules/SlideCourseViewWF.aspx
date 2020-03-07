<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="SlideCourseViewWF.aspx.vb" Inherits="NNUH_Nursing_Modules.SlideCourseViewWF" %>
<%@ Register src="~/SlideCourseViewUC.ascx" tagname="SlideCourseViewUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:SlideCourseViewUC ID="SlideCourseViewUC1" runat="server" />
</asp:Content>
