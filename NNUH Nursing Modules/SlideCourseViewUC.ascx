<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SlideCourseViewUC.ascx.vb" Inherits="NNUH_Nursing_Modules.SlideCourseViewUC" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<div class="container-fluid">
    <div class="card" style="width: 100%">
        <h2 class="card-header text-primary">
            <asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label></h2>
        <ul class="list-group list-group-flush text-info">
            <li class="list-group-item">Date:
                <asp:Label ID="lblDate" runat="server" Text="Date: "></asp:Label></li>
            <li class="list-group-item">Credit Hours:
                <asp:Label ID="lblCredit" runat="server"></asp:Label></li>
        </ul>
        <div class="card-body text-warning">
            <dx:ASPxImageSlider ID="ASPxImageSlider1" runat="server" Width="100%" Height="650px" DataSourceID="SDSSlideCourses"
                SettingsImageArea-ImageSizeMode="ActualSizeOrFit" ShowImageArea="true" ShowNavigationBar="true" SeoFriendly="True">
                <SettingsBehavior EnablePagingByClick="true" EnablePagingGestures="true" />
                <ItemTemplate>
                    <dx:ASPxImage runat="server" ImageUrl='<%# Container.EvalDataItem("SubPage") %>' ImageAlign="AbsMiddle"></dx:ASPxImage>
                </ItemTemplate>
                <ItemThumbnailTemplate>
                    <dx:ASPxImage runat="server" ImageUrl='<%# Container.EvalDataItem("SubPage") %>' ImageAlign="AbsMiddle"></dx:ASPxImage>
                </ItemThumbnailTemplate>
                <SettingsBehavior ImageLoadMode="AllImages" AllowMouseWheel="true" />
                <SettingsNavigationBar ItemSpacing="5" Mode="Thumbnails" VisibleItemsCount="5" />
            </dx:ASPxImageSlider>
        </div>
        <asp:Button ID="btnTest" runat="server" CssClass="btn btn-primary text-center" Text="Begin Test" />
    </div>
</div>

<asp:SqlDataSource ID="SDSSlideCourses" runat="server" SelectCommand="SELECT [SubPage] FROM [SliSubCourses] WHERE ([SliCoId] = @SliCoId)" ConnectionString="<%$ ConnectionStrings:ConnectionString %>">
    <SelectParameters>
        <asp:SessionParameter Name="SliCoId" SessionField="CNo" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDSView" runat="server" SelectCommand="Select Id,CoTitle,CoImg,CreditHr,CoType From SliCourses Where Id=@Id" InsertCommand="Insert into UserCourses (UserNo,CoType,CoId,Mark,MarkAll,LastQ,Dat,CreditHr,CoApproval) Values (@UserNo,@CoType,@CoId,@Mark,@MarkAll,@LastQ,@Dat,@CreditHr,@CoApproval)">
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
