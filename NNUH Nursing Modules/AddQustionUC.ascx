<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="AddQustionUC.ascx.vb" Inherits="NNUH_Nursing_Modules.AddQustionUC" %>
<asp:ScriptManager runat="server"></asp:ScriptManager>
<asp:UpdatePanel runat="server"><ContentTemplate>
<div class="container-fluid">
    <h2>Add Qustions</h2>
    <div class="row">
        <div class="col-md-12 table-responsive">
            <table class="table">
                <tr>
                    <td colspan="4">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">Qustion</span>
                            </div>
                            <asp:TextBox ID="txtQ" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>                            
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">First Option</span>
                            </div>
                            <asp:TextBox ID="txtA1" runat="server" CssClass="form-control"></asp:TextBox>
                            
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Second Option</span>
                            </div>
                            <asp:TextBox ID="txtA2" runat="server" CssClass="form-control"></asp:TextBox>
                            
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Third Option</span>
                            </div>
                            <asp:TextBox ID="txtA3" runat="server" CssClass="form-control"></asp:TextBox>
                            
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Fourth Option</span>
                            </div>
                            <asp:TextBox ID="txtA4" runat="server" CssClass="form-control"></asp:TextBox>
                            
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Right Option</span>
                            </div>
                            <asp:TextBox ID="txtRA" runat="server" CssClass="form-control"></asp:TextBox>
                            
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Qustion Mark</span>
                            </div>
                            <asp:TextBox ID="txtMark" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4"> 
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="txtQ" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="txtA1" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="txtA2" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" ControlToValidate="txtA3" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required Field" ControlToValidate="txtA4" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required Field" ControlToValidate="txtRA" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required Field" ControlToValidate="txtMark" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnNew" runat="server" CssClass="btn btn-primary" Width="100%" Text="New" /></td>
                    <td>
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Text="Add" Width="100%" /></td>
                    <td>
                        <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-warning" Text="Edit" Width="100%" /></td>
                    <td>
                        <asp:Button ID="btnDel" runat="server" CssClass="btn btn-danger" Text="Delete" Width="100%" /></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="GVQ" runat="server" Width="100%" CssClass="table table-hover" ForeColor="White" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="Id">
                <HeaderStyle CssClass="bg-warning" ForeColor="White" />
                <RowStyle CssClass="bg-dark" />
                <SelectedRowStyle CssClass="bg-danger" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="QString" HeaderText="Qustion" />
                    <asp:BoundField DataField="Option1" HeaderText="Option 1" />
                    <asp:BoundField DataField="Option2" HeaderText="Option 2" />
                    <asp:BoundField DataField="Option3" HeaderText="Option 3" />
                    <asp:BoundField DataField="Option4" HeaderText="Option 4" />
                    <asp:BoundField DataField="RightOption" HeaderText="Right Option" />
                    <asp:BoundField DataField="QMark" HeaderText="Mark" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>
</ContentTemplate></asp:UpdatePanel>
<asp:SqlDataSource ID="SDSQustion" runat="server" DeleteCommand="Delete From CoQu Where CoId=@CoId and Id=@Id" InsertCommand="Insert Into CoQu (CoId,QString,Option1,Option2,Option3,Option4,RightOption,QMark) Values (@CoId,@QString,@Option1,@Option2,@Option3,@Option4,@RightOption,@QMark)" SelectCommand="Select  * From CoQu Where CoId=@CoId" UpdateCommand="Update CoQu Set CoId=@CoId, QString=@QString,Option1=@Option1,Option2=@Option2,Option3=@Option3,Option4=@Option4,RightOption=@RightOption,QMark=@QMark Where CoId=@CoId and Id=@Id">
    <DeleteParameters>
        <asp:SessionParameter Name="CoId" SessionField="CNo" />
        <asp:SessionParameter Name="Id" SessionField="Id" />
    </DeleteParameters>
    <InsertParameters>
        <asp:SessionParameter Name="CoId" SessionField="CNo" />
        <asp:ControlParameter ControlID="txtQ" Name="QString" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtA1" Name="Option1" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtA2" Name="Option2" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtA3" Name="Option3" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtA4" Name="Option4" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtRA" Name="RightOption" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtMark" Name="QMark" PropertyName="Text" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="CoId" SessionField="CNo" />
    </SelectParameters>
    <UpdateParameters>
        <asp:SessionParameter Name="CoId" SessionField="CNo" />
        <asp:ControlParameter ControlID="txtQ" Name="QString" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtA1" Name="Option1" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtA2" Name="Option2" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtA3" Name="Option3" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtA4" Name="Option4" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtRA" Name="RightOption" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtMark" Name="QMark" PropertyName="Text" />
        <asp:SessionParameter Name="Id" SessionField="Id" />
    </UpdateParameters>
</asp:SqlDataSource>
