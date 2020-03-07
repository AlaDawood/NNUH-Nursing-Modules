<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CourseManagmentUC.ascx.vb" Inherits="NNUH_Nursing_Modules.CourseManagmentUC" %>
<%@ Register Assembly="DevExpress.Web.ASPxRichEdit.v18.1, Version=18.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRichEdit" TagPrefix="dx" %>

<%--<asp:ScriptManager runat="server"></asp:ScriptManager>
<asp:UpdatePanel runat="server" ID="UPanel">
    <ContentTemplate>--%>
<div class="container-fluid">
    <h2>Courses Management</h2>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col text-center">
            <ul class="list-group list-group-horizontal" style="width: 100%">
                <li class="list-group-item">
                    <asp:LinkButton ID="btnArt" CssClass="btn btn-primary" runat="server" Text="Articles Courses" CausesValidation="False"></asp:LinkButton></li>
                <li class="list-group-item">
                    <asp:LinkButton ID="btnVid" CssClass="btn btn-primary" runat="server" Text="Videos Courses" CausesValidation="False"></asp:LinkButton></li>
                <li class="list-group-item">
                    <asp:LinkButton ID="btnSli" runat="server" CssClass="btn btn-primary" Text="Slides Courses" CausesValidation="False"></asp:LinkButton></li>
            </ul>
        </div>
        <div class="col-md-3"></div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <%-- Articles Courses --%>
                <asp:View ID="View1" runat="server">
                    <div class="row">                        
                        <asp:DataList ID="ilArCourses" BorderColor="black" CellPadding="5" CellSpacing="5" DataKeyField="Id"
                            OnEditCommand="ItemsList_EditCommand" OnCancelCommand="ItemsList_CancelCommand"
                            OnDeleteCommand="ItemsList_DeleteCommand" OnUpdateCommand="ilArCourses_UpdateCommand" OnSelectedIndexChanged="ilArCourses_SelectedIndexChanged"
                            RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="4" CssClass="table" runat="server">
                            <HeaderStyle CssClass="h3 card-header"></HeaderStyle>
                            <AlternatingItemStyle></AlternatingItemStyle><ItemStyle Width="25%" />
                            <HeaderTemplate>                       
                                <asp:LinkButton runat="server" ID="BtnAddCourse" Text="Add New" OnClick="BtnAddCourse_Click" CssClass="btn btn-warning"></asp:LinkButton>  Articles Courses
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="card">
                                    <div class="text-center">
                                    <asp:Image ID="COImg" CssClass="card-img-top text-center" AlternateText="Product picture"
                                        ImageUrl='<%# DataBinder.Eval(Container.DataItem, "CoImg") %>'
                                        runat="server" Width="150px" Height="150" /></div>
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item h4 text-success hidden">
                                                <asp:Label ID="lblID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'></asp:Label>
                                                <asp:TextBox runat="server" ID="txtArt" Text='<%# DataBinder.Eval(Container.DataItem, "CoPara") %>'></asp:TextBox>
                                            </li>
                                            <li class="list-group-item h4 text-success text-wrap">
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CoTitle") %>'></asp:Label></li>
                                            <li class="list-group-item text-muted">Credit Hours:
                                                <asp:Label ID="lblCredit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CreditHr") %>'></asp:Label></li>
                                            <li class="list-group-item text-muted">Course Type: 
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="TextBox1" Enabled="false" ReadOnly="true" text='<%# Bind("CoType")%>'>
                                                    <asp:ListItem Value=0 Text="Zero Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value=1 Text="Zero Credit Hrs Need Approval"></asp:ListItem>
                                                    <asp:ListItem Value=2 Text="Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value=3 Text="Credit Hrs Need Approval"></asp:ListItem>
                                                </asp:DropDownList>
                                            </li>
                                            <li class="list-group-item text-center">
                                                <asp:LinkButton ID="EditButton" Text="Edit" CommandName="Edit" CssClass="btn btn-primary" Width="49%" runat="server"></asp:LinkButton>
                                                <asp:LinkButton ID="DeleteButton" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" Width="49%" runat="server"></asp:LinkButton>
                                            </li>
                                            <li class="list-group-item">
                                                <asp:LinkButton ID="btnAddQ" CssClass="btn btn-secondary" runat="server" Text="Add question for this course" CommandName="Select" Width="100%"></asp:LinkButton>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="card">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item hidden">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">ID</span>
                                                </div>
                                                <asp:TextBox ID="txtID" CssClass="form-control" ReadOnly="true" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Title</span>
                                                </div>
                                                <asp:TextBox ID="txtTitl" CssClass="form-control" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CoTitle") %>'></asp:TextBox>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Credit Hour</span>
                                                </div>
                                                <asp:TextBox ID="txtCredit" CssClass="form-control" CausesValidation="true" TextMode="Number" Text='<%# Bind("CreditHr") %>' runat="server"></asp:TextBox>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Image</span>
                                                </div>
                                                <asp:FileUpload ID="FUImage" CssClass="form-control" runat="server" />
                                                <div class="text-center">
                                                <asp:Image runat="server" ID="COImg" Width="50px" ImageUrl='<%# Bind("CoImg") %>' /></div>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Article</span>
                                                </div>
                                                <asp:FileUpload ID="FUArticle" runat="server" CssClass="form-control" />
                                                <asp:TextBox runat="server" CssClass="hidden" ID="txtArt" ReadOnly="true" Text='<%# Bind("Copara") %>'></asp:TextBox>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Course Type</span>
                                                </div>
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="TextBox1" ReadOnly="true" text='<%# Bind("CoType")%>'>
                                                    <asp:ListItem Value=0 Text="Zero Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value=1 Text="Zero Credit Hrs Need Approval"></asp:ListItem>
                                                    <asp:ListItem Value=2 Text="Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value=3 Text="Credit Hrs Need Approval"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </li>
                                        <li class="list-group-item hidden">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Article Viewer</span>
                                                </div>
                                                <dx:ASPxRichEdit ID="EditorDoc" runat="server" CssClass="form-control" Theme="Default" WorkDirectory="~\" Height="200px" Width="450px">
                                                </dx:ASPxRichEdit>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div>
                                                <%--<asp:UpdateProgress runat="server" AssociatedUpdatePanelID="UPanel">
                                                    <ProgressTemplate>
                                                        Saving Data ...
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>--%>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title Required Field" ControlToValidate="txtTitl" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <asp:LinkButton ID="UpdateButton" CssClass="btn btn-success" Text="Update" CommandName="Update" Width="100%" runat="server" /></li>
                                        <li class="list-group-item">
                                            <asp:LinkButton ID="CancelButton" CssClass="btn btn-warning" Text="Cancel" CommandName="Cancel" Width="100%" runat="server" /></li>
                                    </ul>
                                </div>
                            </EditItemTemplate>
                        </asp:DataList>
                    </div>
                </asp:View>
                <asp:View runat="server" ID="View4">
                    <div class="row table-responsive">
                        <h4 class="card-header">Add New Article Course</h4>
                        <table class="table">
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Title</span>
                                        </div>
                                        <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Credit Hour</span>
                                        </div>
                                        <asp:TextBox ID="txtCredit" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Image</span>
                                        </div>
                                        <asp:FileUpload ID="FUImag" CssClass="form-control" runat="server" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Article</span>
                                        </div>
                                        <asp:FileUpload ID="FUArticl" runat="server" CssClass="form-control" />
                                        <div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Course Type</span>
                                        </div>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="TextBox1" ReadOnly="true">
                                            <asp:ListItem Value="0" Text="Zero Credit Hrs"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Zero Credit Hrs Need Approval"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Credit Hrs"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Credit Hrs Need Approval"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr class="hidden">
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Article Viewer</span>
                                        </div>
                                        <dx:ASPxRichEdit ID="Editor1" runat="server" CssClass="form-control" Theme="Office2010Black" WorkDirectory="~\" Height="600px" Width="100%"></dx:ASPxRichEdit>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" OnClick="btnAdd_Click" Text="Save" Width="100%" /></td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
                <%-- End Articles Courses --%>

                <%-- Videos Courses --%>
                <asp:View ID="View2" runat="server">
                    <div class="row">                        
                        <asp:DataList ID="ilVidCourses" BorderColor="black" CellPadding="5" CellSpacing="5" DataKeyField="Id"
                            OnEditCommand="ilVidCourses_EditCommand" OnCancelCommand="ilVidCourses_CancelCommand"
                            OnDeleteCommand="ilVidCourses_DeleteCommand" OnUpdateCommand="ilVidCourses_UpdateCommand" OnSelectedIndexChanged="ilVidCourses_SelectedIndexChanged"
                            RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="4" CssClass="table" runat="server">
                            <HeaderStyle CssClass="h3 card-header"></HeaderStyle>
                            <AlternatingItemStyle></AlternatingItemStyle><ItemStyle Width="25%" />
                            <HeaderTemplate>                       
                                <asp:LinkButton runat="server" ID="BtnAddVidCourse" Text="Add New" OnClick="BtnAddVidCourse_Click" CssClass="btn btn-warning"></asp:LinkButton>  Videos Courses
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="card">
                                    <div class="text-center">
                                    <asp:Image ID="COVidImg" CssClass="card-img-top text-center" AlternateText="Product picture"
                                        ImageUrl='<%# DataBinder.Eval(Container.DataItem, "CoImg") %>'
                                        runat="server" Width="150px" Height="150" /></div>
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item h4 text-success hidden">
                                                <asp:Label ID="lblID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'></asp:Label>
                                                <asp:TextBox runat="server" ID="txtVid" CssClass="hidden" Text='<%# DataBinder.Eval(Container.DataItem, "CoVid") %>'></asp:TextBox>
                                            </li>
                                            <li class="list-group-item h4 text-success text-wrap">
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CoTitle") %>'></asp:Label></li>
                                            <li class="list-group-item text-muted">Credit Hours:
                                                <asp:Label ID="lblCredit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CreditHr") %>'></asp:Label></li>
                                            <li class="list-group-item text-muted">Course Type:    
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="DropDownList1" ReadOnly="true" Enabled="false" Text='<%# Bind("CoType") %>'>
                                                    <asp:ListItem Value="0" Text="Zero Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Zero Credit Hrs Need Approval"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Credit Hrs Need Approval"></asp:ListItem>
                                                </asp:DropDownList>
                                            </li>
                                            <li class="list-group-item text-center">
                                                <asp:LinkButton ID="EditButton" Text="Edit" CommandName="Edit" CssClass="btn btn-primary" Width="49%" runat="server"></asp:LinkButton>
                                                <asp:LinkButton ID="DeleteButton" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" Width="49%" runat="server"></asp:LinkButton>
                                            </li>
                                            <li class="list-group-item">
                                                <asp:LinkButton ID="btnAddQ" CssClass="btn btn-secondary" runat="server" Text="Add question for this course" CommandName="Select" Width="100%"></asp:LinkButton>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="card">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item hidden">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">ID</span>
                                                </div>
                                                <asp:TextBox ID="txtVidID" CssClass="form-control" ReadOnly="true" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Title</span>
                                                </div>
                                                <asp:TextBox ID="txtVidTitl" CssClass="form-control" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CoTitle") %>'></asp:TextBox>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Credit Hour</span>
                                                </div>
                                                <asp:TextBox ID="txtVidCredit" CssClass="form-control" CausesValidation="true" TextMode="Number" Text='<%# Bind("CreditHr") %>' runat="server"></asp:TextBox>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Course Type</span>
                                                </div>
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="DropDownList1" ReadOnly="true" text='<%# Bind("CoType")%>'>
                                                    <asp:ListItem Value="0" Text="Zero Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Zero Credit Hrs Need Approval"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Credit Hrs Need Approval"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Image</span>
                                                </div>
                                                <asp:FileUpload ID="FUVidImage" CssClass="form-control" runat="server" />
                                                <div class="text-center">
                                                <asp:Image runat="server" ID="COVidImg" Width="50px" ImageUrl='<%# Bind("CoImg") %>' /></div>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Video</span>
                                                </div>
                                                <asp:FileUpload ID="FUVideo" runat="server" CssClass="form-control" />
                                                <asp:TextBox runat="server" CssClass="hidden" ID="txtVid" ReadOnly="true" Text='<%# Bind("CoVid") %>'></asp:TextBox>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Description</span>
                                                </div>
                                                <textarea id="txtPara" class="form-control" runat="server"><%# Eval("Copara") %></textarea>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title Required Field" ControlToValidate="txtVidTitl" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <asp:LinkButton ID="UpdateButton" CssClass="btn btn-success" Text="Update" CommandName="Update" Width="100%" runat="server" /></li>
                                        <li class="list-group-item">
                                            <asp:LinkButton ID="CancelButton" CssClass="btn btn-warning" Text="Cancel" CommandName="Cancel" Width="100%" runat="server" /></li>
                                    </ul>
                                </div>
                            </EditItemTemplate>
                        </asp:DataList>
                    </div>
                </asp:View>
                <asp:View runat="server" ID="View5">
                    <div class="row table-responsive">
                        <table class="table" style="width: 100%">
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">ID</span>
                                        </div>
                                        <asp:TextBox ID="txtID1" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Title</span>
                                        </div>
                                        <asp:TextBox ID="txtTitle1" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" ControlToValidate="txtTitle1" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Credit Hours</span>
                                        </div>
                                        <asp:TextBox ID="txtCredit1" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>                                        
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Course Type</span>
                                        </div>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="DropDownList1" ReadOnly="true">
                                            <asp:ListItem Value="0" Text="Zero Credit Hrs"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Zero Credit Hrs Need Approval"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Credit Hrs"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Credit Hrs Need Approval"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Video Link</span>
                                        </div>
                                        <asp:FileUpload ID="FUVideo" CssClass="form-control" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FUVideo" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Image</span>
                                        </div>
                                        <asp:FileUpload ID="FUImage2" CssClass="form-control" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FUImage2" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Description</span>
                                        </div>
                                        <textarea id="txtPara" class="form-control" runat="server"></textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnAdd1" CssClass="btn btn-primary" OnClick="btnAdd1_Click" runat="server" Text="Save" Width="100%" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
                <%-- End Videos Courses --%>

                <%-- Slides Courses --%>
                <asp:View ID="View3" runat="server">
                    <div class="row">                        
                        <asp:DataList ID="ilSliCourses" BorderColor="black" CellPadding="5" CellSpacing="5" DataKeyField="Id"
                            OnEditCommand="ilSliCourses_EditCommand" OnCancelCommand="ilSliCourses_CancelCommand" OnItemCommand="ilSliCourses_ItemCommand"
                            OnDeleteCommand="ilSliCourses_DeleteCommand" OnUpdateCommand="ilSliCourses_UpdateCommand" OnSelectedIndexChanged="ilSliCourses_SelectedIndexChanged"
                            RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="4" CssClass="table" runat="server">
                            <HeaderStyle CssClass="h3 card-header"></HeaderStyle>
                            <AlternatingItemStyle></AlternatingItemStyle><ItemStyle Width="25%" />
                            <HeaderTemplate>                       
                                <asp:LinkButton runat="server" ID="BtnAddSliCourse" Text="Add New" OnClick="BtnAddSliCourse_Click" CssClass="btn btn-warning"></asp:LinkButton>  Slide Courses
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="card">
                                    <div class="text-center">
                                    <asp:Image ID="CoSliImg" CssClass="card-img-top text-center" AlternateText="Product picture"
                                        ImageUrl='<%# DataBinder.Eval(Container.DataItem, "CoImg") %>'
                                        runat="server" Width="150px" Height="150" /></div>
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item h4 text-success hidden">
                                                <asp:Label ID="lblID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'></asp:Label></li>
                                            <li class="list-group-item h4 text-success text-wrap">
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CoTitle") %>'></asp:Label></li>
                                            <li class="list-group-item text-muted">Credit Hours:
                                                <asp:Label ID="lblCredit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CreditHr") %>'></asp:Label></li>
                                            <li class="list-group-item text-muted">Course Type:    
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="DropDownList2" ReadOnly="true" Enabled="false" Text='<%# Bind("CoType") %>'>
                                                    <asp:ListItem Value="0" Text="Zero Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Zero Credit Hrs Need Approval"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Credit Hrs Need Approval"></asp:ListItem>
                                                </asp:DropDownList>
                                            </li>
                                            <li class="list-group-item text-center">
                                                <asp:LinkButton ID="EditButton" Text="Edit" CommandName="Edit" CssClass="btn btn-primary" Width="49%" runat="server"></asp:LinkButton>
                                                <asp:LinkButton ID="DeleteButton" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" Width="49%" runat="server"></asp:LinkButton>
                                            </li>
                                            <li class="list-group-item">
                                                <asp:LinkButton ID="btnAddQ" CssClass="btn btn-secondary" runat="server" Text="Add question for this course" CommandName="Select" Width="100%"></asp:LinkButton>
                                            </li>
                                            <li class="list-group-item">
                                                <asp:LinkButton ID="btnAddSlide" CommandName="AddQ" CssClass="btn btn-secondary" runat="server" Text="Add course slides" Width="100%"></asp:LinkButton>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="card">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item hidden">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">ID</span>
                                                </div>
                                                <asp:TextBox ID="txtSliID" CssClass="form-control" ReadOnly="true" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Title</span>
                                                </div>
                                                <asp:TextBox ID="txtSliTitl" CssClass="form-control" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CoTitle") %>'></asp:TextBox>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Course Type</span>
                                                </div>
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="DropDownList2" ReadOnly="true" text='<%# Bind("CoType")%>'>
                                                    <asp:ListItem Value="0" Text="Zero Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Zero Credit Hrs Need Approval"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Credit Hrs"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Credit Hrs Need Approval"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Credit Hour</span>
                                                </div>
                                                <asp:TextBox ID="txtSliCredit" CssClass="form-control" CausesValidation="true" TextMode="Number" Text='<%# Bind("CreditHr") %>' runat="server"></asp:TextBox>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Image</span>
                                                </div>
                                                <asp:FileUpload ID="FUSliImage" CssClass="form-control" runat="server" />
                                                <div class="text-center">
                                                <asp:Image runat="server" ID="COSliImg" Width="50px" ImageUrl='<%# Bind("CoImg") %>' /></div>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title Required Field" ControlToValidate="txtSliTitl" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <asp:LinkButton ID="UpdateButton" CssClass="btn btn-success" Text="Update" CommandName="Update" Width="100%" runat="server" /></li>
                                        <li class="list-group-item">
                                            <asp:LinkButton ID="CancelButton" CssClass="btn btn-warning" Text="Cancel" CommandName="Cancel" Width="100%" runat="server" /></li>
                                    </ul>
                                </div>
                            </EditItemTemplate>
                        </asp:DataList>
                    </div>                    
                </asp:View>
                <asp:View runat="server" ID="View6">
                    <div class="row table-responsive">
                        <table class="table">
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Title</span>
                                        </div>
                                        <asp:TextBox ID="txtTitle2" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtTitle2" ErrorMessage="Required Field" ForeColor="Red" Width="100px"></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Credit Hours</span>
                                        </div>
                                        <asp:TextBox ID="txtCredit2" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>                                        
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Course Type</span>
                                        </div>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="DropDownList2" ReadOnly="true">
                                            <asp:ListItem Value="0" Text="Zero Credit Hrs"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Zero Credit Hrs Need Approval"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Credit Hrs"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Credit Hrs Need Approval"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Image</span>
                                        </div>
                                        <asp:FileUpload ID="FUImage3" CssClass="form-control" runat="server" />                                       
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnAdd2" runat="server" OnClick="btnAdd2_Click" CssClass="btn btn-primary" Text="Add" Width="100%" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</div>
<asp:SqlDataSource ID="SDSCourses" runat="server" SelectCommand="Select * from ArtCourses" InsertCommand="INSERT INTO ArtCourses (CoTitle,Copara,CoImg,CreditHr,CoType) VALUES (@CoTitle,@CoPara,@CoImg,@CreditHr,@CoType)" DeleteCommand="Delete  From ArtCourses Where Id=@Id" UpdateCommand="Update ArtCourses Set CoTitle=@CoTitle,CoPara=@CoPara,CoImg=@CoImg, CreditHr=@CreditHr, CoType=@CoType Where Id=@Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="txtTitle" Name="CoTitle" PropertyName="Text" />
        <asp:SessionParameter Name="CoPara" SessionField="ArtPath" />
        <asp:SessionParameter Name="CoImg" SessionField="ImgPath" />
        <asp:ControlParameter ControlID="txtCredit" Name="CreditHr" PropertyName="Text" />
        <asp:ControlParameter Name="CoType" ControlID="TextBox1" DbType="Int32" PropertyName="SelectedValue" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CoTitle" />
        <asp:Parameter Name="CoPara" />
        <asp:Parameter Name="CoImg" />
        <asp:Parameter Name="Id" Type="Int32" />
        <asp:Parameter Name="CreditHr" Type="Int32" />
        <asp:Parameter Name="CoType" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SDSVideo" runat="server" SelectCommand="Select * from VidCourses" InsertCommand="INSERT INTO VidCourses (CoTitle,Copara,CoImg,CoVid,CreditHr,CoType) VALUES (@CoTitle,@CoPara,@CoImg,@CoVid,@CreditHr,@CoType)" DeleteCommand="Delete  From VidCourses Where Id=@Id" UpdateCommand="Update VidCourses Set CoTitle=@CoTitle,Copara=@Copara,CoImg=@CoImg,CoVid=@CoVid,CreditHr=@CreditHr, CoType=@CoType Where Id=@Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="txtTitle1" Name="CoTitle" PropertyName="Text" />
        <asp:SessionParameter Name="CoPara" SessionField="CoPara" />
        <asp:SessionParameter Name="CoImg" SessionField="ImgPath" />
        <asp:SessionParameter Name="CoVid" SessionField="VidPath" />
        <asp:ControlParameter ControlID="txtCredit1" Name="CreditHr" PropertyName="Text" />
        <asp:ControlParameter ControlID="DropDownList1" Name="CoType" PropertyName="SelectedValue" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CoTitle" />
        <asp:Parameter Name="CoImg" />
        <asp:Parameter Name="Id" />
        <asp:Parameter Name="Copara" />
        <asp:Parameter Name="CoVid" />
        <asp:Parameter Name="CreditHr" />
        <asp:Parameter Name="CoType" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SDSSlide" runat="server" SelectCommand="Select * from SliCourses" InsertCommand="INSERT INTO SliCourses (CoTitle,CoImg,CreditHr, CoType) VALUES (@CoTitle,@CoImg,@CreditHr,@CoType)" DeleteCommand="Delete  From SliCourses Where Id=@Id" UpdateCommand="Update SliCourses Set CoTitle=@CoTitle,CoImg=@CoImg,CreditHr=@CreditHr, CoType=@CoType Where Id=@Id">

    <DeleteParameters>
        <asp:Parameter Name="Id" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="txtTitle2" Name="CoTitle" PropertyName="Text" />
        <asp:SessionParameter Name="CoImg" SessionField="ImgPath" />
        <asp:ControlParameter ControlID="txtCredit2" Name="CreditHr" PropertyName="Text" />
        <asp:ControlParameter ControlID="DropDownList2" Name="CoType" PropertyName="SelectedValue" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CoTitle" />
        <asp:Parameter Name="CoImg" />
        <asp:Parameter Name="Id" />
        <asp:Parameter Name="CreditHr" />
        <asp:Parameter Name="CoType" />
    </UpdateParameters>
</asp:SqlDataSource>
<%--    </contenttemplate>
</asp:updatepanel>--%>
