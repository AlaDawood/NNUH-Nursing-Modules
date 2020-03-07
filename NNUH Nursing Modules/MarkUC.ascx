<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MarkUC.ascx.vb" Inherits="NNUH_Nursing_Modules.MarkUC" %>
<style type="text/css">
    .a{
        color:darkorange;
        font-size:1000%;
        text-align:center;

    }
    .b{
        color:darkorange;
        font-size:400%;
        text-align:center;
    }
</style>

<div class="a">
    <asp:Label ID="lblMark" runat="server" Text="0"></asp:Label>
</div>
<div class="b">
    <asp:Button ID="btnNext" runat="server" text="Next"/>
</div>