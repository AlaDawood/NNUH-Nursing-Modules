<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="Index.aspx.vb" Inherits="NNUH_Nursing_Modules.Index" %>
<%@ Register src="~/CoursesUC.ascx" tagname="CoursesUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CoursesUC ID="Courses" runat="server" />
</asp:Content>
