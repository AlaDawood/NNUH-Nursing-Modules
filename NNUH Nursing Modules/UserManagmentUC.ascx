<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UserManagmentUC.ascx.vb" Inherits="NNUH_Nursing_Modules.UserManagmentUC" %>
<asp:ScriptManager runat="server"></asp:ScriptManager>
<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <div class="container-fluid">
            <asp:MultiView ID="MultiView1" runat="server">

                <asp:View ID="View1" runat="server">
                    <div class="card" style="width: 100%;">
                        <div class="card-header text-primary">
                            <h2>Users Management</h2>
                        </div>
                        <div class="card-body">
                            <div class="text-center">
                                <asp:TextBox ID="txtSearch" runat="server" placeholder="Search" CssClass="form-control"></asp:TextBox>
                            </div>
                            <br />
                            <div class="text-right">
                                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-success" Width="15%" Text="Search" />
                            </div>
                            <br />
                            <div class="text-left">
                                <asp:Button ID="btnNew1" runat="server" Text="Add New User" CssClass="btn btn-warning" />
                            </div>
                            <br />
                            <asp:GridView ID="GVUsers" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-dark" CellPadding="4" DataKeyNames="UserNo" Width="100%" AllowPaging="True" AllowSorting="True" EmptyDataText="No Users">
                                <Columns>
                                    <asp:BoundField DataField="UserNo" HeaderText="No" />
                                    <asp:BoundField DataField="UserName" HeaderText="Name" />
                                    <asp:BoundField DataField="UserEmail" HeaderText="Email" />
                                    <asp:BoundField DataField="UserPhone" HeaderText="Phone" />
                                    <asp:BoundField DataField="UserImg" Visible="false" HeaderText="Picture" />
                                    <asp:BoundField DataField="UserPrivi" Visible="false" HeaderText="Privilage" />
                                    <asp:ButtonField Text="Details" HeaderText="Course Details" CommandName="Details_click" />
                                    <asp:ButtonField Text="Delete" HeaderText="Delete" CommandName="Delet_click" />
                                </Columns>
                                <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" Mode="NextPreviousFirstLast" NextPageText="&gt;" PreviousPageText="&lt;" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            </asp:GridView>
                        </div>
                    </div>
                </asp:View>

                <asp:View ID="View2" runat="server">
                    <div class="card" style="width: 100%;">
                        <div class="card-header">
                            <h2 class="text-primary">Users Details</h2>
                        </div>
                        <asp:Image ID="Image1" runat="server" CssClass="card-img-top mx-auto d-block" Width="150" />
                        <br />
                        <div class="text-left">
                            <asp:Button ID="btnUsers" runat="server" Text="View Users" CssClass="btn btn-warning" />
                        </div>
                        <br />
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                            </li>
                            <li class="list-group-item">User ID:
                    <asp:TextBox ID="txtID" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                            </li>
                            <li class="list-group-item">User Name:
                    <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                            </li>
                            <li class="list-group-item">User Email: 
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                            </li>
                            <li class="list-group-item">User Phone:
                    <asp:TextBox ID="txtTitle3" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                            </li>
                            <li class="list-group-item">User Privilage:
                    <asp:DropDownList ID="txtPrivi" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">User</asp:ListItem>
                        <asp:ListItem Value="1">Admin</asp:ListItem>
                    </asp:DropDownList>
                            </li>
                            <li class="list-group-item table-responsive">
                                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Text="Save" Width="100%" />
                            </li>
                        </ul>
                    </div>
                </asp:View>

            </asp:MultiView>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:SqlDataSource ID="SDSUsers" runat="server" SelectCommand="Select * from Users" InsertCommand="Insert Into Users (UserNo,UserPrivi) Values (@UserNo,@UserPrivi)" DeleteCommand="Delete From Users Where UserNo=@UserNo" UpdateCommand="Update Users Set UserPrivi=@UserPrivi Where UserNo=@UserNo">
    <DeleteParameters>
        <asp:SessionParameter Name="UserNo" SessionField="UsrNo" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="txtID" Name="UserNo" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtPrivi" Name="UserPrivi" PropertyName="SelectedValue" />
    </InsertParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="txtPrivi" Name="UserPrivi" PropertyName="SelectedValue" />
        <asp:SessionParameter Name="UserNo" SessionField="UsrNo" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDSUsr" runat="server" SelectCommand="Select * From Users Where UserNo=@UserNo">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtID" Name="UserNo" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
