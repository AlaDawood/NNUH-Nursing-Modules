<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="MedicationManagmentWF.aspx.vb" Inherits="NNUH_Nursing_Modules.MedicationManagmentWF" %>
<%@ Register src="~/MedicationManagmentUC.ascx" tagname="MedicationManagmentUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:MedicationManagmentUC ID="MedicationManagmentUC1" runat="server" />
</asp:Content>
