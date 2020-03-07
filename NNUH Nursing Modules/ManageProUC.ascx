<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ManageProUC.ascx.vb" Inherits="NNUH_Nursing_Modules.ManageProUC" %>

<div class="container-fluid">
    <div class="card">
        <div class="card-header bg-success text-white">
            <h2>Manage Your Profile</h2>
        </div>
        <div class="card-body">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <div class="form-group">
                        <label for="txtUserNo">User No</label>
                        <asp:TextBox ID="txtUserNo" CssClass="form-control" runat="server" placeholder="User No" ReadOnly="True"></asp:TextBox>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="form-group">
                        <label for="txtUserName">Name</label>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Your Name" Text='<%# Bind("UserName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="example@hotmail.com" Text='<%# Bind("UserEmail") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="e.g: example@mail.co" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="form-group">
                        <label for="txtPhone">Phone</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="0569865185" Text='<%# Bind("UserPhone") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="form-group">
                        <label for="lbChange">Password</label>
                        <asp:LinkButton ID="lbChange" runat="server" CssClass="btn btn-danger" PostBackUrl="~/ChangePassWF.aspx">Change Password</asp:LinkButton>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="form-group">
                        <label for="txtGender">Gender</label>
                        <asp:DropDownList ID="txtGender" CssClass="form-control" runat="server" SelectedValue='<%# Bind("UserGender") %>'>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="form-group">
                        <label for="fuImage">Profile Picture</label>
                        <asp:FileUpload ID="fuImage" CssClass="form-control" AllowMultiple="false" runat="server" accept="image/png, image/jpeg" />
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="form-group text-center">
                        <label for="imgPro"></label>
                        <asp:Image ID="imgPro" runat="server" Width="200px" Height="200px" />
                    </div>
                </li>
                <li class="list-group-item">
                    <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" Width="100%" Text="Save" />
                </li>
            </ul>
        </div>
    </div>
</div>

<asp:SqlDataSource ID="SDSManage" runat="server" UpdateCommand="Update Users Set UserName=@UserName, UserEmail=@UserEmail, UserPhone=@UserPhone,  UserGender=@UserGender, UserImg=@UserImg Where UserNo=@UserNo" SelectCommand="Select UserName,UserEmail,UserPhone,UserPass,UserGender,UserImg from Users Where UserNo=@UserNo">
    <SelectParameters>
        <asp:SessionParameter Name="UserNo" SessionField="UNo" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="txtUserName" Name="UserName" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtEmail" Name="UserEmail" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtPhone" Name="UserPhone" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtGender" Name="UserGender" PropertyName="SelectedValue" />
        <asp:SessionParameter Name="UserImg" SessionField="UImg" />
        <asp:SessionParameter Name="UserNo" SessionField="UNo" />
    </UpdateParameters>
</asp:SqlDataSource>


