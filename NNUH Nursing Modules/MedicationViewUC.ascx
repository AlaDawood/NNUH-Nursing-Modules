<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MedicationViewUC.ascx.vb" Inherits="NNUH_Nursing_Modules.MedicationViewUC" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h2>Bible Of Medication</h2>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <asp:DropDownList ID="lstCat" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Category View</asp:ListItem>
                                        <asp:ListItem Value="1">Alphapatical View</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                                <li class="list-group-item">
                                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Width="100%" Text="View" />
                                </li>
                                <li class="list-group-item">
                                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Width="100%" placeholder="Search"></asp:TextBox></li>
                                <li class="list-group-item">
                                    <asp:Button ID="btnSearch1" runat="server" CssClass="btn btn-success" Width="100%" Text="Search" /></li>
                            </ul>
                        </div>
                        <div class="col-md-4"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1">
                                <asp:View ID="View1" runat="server">
                                    <h2 class="card-title">Categories</h2>
                                    <asp:DataList ID="ilCategory" BorderColor="black" CellPadding="5" CellSpacing="5" DataKeyField="Id"
                                        RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="5" CssClass="table" runat="server">
                                        <HeaderStyle CssClass="h3 card-header"></HeaderStyle>
                                        <AlternatingItemStyle></AlternatingItemStyle>
                                        <ItemStyle Width="20%" CssClass="text-wrap" />
                                        <ItemTemplate>
                                            <div class="card border-danger mb-3">
                                                <div class="text-center">
                                                    <asp:Image ID="ProductImage" CssClass="card-img-top text-center" AlternateText="Product picture"
                                                        ImageUrl='<%# DataBinder.Eval(Container.DataItem, "CatImg")%>'
                                                        runat="server" Width="100px" Height="100" />
                                                </div>
                                                <div class="card-body">
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item h4 text-warning">
                                                            <h5 class="card-title" style="font-size: large"><%# DataBinder.Eval(Container.DataItem, "Category")%></h5>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <asp:LinkButton ID="ViewButton" OnClick="ViewC" Text="View" CommandArgument='<%# Eval("Id")%>' CssClass="btn btn-success" Width="100%" runat="server" />
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </asp:View>

                                <asp:View ID="View2" runat="server">
                                    <h2 class="card-title">Medications</h2>
                                    <asp:DataList ID="ilMedication" BorderColor="black" CellPadding="5" CellSpacing="5" DataKeyField="Id"
                                        RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="5" CssClass="table" runat="server">
                                        <HeaderStyle CssClass="h3 card-header"></HeaderStyle>
                                        <AlternatingItemStyle></AlternatingItemStyle>
                                        <ItemStyle Width="20%" CssClass="text-wrap" />
                                        <ItemTemplate>
                                            <div class="card border-primary mb-3">
                                                <div class="text-center">
                                                    <asp:Image ID="ProductImage" CssClass="card-img-top text-center" AlternateText="Product picture"
                                                        ImageUrl='<%# DataBinder.Eval(Container.DataItem, "MImg")%>'
                                                        runat="server" Width="100px" Height="100" />
                                                </div>
                                                <div class="card-body">
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item h4 text-danger">
                                                            <h5 class="card-title" style="font-size: large"><%# DataBinder.Eval(Container.DataItem, "MName")%></h5>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <asp:LinkButton ID="ViewButton" OnClick="ViewM" Text="View" CommandArgument='<%# Eval("Id")%>' CssClass="btn btn-secondary" Width="100%" runat="server" />
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </asp:View>

                                <asp:View ID="View3" runat="server">
                                    <h2 class="card-title">Medications</h2>
                                    <asp:DataList ID="ilMedCat" BorderColor="black" CellPadding="5" CellSpacing="5" DataKeyField="Id"
                                        RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="5" CssClass="table" runat="server">
                                        <HeaderStyle CssClass="h3 card-header"></HeaderStyle>
                                        <AlternatingItemStyle></AlternatingItemStyle>
                                        <ItemStyle Width="20%" CssClass="text-wrap" />
                                        <ItemTemplate>
                                            <div class="card border-success mb-3">
                                                <div class="text-center">
                                                    <asp:Image ID="ProductImage" CssClass="card-img-top text-center" AlternateText="Product picture"
                                                        ImageUrl='<%# DataBinder.Eval(Container.DataItem, "MImg")%>'
                                                        runat="server" Width="100px" Height="100" />
                                                </div>
                                                <div class="card-body">
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item h4 text-primary">
                                                            <h5 class="card-title" style="font-size: large"><%# DataBinder.Eval(Container.DataItem, "MName")%></h5>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <asp:LinkButton ID="ViewButton" OnClick="ViewM" Text="View" CommandArgument='<%# Eval("Id")%>' CssClass="btn btn-info" Width="100%" runat="server" />
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </asp:View>
                            </asp:MultiView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<asp:SqlDataSource ID="SDSMedication" runat="server"></asp:SqlDataSource>
<asp:SqlDataSource ID="SDSCat" runat="server"></asp:SqlDataSource>
<asp:SqlDataSource ID="SDSMedCat" runat="server">
    <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="CatNo" />
    </SelectParameters>
</asp:SqlDataSource>



