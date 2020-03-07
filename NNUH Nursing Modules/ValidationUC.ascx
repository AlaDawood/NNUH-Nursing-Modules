<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="ValidationUC.ascx.vb" Inherits="NNUH_Nursing_Modules.Validation" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="card">
                <h3 class="card-header">Validate your user number</h3>
                <div class="card-body">
                    <div class="card-title">
                        Type your user number below to check validity                                              
                    </div>
                    <p class="card-text"><asp:TextBox ID="txtUserNo" runat="server" CssClass="form-control" placeholder="User Number" TextMode="Number"></asp:TextBox></p>
                    <p class="card-text text-danger"><asp:Label ID="lblMsg" runat="server" ></asp:Label></p>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserNo" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator><br />  
                    <asp:Button ID="btnValidate" runat="server" CssClass="btn btn-primary" Text="Check" />
                </div>
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>    
</div>
                    
<asp:SqlDataSource ID="ValidateSDS" runat="server"></asp:SqlDataSource>

