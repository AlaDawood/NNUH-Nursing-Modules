<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="VidCourseViewWF.aspx.vb" Inherits="NNUH_Nursing_Modules.VidCourseViewWF" %>
<%@ Register src="~/VidCourseViewUC.ascx" tagname="VidCourseViewUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:VidCourseViewUC ID="VidCourseViewUC1" runat="server" />
</asp:Content>
