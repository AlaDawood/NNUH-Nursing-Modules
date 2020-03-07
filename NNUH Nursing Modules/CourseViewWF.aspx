<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="CourseViewWF.aspx.vb" Inherits="NNUH_Nursing_Modules.CourseViewWF" %>
<%@ Register src="~/CourseViewUC.ascx" tagname="CourseViewUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CourseViewUC ID="CourseViewUC1" runat="server" />
</asp:Content>
