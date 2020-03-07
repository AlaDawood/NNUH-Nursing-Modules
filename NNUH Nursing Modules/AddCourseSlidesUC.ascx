<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="AddCourseSlidesUC.ascx.vb" Inherits="NNUH_Nursing_Modules.AddCourseSlides" %>

<div class="container-fluid">
    <h2>Add Course Slides</h2>
    <div class="row">
        <div class="col-md-12 table-responsive">
            <table class="table">
                <tr>
                    <td colspan="3">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">Course ID</span>
                            </div>
                            <asp:TextBox ID="txtID" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Course Title</span>
                            </div>
                            <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Slides</span>
                            </div>
                            <asp:FileUpload ID="FUImg" runat="server" CssClass="form-control" AllowMultiple="True" />
                        <br /><asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" ErrorMessage="Only Images" 
 ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.bmp|.gif|.png)$" ControlToValidate="FUImg" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnBack" CssClass="btn btn-secondary" runat="server" Width="100%" Text="Back" /></td>
                    <td><asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" Width="100%" Text="Add" /></td>
                    <td><asp:Button ID="btnDel" CssClass="btn btn-danger" runat="server" Width="100%" Text="Delete" /></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 table-responsive" id="List" runat="server">

        </div>
    </div>
</div>

<asp:SqlDataSource ID="SDSSlides" runat="server" InsertCommand="Insert Into SliSubCourses (SliCoId,SubPage) Values (@SliSubCourses,@SubPage)" SelectCommand="Select * From SliSubCourses Where SliCoId=@Id" DeleteCommand="Delete From SliSubCourses Where SliCoId=@Id">
    <DeleteParameters>
        <asp:ControlParameter ControlID="txtID" Name="Id" PropertyName="Text" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="txtID" Name="SliSubCourses" PropertyName="Text" />
        <asp:SessionParameter Name="SubPage" SessionField="ImgPath" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="SliId" />
    </SelectParameters>
</asp:SqlDataSource>
