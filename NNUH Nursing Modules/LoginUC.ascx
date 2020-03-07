<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="LoginUC.ascx.vb" Inherits="NNUH_Nursing_Modules.LoginUC" %>

<link href="~/Content/Style2.css" rel="stylesheet" />

<div class="container">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6" style="width: 40rem">
            <div class="card">
                <div class="card-body">
                    <img class="card-img-top" src="images/nnuh.jpg" />
                    <h5 class="card-title">Login</h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <asp:Label ID="lblMsg" CssClass="auto-style6" runat="server"></asp:Label></li>
                        <li class="list-group-item">
                            <div class="input-group mb-3">
                                <asp:TextBox ID="txtUserNo" Font-Size="Large" CssClass="form-control" TextMode="Number" runat="server" Width="100%" placeholder="User Number" aria-label="Username" aria-describedby="basic-addon1" MaxLength="8"></asp:TextBox>
                            </div>                           
                        </li>
                        <li class="list-group-item">
                            <div class="input-group mb-3">
                                <asp:TextBox ID="txtPass" Font-Size="Large" CssClass="form-control" runat="server" TextMode="Password" Width="100%" placeholder="Password"></asp:TextBox>
                            </div>                            
                        </li>
                        <li class="list-group-item">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserNo" ErrorMessage="User No Required Field" ForeColor="Red"></asp:RequiredFieldValidator>                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Password Field Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </li>
                        <li class="list-group-item">
                            <asp:Button ID="btnLogin" runat="server" Font-Size="Large" CssClass="btn btn-primary" Text="Login" Width="100%" />
                            <br /><br />
                            <asp:LinkButton runat="server" ID="btnReg" Font-Size="Medium" Text="Register"></asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-3">
        </div>
    </div>
</div>

<asp:SqlDataSource ID="SDSLogin" runat="server" SelectCommand="Select UserNo,UserName,UserPass,UserImg,UserPrivi,UserEmail From Users Where UserNo=@UserNo  And UserPass=@UserPass">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtUserNo" Name="UserNo" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtPass" Name="UserPass" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
