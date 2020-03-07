Public Class UserManagmentUC
    Inherits System.Web.UI.UserControl

    Dim DS, DS1, DSCredit As DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        SDSUsr.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSUsers.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS1 = SDSUsr.Select(DataSourceSelectArguments.Empty())
        If DS1.Table.Rows.Count <> 0 Then
            lblMsg.Text = "Data Saved"
            SDSUsers.Update()
        Else
            lblMsg.Text = "Data Saved"
            SDSUsers.Insert()
        End If
        Response.Redirect("~/UserManagmentWF.aspx")
    End Sub

    Private Sub GVUsers_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVUsers.SelectedIndexChanged
        txtID.Text = GVUsers.SelectedRow.Cells(1).Text
        Session("UsrNo") = GVUsers.SelectedRow.Cells(1).Text
        txtTitle.Text = GVUsers.SelectedRow.Cells(2).Text
        TextBox1.Text = GVUsers.SelectedRow.Cells(3).Text
        txtTitle3.Text = GVUsers.SelectedRow.Cells(4).Text
        Session("ImgPath") = GVUsers.SelectedRow.Cells(5).Text
        Image1.ImageUrl = GVUsers.SelectedRow.Cells(5).Text
        txtPrivi.SelectedValue = GVUsers.SelectedRow.Cells(6).Text
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        SDSUsers.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        If txtSearch.Text <> "" Then
            If IsNumeric(txtSearch.Text) Then

                SDSUsers.SelectCommand = "Select * From Users Where UserNo like '%" & txtSearch.Text & "%'"
                DS = SDSUsers.Select(DataSourceSelectArguments.Empty())
                GVUsers.DataSource = DS
                GVUsers.DataBind()
            Else
                SDSUsers.SelectCommand = "Select * From Users Where UserName Like '%" & txtSearch.Text & "%'"
                DS = SDSUsers.Select(DataSourceSelectArguments.Empty())
                GVUsers.DataSource = DS
                GVUsers.DataBind()
            End If
        Else
            SDSUsers.SelectCommand = "Select * From Users"
            DS = SDSUsers.Select(DataSourceSelectArguments.Empty())
            GVUsers.DataSource = DS
            GVUsers.DataBind()
        End If
    End Sub

    Private Sub GVUsers_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVUsers.PageIndexChanging
        GVUsers.PageIndex = e.NewPageIndex
        GVUsers.DataBind()
    End Sub

    Protected Sub btnNew1_Click(sender As Object, e As EventArgs) Handles btnNew1.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub btnUsers_Click(sender As Object, e As EventArgs) Handles btnUsers.Click
        MultiView1.ActiveViewIndex = 0
    End Sub
    Dim index As Integer
    Private Sub GVUsers_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GVUsers.RowCommand
        SDSUsers.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        If e.CommandName = "Details_click" Then
            index = Convert.ToInt32(e.CommandArgument)
            Session("UsrNo") = Convert.ToInt32(GVUsers.DataKeys(index).Value)
            Response.Redirect("~/UserDetailWF.aspx")
        ElseIf e.CommandName = "Delet_click" Then
            index = Convert.ToInt32(e.CommandArgument)
            Session("UsrNo") = Convert.ToInt32(GVUsers.DataKeys(index).Value)
            SDSUsers.Delete()
            GVUsers.DataBind()
            Response.Redirect("~\UserManagmentWF.aspx")
        End If
    End Sub

    Private Sub UserManagmentUC_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        SDSUsers.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS = SDSUsers.Select(DataSourceSelectArguments.Empty())
        GVUsers.DataSource = DS
        GVUsers.DataBind()
    End Sub
End Class