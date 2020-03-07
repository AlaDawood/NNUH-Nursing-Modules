<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ChangePassUC.ascx.vb" Inherits="NNUH_Nursing_Modules.ChangePassUC" %>
<div class="container-fluid">
<div class="card">
    <div class="card-header bg-danger text-white">
    <h2>Change your password</h2></div>
    <div class="row">
        <div class="col-md-12">
            <table class="table">
                <tr>
                    <td colspan="3">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">Old Password</span>
                            </div>
                            <asp:TextBox ID="txtOldPass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPass" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">New Password</span>
                            </div>
                            <asp:TextBox ID="txtNewPass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPass" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Confirm Password</span>
                            </div>
                            <asp:TextBox ID="txtCNewPass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCNewPass" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtCNewPass" ErrorMessage="Password and Confirm Password not Equal" ForeColor="Red"></asp:CompareValidator>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="btnSave" runat="server" Width="100%" CssClass="btn btn-primary" Text="Save" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</div>
<asp:SqlDataSource ID="SDSChange" runat="server" SelectCommand="Select UserNo,UserPass From Users Where UserNo=@UserNo And UserPass=@UserPass" UpdateCommand="Update Users Set UserPass=@UserPass Where UserNo=@UserNo">
    <SelectParameters>
        <asp:SessionParameter Name="UserNo" SessionField="UNo" />
        <asp:ControlParameter ControlID="txtOldPass" Name="UserPass" PropertyName="Text" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="txtCNewPass" Name="UserPass" PropertyName="Text" />
        <asp:SessionParameter Name="UserNo" SessionField="UNo" />
    </UpdateParameters>
</asp:SqlDataSource>


