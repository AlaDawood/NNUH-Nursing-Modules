<%@ Page Title="" Language="vb" AutoEventWireup="false" EnableEventValidation="true" MasterPageFile="~/NursingModules.Master" CodeBehind="CoursesManagmentWF.aspx.vb" Inherits="NNUH_Nursing_Modules.CoursesManagmentWF" ValidateRequest="false" %>
<%@ Register src="~/CourseManagmentUC.ascx" tagname="CourseManagmentUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CourseManagmentUC ID="CourseManagmentUC1" runat="server" />
</asp:Content>
