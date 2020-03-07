<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UserDetailsUC.ascx.vb" Inherits="NNUH_Nursing_Modules.UserDetailsUC" %>

<div class="container-fluid">
    <div class="row">
        <div class="card" style="width: 100%;">
            <h4 class="card-header text-primary">User Details</h4>
            <div class="card-body">
                <h5 class="card-title text-success">Personal Details</h5>
                <ul class="list-group list-group-flush text-info">
                    <li class="list-group-item">User Number:
                        <asp:Label ID="lblNo" runat="server" Text="Attempt Courses No."></asp:Label></li>
                    <li class="list-group-item">User Name:
                        <asp:Label ID="lblName" runat="server" Text="Attempt Courses No."></asp:Label></li>
                    <li class="list-group-item">User Email:
                        <asp:Label ID="lblEmail" runat="server" Text="Attempt Courses No."></asp:Label></li>
                </ul>
            </div>
            <h4 class="card-header text-primary">User Courses Details</h4>
            <div class="card-body">
                <ul class="list-group list-group-flush text-info">
                    <li class="list-group-item">Attempt Courses No.:
                        <asp:Label ID="lblCN" runat="server" Text="Attempt Courses No."></asp:Label></li>
                    <li class="list-group-item">Total Score:
                        <asp:Label ID="lblScore" runat="server" Text="Total Score"></asp:Label></li>
                    <li class="list-group-item">Total Credit Hour:
                        <asp:Label ID="lblCredit" runat="server" Text="Credit Hour"></asp:Label></li>
                </ul>
            </div>
            <div class="card-body table-responsive">
                <div class="text-left">
                    <asp:Button ID="btnAll" CssClass="btn btn-primary" runat="server" Text="All Courses" />
                    <span>&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp</span>
                    <asp:Button ID="btnApproved" CssClass="btn btn-primary" runat="server" Text="Approved Courses" />
                    <span>&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp</span>
                    <asp:Button ID="btnUnApproved" CssClass="btn btn-primary" runat="server" Text="Non-Approved Courses" />
                </div>
                <div class="text-right">
                <asp:Button ID="btnDelAll" CssClass="btn btn-danger" runat="server" Text="Delete All Courses" />
                    </div>
                <asp:GridView ID="GVCourses" runat="server" DataKeyNames="Id" AutoGenerateColumns="False" CssClass="table table-hover table-dark" CellPadding="4" RowHeaderColumn="UserNo" Width="100%" AllowPaging="True" AllowSorting="True" EmptyDataText="Not Register">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Mark" HeaderText="Mark" />
                        <asp:BoundField DataField="MarkAll" HeaderText="Total Mark" />
                        <asp:BoundField DataField="CreditHr" HeaderText="Credit Hours" />                       
                        <asp:BoundField DataField="Dat" HeaderText="Date" />
                        <asp:ButtonField DataTextField="CoApproval" HeaderText="Course Approval" CommandName="Approval_click"/>
                        <asp:ButtonField Text="Delete" CommandName="Delete_Click" />
                    </Columns>
                    <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" Mode="NextPreviousFirstLast" NextPageText="&gt;" PreviousPageText="&lt;" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                </asp:GridView>
            </div>
        </div>
    </div>
</div>
<br />
<br />

<asp:SqlDataSource ID="SDSUsers" runat="server" SelectCommand="Select * From Users Where UserNo=@UserNo">
    <SelectParameters>
        <asp:SessionParameter Name="UserNo" SessionField="UsrNo" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SDSCourses" runat="server" SelectCommand="Select UserCourses.Id, Case UserCourses.CoType When 0 then (Select ArtCourses.CoTitle From ArtCourses Where UserCourses.CoId=ArtCourses.Id) When 1 then (Select VidCourses.CoTitle From VidCourses Where UserCourses.CoId=VidCourses.Id) When 2 then (Select SliCourses.CoTitle From SliCourses Where UserCourses.CoId=SliCourses.Id) End As 'Title',Mark,MarkAll,CreditHr,Dat, Case UserCourses.CoApproval When 0 then 'Need Approval' When 1 then 'Approved' END AS 'CoApproval' From UserCourses Where UserNo=@UserNo" DeleteCommand="Delete From UserCourses Where Id=@Id" >
    <DeleteParameters>
        <asp:SessionParameter Name="Id" SessionField="Del12" />
        <asp:SessionParameter Name="UserNo" SessionField="UsrNo" />
    </DeleteParameters>
    <SelectParameters>
        <asp:SessionParameter Name="UserNo" SessionField="UsrNo" />
    </SelectParameters>
    <UpdateParameters>
        <asp:SessionParameter Name="Id" SessionField="Approv" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDSRank" runat="server" SelectCommand="Select Users.UserName, ( Select Count (UserCourses.UserNo) from UserCourses Where Users.UserNo=UserCourses.UserNo And UserCourses.LastQ=20 And UserCourses.CoApproval=1) As 'Course Number', (Select Sum(UserCourses.Mark) From UserCourses Where Users.UserNo=UserCourses.UserNo And UserCourses.LastQ=20) As 'Score',(Select Sum(UserCourses.MarkAll) From UserCourses Where Users.UserNo=UserCourses.UserNo And UserCourses.LastQ=20) As 'Score1',(Select Sum(UserCourses.CreditHr) From UserCourses Where Users.UserNo=UserCourses.UserNo And UserCourses.LastQ=20) As 'CreditHr' From Users Where Users.UserName &lt;&gt; '' And Users.UserNo=@UsNo Order By Score Desc">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblNo" Name="UsNo" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
