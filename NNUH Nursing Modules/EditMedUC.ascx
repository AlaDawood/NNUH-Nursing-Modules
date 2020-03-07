<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EditMedUC.ascx.vb" Inherits="NNUH_Nursing_Modules.EditMedUC" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-success text-white">
                    <h2>Medication Editor</h2>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="form-group">
                                <label for="txtName">Medication Name</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Medication Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="form-group">
                                <label for="ddlCat">Category</label>
                                <asp:DropDownList ID="ddlCat" runat="server" CssClass="form-control"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCat" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="form-group">
                                <label for="txtIndecation">Preparation</label>
                                <textarea id="txtPreparation" rows="10" style="width:100%" runat="server" cssclass="form-control"></textarea>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="form-group">
                                <label for="txtIndecation">Indecation</label>
                                <textarea id="txtIndecation" rows="10" style="width:100%" runat="server" cssclass="form-control"></textarea>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="form-group">
                                <label for="txtSideEffect">Side Effect</label>
                                <textarea id="txtSideEffect" rows="10" style="width:100%" runat="server" cssclass="form-control"></textarea>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="form-group">
                                <label for="txtReconsitution">Reconsitution</label>
                                <textarea id="txtReconsitution" rows="10" style="width:100%" runat="server" cssclass="form-control"></textarea>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="form-group">
                                <label for="txtDilution">Dilution</label>
                                <textarea id="txtDilution" rows="10" style="width:100%" runat="server" cssclass="form-control"></textarea>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="form-group">
                                <label for="txtAdministration">Administration</label>
                                <textarea id="txtAdministration" rows="10" style="width:100%" runat="server" cssclass="form-control"></textarea>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="form-group">
                                <label for="txtNotes">Notes</label>
                                <textarea id="txtNotes" runat="server" rows="10" style="width:100%" cssclass="form-control"></textarea>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="form-group">
                                <label for="FUimg">Picture</label>
                                <asp:FileUpload ID="FUimg" runat="server" CssClass="form-control" />
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="text-center">
                                <asp:Image ID="ImgM" runat="server" Width="150px" Height="150px" />
                            </div>
                        </li>
                        <li class="list-group-item">
                            <asp:Button ID="btnAdd" runat="server" Text="Save" CssClass="btn btn-primary" Width="100%" />
                        </li>
                        <li class="list-group-item"></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<asp:SqlDataSource ID="SDSCat" runat="server"></asp:SqlDataSource>
<asp:SqlDataSource ID="SDSMedication" runat="server">
    <DeleteParameters>
        <asp:SessionParameter Name="Id" SessionField="MNo" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="txtName" Name="MName" PropertyName="Text" />
        <asp:ControlParameter ControlID="ddlCat" Name="CatId" PropertyName="SelectedValue" />
        <asp:SessionParameter Name="MImg" SessionField="ImgPath" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="MNo" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="txtName" Name="MName" PropertyName="Text" />
        <asp:ControlParameter ControlID="ddlCat" Name="MCatId" PropertyName="SelectedValue" />
        <asp:SessionParameter Name="MImg" SessionField="ImgPath" />
        <asp:SessionParameter Name="Id" SessionField="MNo" />
    </UpdateParameters>
</asp:SqlDataSource>
