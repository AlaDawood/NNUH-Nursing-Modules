<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CoursesUC.ascx.vb" Inherits="NNUH_Nursing_Modules.CoursesUC" %>

<%--<asp:ScriptManager runat="server"></asp:ScriptManager>
<asp:UpdatePanel runat="server">
    <ContentTemplate>--%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <h5>Courses Sort</h5>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                        <asp:ListItem Value="0">All</asp:ListItem>
                        <asp:ListItem Value="1">UnCompleted Courses</asp:ListItem>
                        <asp:ListItem Value="2">Completed Courses</asp:ListItem>
                        <asp:ListItem Value="3">New Courses</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-primary" Text="Search" Width="100%" />
                </div>
                <div class="col-md-4"></div>
            </div>
            <h3>Select the course you need to start with: </h3>
            <div class="row">
                <div class="col-md-4">
                    <details class="card border-primary mb-3" open>
                        <summary class="card-header bg-primary text-white" style="font-size:larger">
                            Articles Courses
                        </summary>
                        <div class="card-body">
                            <asp:DataList ID="ilArCourses" BorderColor="black" CellPadding="5" CellSpacing="5" DataKeyField="Id"
                            DataSourceID="SDSCourses"
                            RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="1" CssClass="table" runat="server">
                            <HeaderStyle CssClass="h3 card-header"></HeaderStyle>
                            <AlternatingItemStyle></AlternatingItemStyle><ItemStyle Width="100%" CssClass="text-wrap" />
                            <ItemTemplate>
                                <div class="card border-primary mb-3">
                                    <div class="text-center">
                                    <asp:Image ID="ProductImage" CssClass="card-img-top text-center" AlternateText="Product picture"
                                        ImageUrl='<%# DataBinder.Eval(Container.DataItem, "CoImg") %>'
                                        runat="server" Width="150px" Height="150" /></div>
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item h4 text-success hidden">
                                                <asp:Label ID="lblID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'></asp:Label></li>
                                            <li class="list-group-item h4 text-warning" style="font-size:large">                                               
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CoTitle") %>'></asp:Label></li>
                                            <li class="list-group-item text-danger">Credit Hours:
                                                <asp:Label ID="lblCredit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CreditHr") %>'></asp:Label></li>
                                            <li class="list-group-item text-muted">Course Type: 
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="TextBox1" Enabled="false" ReadOnly="true" text='<%# DataBinder.Eval(Container.DataItem, "CoType") %>'>
                                                    <asp:ListItem Value=0 Text="Zero Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value=1 Text="Zero Credit Hrs Need Approval"></asp:ListItem>
                                                    <asp:ListItem Value=2 Text="Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value=3 Text="Credit Hrs Need Approval"></asp:ListItem>
                                                </asp:DropDownList>
                                            </li>
                                            <li class="list-group-item">
                                                <asp:LinkButton ID="ViewButton" Text="View" CommandArgument='<%# Eval("Id")%>' OnClick="ViewButton_Click" CssClass="btn btn-primary" Width="100%" runat="server" />
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                                </asp:DataList>
                        </div>
                    </details>
                </div>
                <div class="col-md-4">
                    <details class="card border-success mb-3" open>
                        <summary class="card-header bg-success text-white" style="font-size:larger">
                            Video Courses
                        </summary>
                        <div class="card-body">
                            <asp:DataList ID="ilVidCourses" BorderColor="black" CellPadding="5" CellSpacing="5" DataKeyField="Id"
                            DataSourceID="SDSVidCourses"
                            RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="1" CssClass="table" runat="server">
                            <HeaderStyle CssClass="h3 card-header"></HeaderStyle>
                            <AlternatingItemStyle></AlternatingItemStyle><ItemStyle Width="100%" CssClass="text-wrap" />
                            <ItemTemplate>
                                <div class="card border-success mb-3">
                                    <div class="text-center">
                                    <asp:Image ID="ProductImage" CssClass="card-img-top text-center" AlternateText="Product picture"
                                        ImageUrl='<%# DataBinder.Eval(Container.DataItem, "CoImg") %>'
                                        runat="server" Width="150px" Height="150" /></div>
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item h4 text-success hidden">
                                                <asp:Label ID="lblID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'></asp:Label></li>
                                            <li class="list-group-item h4 text-warning" style="font-size:large">                                               
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CoTitle") %>'></asp:Label></li>
                                            <li class="list-group-item text-danger">Credit Hours:
                                                <asp:Label ID="lblCredit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CreditHr") %>'></asp:Label></li>
                                            <li class="list-group-item text-muted">Course Type: 
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="TextBox1" Enabled="false" ReadOnly="true" text='<%# DataBinder.Eval(Container.DataItem, "CoType") %>'>
                                                    <asp:ListItem Value=0 Text="Zero Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value=1 Text="Zero Credit Hrs Need Approval"></asp:ListItem>
                                                    <asp:ListItem Value=2 Text="Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value=3 Text="Credit Hrs Need Approval"></asp:ListItem>
                                                </asp:DropDownList>
                                            </li>
                                            <li class="list-group-item">
                                                <asp:LinkButton ID="ViewButton" Text="View" CommandArgument='<%# Eval("Id")%>' OnClick="ThumbImg1_Click" CssClass="btn btn-primary" Width="100%" runat="server" />
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                                </asp:DataList>
                        </div>
                    </details>
                </div>
                <div class="col-md-4">
                    <details class="card border-warning mb-3" open>
                        <summary class="card-header bg-warning text-white" style="font-size:larger">
                            Slide Courses
                        </summary>
                        <div class="card-body">
                            <asp:DataList ID="ilSliCourses" BorderColor="black" CellPadding="5" CellSpacing="5" DataKeyField="Id"
                            DataSourceID="SDSSlideCourses"
                            RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="1" CssClass="table" runat="server">
                            <HeaderStyle CssClass="h3 card-header"></HeaderStyle>
                            <AlternatingItemStyle></AlternatingItemStyle><ItemStyle Width="100%" CssClass="text-wrap" />
                            <ItemTemplate>
                                <div class="card border-warning mb-3">
                                    <div class="text-center">
                                    <asp:Image ID="ProductImage" CssClass="card-img-top text-center" AlternateText="Product picture"
                                        ImageUrl='<%# DataBinder.Eval(Container.DataItem, "CoImg") %>'
                                        runat="server" Width="150px" Height="150" /></div>
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item h4 text-success hidden">
                                                <asp:Label ID="lblID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'></asp:Label></li>
                                            <li class="list-group-item h4 text-warning" style="font-size:large">                                               
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CoTitle") %>'></asp:Label></li>
                                            <li class="list-group-item text-danger">Credit Hours:
                                                <asp:Label ID="lblCredit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CreditHr") %>'></asp:Label></li>
                                            <li class="list-group-item text-muted">Course Type: 
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="TextBox1" Enabled="false" ReadOnly="true" text='<%# DataBinder.Eval(Container.DataItem, "CoType") %>'>
                                                    <asp:ListItem Value=0 Text="Zero Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value=1 Text="Zero Credit Hrs Need Approval"></asp:ListItem>
                                                    <asp:ListItem Value=2 Text="Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value=3 Text="Credit Hrs Need Approval"></asp:ListItem>
                                                </asp:DropDownList>
                                            </li>
                                            <li class="list-group-item">
                                                <asp:LinkButton ID="ViewButton" Text="View" CommandArgument='<%# Eval("Id")%>' OnClick="ThumbImg2_Click" CssClass="btn btn-primary" Width="100%" runat="server" />
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                                </asp:DataList>
                        </div>
                    </details>
                </div>
            </div>
        </div>

        <asp:SqlDataSource ID="SDSCourses" runat="server">
            <SelectParameters>
                <asp:SessionParameter Name="UserNo" SessionField="UNo" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSVidCourses" runat="server" SelectCommand="">
            <SelectParameters>
                <asp:SessionParameter Name="UserNo" SessionField="UNo" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSSlideCourses" runat="server" SelectCommand="">
            <SelectParameters>
                <asp:SessionParameter Name="UserNo" SessionField="UNo" />
            </SelectParameters>
        </asp:SqlDataSource>
<%--    </ContentTemplate>
</asp:UpdatePanel>--%>
