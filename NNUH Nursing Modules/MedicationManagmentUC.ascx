<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MedicationManagmentUC.ascx.vb" Inherits="NNUH_Nursing_Modules.MedicationManagmentUC" %>

<div class="container-fluid">
    <div class="card">
        <div class="card-header bg-danger text-white">
            <h2>Medications Management</h2>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="col-md-6">
                    <asp:Button ID="btnM" runat="server" Text="Medications" Width="100%" CssClass="btn btn-primary" />
                </div>
                <div class="col-md-6">
                    <asp:Button ID="btnC" runat="server" Text="Categories" Width="100%" CssClass="btn btn-primary" />
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                        <asp:View ID="View2" runat="server">
                            <asp:DataList ID="ilMedication" BorderColor="black" CellPadding="5" CellSpacing="5" DataKeyField="Id"
                            OnEditCommand="ilMedication_EditCommand"
                            OnDeleteCommand="ilMedication_DeleteCommand" OnSelectedIndexChanged="ilMedication_SelectedIndexChanged"
                            RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="5" CssClass="table" runat="server">
                            <HeaderStyle CssClass="h3 card-header"></HeaderStyle>
                            <AlternatingItemStyle></AlternatingItemStyle><ItemStyle Width="20%" />
                            <HeaderTemplate>                       
                                <asp:LinkButton runat="server" ID="BtnAddMed" Text="Add New" OnClick="BtnAddMed_Click" CssClass="btn btn-warning"></asp:LinkButton>  Medications
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="card">
                                    <div class="text-center">
                                    <asp:Image ID="COImg" CssClass="card-img-top text-center" AlternateText="Product picture"
                                        ImageUrl='<%# DataBinder.Eval(Container.DataItem, "MImg") %>'
                                        runat="server" Width="100px" Height="100" /></div>
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item h4 text-success text-wrap">
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MName") %>'></asp:Label></li>
                                            <li class="list-group-item text-center">
                                                <asp:LinkButton ID="EditButton" Text="Edit" CommandName="Edit" CssClass="btn btn-primary" Width="48%" runat="server"></asp:LinkButton>
                                                <asp:LinkButton ID="DeleteButton" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" Width="48%" runat="server"></asp:LinkButton>
                                            </li>
                                            <li class="list-group-item">
                                                <asp:LinkButton ID="btnView" CssClass="btn btn-secondary" runat="server" Text="View" CommandName="Select" Width="100%"></asp:LinkButton>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        </asp:View>

                        <asp:View ID="View3" runat="server">
                            <asp:DataList ID="ilCategory" BorderColor="black" CellPadding="5" CellSpacing="5" DataKeyField="Id"
                            OnEditCommand="ilCategory_EditCommand"
                            OnDeleteCommand="ilCategory_DeleteCommand" OnSelectedIndexChanged="ilCategory_SelectedIndexChanged"
                            RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="5" CssClass="table" runat="server">
                            <HeaderStyle CssClass="h3 card-header"></HeaderStyle>
                            <AlternatingItemStyle></AlternatingItemStyle><ItemStyle Width="20%" />
                            <HeaderTemplate>                       
                                <asp:LinkButton runat="server" ID="BtnAddCat" Text="Add New" OnClick="BtnAddCat_Click" CssClass="btn btn-warning"></asp:LinkButton>  Categories
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="card">
                                    <div class="text-center">
                                    <asp:Image ID="COImg" CssClass="card-img-top text-center" AlternateText="Product picture"
                                        ImageUrl='<%# DataBinder.Eval(Container.DataItem, "CatImg") %>'
                                        runat="server" Width="100px" Height="100" /></div>
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item h4 text-success text-wrap">
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Category") %>'></asp:Label></li>
                                            <li class="list-group-item text-center">
                                                <asp:LinkButton ID="EditButton" Text="Edit" CommandName="Edit" CssClass="btn btn-primary" Width="48%" runat="server"></asp:LinkButton>
                                                <asp:LinkButton ID="DeleteButton" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" Width="48%" runat="server"></asp:LinkButton>
                                            </li>
                                            <li class="list-group-item">
                                                <asp:LinkButton ID="btnView" CssClass="btn btn-secondary" runat="server" Text="View" CommandName="Select" Width="100%"></asp:LinkButton>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        </asp:View>

                        <asp:View ID="View1" runat="server">
                            <asp:DataList ID="ilCatMed" BorderColor="black" CellPadding="5" CellSpacing="5" DataKeyField="Id"
                            OnEditCommand="ilCatMed_EditCommand"
                            OnDeleteCommand="ilCatMed_DeleteCommand" OnSelectedIndexChanged="ilCatMed_SelectedIndexChanged"
                            RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="5" CssClass="table" runat="server">
                            <HeaderStyle CssClass="h3 card-header"></HeaderStyle>
                            <AlternatingItemStyle></AlternatingItemStyle><ItemStyle Width="20%" />
                            <HeaderTemplate>                       
                                <asp:LinkButton runat="server" ID="BtnAddCatMed" Text="Add New" OnClick="BtnAddCatMed_Click" CssClass="btn btn-warning"></asp:LinkButton>  Medications
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="card">
                                    <div class="text-center">
                                    <asp:Image ID="COImg" CssClass="card-img-top text-center" AlternateText="Product picture"
                                        ImageUrl='<%# DataBinder.Eval(Container.DataItem, "MImg") %>'
                                        runat="server" Width="100px" Height="100" /></div>
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item h4 text-success text-wrap">
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MName") %>'></asp:Label></li>
                                            <li class="list-group-item text-center">
                                                <asp:LinkButton ID="EditButton" Text="Edit" CommandName="Edit" CssClass="btn btn-primary" Width="48%" runat="server"></asp:LinkButton>
                                                <asp:LinkButton ID="DeleteButton" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" Width="48%" runat="server"></asp:LinkButton>
                                            </li>
                                            <li class="list-group-item">
                                                <asp:LinkButton ID="btnView" CssClass="btn btn-secondary" runat="server" Text="View" CommandName="Select" Width="100%"></asp:LinkButton>
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

<asp:SqlDataSource ID="SDSMedication" runat="server">
    <DeleteParameters>
        <asp:Parameter Name="Id" />
    </DeleteParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDSCat" runat="server">
    <DeleteParameters>
        <asp:Parameter Name="Id" />
    </DeleteParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDSMedCat" runat="server">
    <DeleteParameters>
        <asp:Parameter Name="Id" />
    </DeleteParameters>
    <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="CatNo" />
    </SelectParameters>
</asp:SqlDataSource>
