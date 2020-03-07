<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="AddCourseSlidesWF.aspx.vb" Inherits="NNUH_Nursing_Modules.AddCourseSlidesWF" %>
<%@ Register src="~/AddCourseSlidesUC.ascx" tagname="AddCourseSlidesUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:AddCourseSlidesUC ID="AddCourseSlidesUC1" runat="server" />
</asp:Content>
