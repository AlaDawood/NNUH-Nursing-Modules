<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CertificateUC.ascx.vb" Inherits="NNUH_Nursing_Modules.CertificateUC" %>

<div class="container-fluid"><br />
    <div class="row">
        <div class="col-md-2">
            
        </div>
        <div class="col-md-8">
            <div class="card">
                
                <div class="card-header text-danger text-center h3" id="lblResult" runat="server">
                    
                </div>
                
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><asp:Button ID="btnPrint" CssClass="btn btn-primary" runat="server" Text="Download and Sent to Email" Width="100%" /></li>
                    <li class="list-group-item"><asp:Button ID="btnReplay" CssClass="btn btn-danger" runat="server" Text="Repeat Test" Width="100%" /></li>
                </ul>
            </div>
            
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div><br />


<asp:SqlDataSource ID="SDSRepeat" runat="server" SelectCommand="Select * from UserCourses Where UserNo = @UserNo And CoType = @CoType And CoId = @CoId" UpdateCommand="Update UserCourses Set Mark= 0,MarkAll= 0,LastQ=0 Where UserNo=@UserNo And CoType=@CoType And CoId=@CoId">
    <SelectParameters>
        <asp:SessionParameter Name="UserNo" SessionField="UNo" />
        <asp:SessionParameter Name="CoType" SessionField="Type" />
        <asp:SessionParameter Name="CoId" SessionField="CNo" />
    </SelectParameters>
    <UpdateParameters>
        <asp:SessionParameter Name="UserNo" SessionField="UNo" />
        <asp:SessionParameter Name="CoType" SessionField="Type" />
        <asp:SessionParameter Name="CoId" SessionField="CNo" />
    </UpdateParameters>
</asp:SqlDataSource>
