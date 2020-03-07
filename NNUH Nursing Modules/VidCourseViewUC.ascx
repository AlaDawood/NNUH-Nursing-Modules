<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="VidCourseViewUC.ascx.vb" Inherits="NNUH_Nursing_Modules.VidCourseViewUC" %>

<link href="~/Content/Style2.css" rel="stylesheet" />
<div class="container-fluid">
    <div class="card" style="width: 100%;">
        <h3 class="card-header text-info">
            <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
        </h3>
        <ul class="list-group list-group-flush text-danger">
            <li class="list-group-item">Date:
                <asp:Label ID="lblDate" runat="server"></asp:Label></li>
            <li class="list-group-item">Credit Hours:
                <asp:Label ID="lblCredit" runat="server"></asp:Label></li>            
        </ul>
        <div class="card-body text-center">
            <video runat="server" id="VideoFam" class="aaa" style="width:100%" height="600" controls="controls">
            </video>
            <p id="Content1" class="card-text text-success" runat="server">
            </p>
            <br />
            <asp:Button ID="btnTest" runat="server" Width="100%" CssClass="btn btn-primary" Text="Begin Test"/>
        </div>      
    </div>
</div>
<asp:SqlDataSource ID="SDSView2" runat="server" SelectCommand="Select Id,CoTitle,CoPara,CoImg,CoType From VidCourses Where Id=@Id" InsertCommand="Insert into UserCourses (UserNo,CoType,CoId,Mark,MarkAll,LastQ,Dat,CreditHr,CoApproval) Values (@UserNo,@CoType,@CoId,@Mark,@MarkAll,@LastQ,@Dat,@CreditHr,@CoApproval)">
        <InsertParameters>
        <asp:SessionParameter Name="UserNo" SessionField="UNo" />
        <asp:SessionParameter Name="CoType" SessionField="Type" />
        <asp:SessionParameter Name="CoId" SessionField="CNo" />
        <asp:SessionParameter Name="Mark" SessionField="Mark1" />
        <asp:SessionParameter Name="LastQ" SessionField="First" />
        <asp:SessionParameter Name="MarkAll" SessionField="MarkAll" />
        <asp:ControlParameter ControlID="lblDate" Name="Dat" PropertyName="Text" />
        <asp:ControlParameter ControlID="lblCredit" Name="CreditHr" PropertyName="Text" />
        <asp:SessionParameter Name="CoApproval" SessionField="Approval" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="CNo" />
        <asp:SessionParameter Name="UserNo" SessionField="UNo" />
        <asp:SessionParameter Name="CoType" SessionField="Type" />
        <asp:SessionParameter Name="CoId" SessionField="CNo" />
    </SelectParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="SDSView" runat="server" SelectCommand="Select Id,CoTitle,CoImg,CoVid,Copara,CreditHr From VidCourses Where Id=@Id">
        <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="CNo" />
    </SelectParameters>
</asp:SqlDataSource>
