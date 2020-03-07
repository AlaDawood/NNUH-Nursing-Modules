<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EditCatUC.ascx.vb" Inherits="NNUH_Nursing_Modules.EditCatUC" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-success text-white">
                    <h2>Category Editor</h2>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Category Name</label>
                                <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" placeholder="Category Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="txtCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="form-group">
                                <label for="exampleInputPassword1">Picture</label>
                                <asp:FileUpload ID="FUImg" runat="server" CssClass="form-control" placeholder="Picture" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="FUImg" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </li>
                        <li class="list-group-item text-center">
                            <asp:Image ID="CImg" runat="server" Width="200px" Height="200px" />
                        </li>
                        <li class="list-group-item">
                            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Width="100%" Text="Save" />
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<asp:SqlDataSource ID="SDSCat" runat="server">
    <InsertParameters>
        <asp:ControlParameter ControlID="txtCategory" Name="Category" PropertyName="Text" />
        <asp:SessionParameter Name="CatImg" SessionField="ImgPath" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="CatNo" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="txtCategory" Name="Category" PropertyName="Text" />
        <asp:SessionParameter Name="CatImg" SessionField="ImgPath" />
        <asp:SessionParameter Name="Id" SessionField="CatNo" />
    </UpdateParameters>
</asp:SqlDataSource>
