<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="RegisteredUC.ascx.vb" Inherits="NNUH_Nursing_Modules.RegisteredUC" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
        padding: 0;
        margin: 0;
    }

    .auto-style2 {
        width: 90%;
        margin: 10px auto;
        padding: 5px 5px 5px 5px;
    }

    .auto-style3 {
        font-family: Arial;
        font-size: xx-large;
        font-weight: 400;
        color: #003366;
    }

    .auto-style4 {
        padding: 5px 5px 5px 5px;
        border: 1px solid #003366;
        border-radius: 5px;
    }

    .auto-style5 {
        text-align: center;
        font-family: Arial;
        font-weight: 400;
        font-size: large;
        color: #003366;
    }

    .btn {
        border-radius: 7px;
    }
</style>
<link href="~/Content/Style2.css" rel="stylesheet" />
<div class="auto-style1">
    <div class="auto-style2">
        <div class="auto-style3">
            <span>New User Registration</span>
        </div>
        <br />
        <div class="auto-style4">
            <asp:Label ID="Label1" runat="server" Width="150px" Text="User Number"></asp:Label>
            <asp:TextBox ID="txtUserNo" runat="server" CssClass="css-input" ReadOnly="True" Width="219px"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label3" runat="server" Width="150px" Text="Name"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" CssClass="css-input" Width="219px"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label4" runat="server" Width="150px" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="css-input" Width="219px"></asp:TextBox><br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="e.g example@mail.co" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="Label5" runat="server" Width="150px" Text="Phone"></asp:Label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="css-input" Width="219px"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label6" runat="server" Width="150px" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPass" runat="server" CssClass="css-input" TextMode="Password" Width="219px"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPass" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label7" runat="server" Width="150px" Text="Confirm Password"></asp:Label>
            <asp:TextBox ID="txtCPass" runat="server" CssClass="css-input" TextMode="Password" Width="219px"></asp:TextBox><br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtCPass" ControlToValidate="txtPass" ErrorMessage="Password not Equal" ForeColor="Red"></asp:CompareValidator>
            <br />
            <asp:Label ID="Label8" runat="server" Width="150px" Text="Gender"></asp:Label>
            <asp:DropDownList ID="txtGender" runat="server" CssClass="css-input" Width="130px">
                <asp:ListItem Value="M">Male</asp:ListItem>
                <asp:ListItem Value="F">Female</asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <div class="auto-style5">
            <asp:Button ID="btnRegister" CssClass="myButton" runat="server" Text="Register" Width="219px" Font-Bold="True" Font-Names="Arial" Font-Size="Large" />
        </div>
    </div>
</div>

<asp:SqlDataSource ID="SDSregister" runat="server" UpdateCommand="Update Users Set UserName=@UserName, UserEmail=@UserEmail, UserPhone=@UserPhone, UserPass=@UserPass, UserGender=@UserGender Where UserNo=@UserNo">
    <UpdateParameters>
        <asp:ControlParameter Name="UserName" Type="String" PropertyName="Text" ControlID="txtName" />
        <asp:ControlParameter Name="UserPhone" Type="String" PropertyName="Text" ControlID="txtPhone" />
        <asp:ControlParameter Name="UserEmail" Type="String" PropertyName="Text" ControlID="txtEmail" />
        <asp:ControlParameter Name="UserGender" Type="String" PropertyName="SelectedValue" ControlID="txtGender" />
        <asp:ControlParameter Name="UserPass" Type="String" PropertyName="Text" ControlID="txtCPass" />
        <asp:ControlParameter ControlID="txtUserNo" Name="UserNo" PropertyName="Text" />
    </UpdateParameters>
</asp:SqlDataSource>
