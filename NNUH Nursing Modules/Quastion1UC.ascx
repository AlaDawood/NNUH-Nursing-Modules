<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="Quastion1UC.ascx.vb" Inherits="NNUH_Nursing_Modules.QuastionUC" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.1, Version=18.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="panel1" runat="server">
    <ContentTemplate>
        <div class="container-fluid">
            <asp:Label ID="lblTitle" CssClass="h1 text-primary" runat="server" Text="Title"></asp:Label>
            <div class="row">
                <div class="col-md-12">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item list-group-item-action text-warning"><strong>Question Number: </strong>
                            <asp:Label ID="lblQN" runat="server"></asp:Label><dx:ASPxProgressBar ID="QProgress" runat="server" Position="20" Width="200px" Maximum="20" Theme="iOS"></dx:ASPxProgressBar>
                        </li>
                        <li class="list-group-item list-group-item-action text-success"><strong>Mark: </strong>
                            <asp:Label ID="lblMark" runat="server">0</asp:Label>
                            <dx:ASPxProgressBar ID="MProgress" runat="server" Position="20" Width="200px" Maximum="20" Theme="iOS"></dx:ASPxProgressBar>
                        </li>
                        <li class="list-group-item list-group-item-action text-danger"><strong>Date: </strong>
                            <asp:Label ID="lblDate" runat="server"></asp:Label></li>
                        <li class="list-group-item list-group-item-action text-info"><strong>Question wieght: </strong>
                            <asp:Label ID="lblM" runat="server"></asp:Label>&nbsp;Point</li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-text">
                                <fieldset class="form-group">
                                    <legend class="col-sm-12 control-label">
                                        <asp:Label ID="lblQ" CssClass="h3 card-title text-success" runat="server">Welcome to Test Press Next To Start</asp:Label></legend>
                                    <div class="col-sm-12 span3">
                                        <asp:RadioButtonList ID="lstOption" runat="server" CssClass="radio radiobuttonlist" Font-Size="Large" RepeatDirection="Vertical" RepeatLayout="UnorderedList">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </fieldset>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select one of these options" ControlToValidate="lstOption" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                <asp:Button ID="btnNext" runat="server" CssClass="col-sm-4 btn btn-primary float-right" Text="Next" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><br />
    </ContentTemplate>
</asp:UpdatePanel>

<asp:SqlDataSource ID="SDSQuastion" runat="server" SelectCommand="Select * From CoQu Where CoId=@Id Order By NewID()">
    <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="CNo" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SDSUser" runat="server" SelectCommand="Select * From CoQu Where CoId=@Id Order By NewID()" InsertCommand="Insert into UserCourses (UserNo,CoType,CoId,Mark,MarkAll,LastQ,Dat) Values (@UserNo,@CoType,@CoId,@Mark,@MarkAll,@LastQ,@Dat)" UpdateCommand="Update UserCourses Set Mark= Mark + @Mark,MarkAll= MarkAll + @MarkAll,LastQ=@LastQ,Dat=@Dat Where UserNo=@UserNo And CoType=@CoType And CoId=@CoId">
    <UpdateParameters>
        <asp:SessionParameter Name="Mark" SessionField="Mark1" />
        <asp:SessionParameter Name="LastQ" SessionField="First" />
        <asp:SessionParameter Name="MarkAll" SessionField="MarkAll" />
        <asp:ControlParameter ControlID="lblDate" Name="Dat" PropertyName="Text" />
        <asp:SessionParameter Name="UserNo" SessionField="UNo" />
        <asp:SessionParameter Name="CoType" SessionField="Type" />
        <asp:SessionParameter Name="CoId" SessionField="CNo" />
    </UpdateParameters>
    <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="CNo" />
        <asp:SessionParameter Name="UserNo" SessionField="UNo" />
        <asp:SessionParameter Name="CoType" SessionField="Type" />
        <asp:SessionParameter Name="CoId" SessionField="CNo" />
    </SelectParameters>
</asp:SqlDataSource>
