<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NursingModules.Master" CodeBehind="QuastionWF.aspx.vb" Inherits="NNUH_Nursing_Modules.QuastionWF" %>
<%@ Register Src="~/Quastion1UC.ascx" TagPrefix="uc2" TagName="Quastion1UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc2:Quastion1UC runat="server" id="Quastion1UC" />
    
</asp:Content>
