<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CourseViewUC.ascx.vb" Inherits="NNUH_Nursing_Modules.CourseViewUC" %>

<div class="container-fluid">
    <div class="row">
        <div class="card" style="width:100%">
            <asp:Image ID="Image1" runat="server" Width="400" Height="400" CssClass="rounded mx-auto d-block" />
            <div class="card-header">
                <h2><asp:Label ID="lblTitle" runat="server" Text="sda"></asp:Label></h2>
            </div>
            <div class="card-body">
                <h5 class="card-title">
                    <asp:Label ID="Label1" runat="server" Text="Date: "></asp:Label>
                    <asp:Label ID="lblDate" runat="server"></asp:Label>
                </h5>
                <h5 class="card-title">
                    <asp:Label ID="Label2" runat="server" Text="Credit Hours: "></asp:Label>
                    <asp:Label ID="lblCredit" runat="server"></asp:Label>
                </h5>
                <div class="card-body">
                    <div id="Content1" runat="server"></div>
                </div>
                <asp:Button ID="btnTest" runat="server" CssClass="btn btn-primary" style="width:100%" Text="Begin Test" />
            </div>

        </div>
    </div>
</div>

<asp:SqlDataSource ID="SDSView" runat="server" SelectCommand="Select Id,CoTitle,CoPara,CoImg,CreditHr,CoType From ArtCourses Where Id=@Id" InsertCommand="Insert into UserCourses (UserNo,CoType,CoId,Mark,MarkAll,LastQ,Dat,CreditHr,CoApproval) Values (@UserNo,@CoType,@CoId,@Mark,@MarkAll,@LastQ,@Dat,@CreditHr,@CoApproval)">
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


