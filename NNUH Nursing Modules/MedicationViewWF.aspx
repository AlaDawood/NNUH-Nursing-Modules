<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="MedicationViewWF.aspx.vb" Inherits="NNUH_Nursing_Modules.MedicationViewWF" EnableEventValidation="true" %>
<%@ Register src="~/MedicationViewUC.ascx" tagname="MedicationViewUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:MedicationViewUC ID="MedicationViewUC1" runat="server" />
</asp:Content>
