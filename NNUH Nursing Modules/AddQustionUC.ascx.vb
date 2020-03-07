Public Class AddQustionUC
    Inherits System.Web.UI.UserControl
    Dim DS As New DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSQustion.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS = SDSQustion.Select(DataSourceSelectArguments.Empty())

        If Session("T") = 0 Then
            SDSQustion.SelectCommand = "Select  * From CoQu Where CoId=@CoId"
            SDSQustion.InsertCommand = "Insert Into CoQu (CoId,QString,Option1,Option2,Option3,Option4,RightOption,QMark) Values (@CoId,@QString,@Option1,@Option2,@Option3,@Option4,@RightOption,@QMark)"
            SDSQustion.DeleteCommand = "Delete From CoQu Where CoId=@CoId and Id=@Id"
            SDSQustion.UpdateCommand = "Update CoQu Set CoId=@CoId, QString=@QString,Option1=@Option1,Option2=@Option2,Option3=@Option3,Option4=@Option4,RightOption=@RightOption,QMark=@QMark Where CoId=@CoId and Id=@Id"
        ElseIf Session("T") = 1 Then
            SDSQustion.SelectCommand = "Select  * From CoQu1 Where CoId=@CoId"
            SDSQustion.InsertCommand = "Insert Into CoQu1 (CoId,QString,Option1,Option2,Option3,Option4,RightOption,QMark) Values (@CoId,@QString,@Option1,@Option2,@Option3,@Option4,@RightOption,@QMark)"
            SDSQustion.DeleteCommand = "Delete From CoQu1 Where CoId=@CoId and Id=@Id"
            SDSQustion.UpdateCommand = "Update CoQu1 Set CoId=@CoId, QString=@QString,Option1=@Option1,Option2=@Option2,Option3=@Option3,Option4=@Option4,RightOption=@RightOption,QMark=@QMark Where CoId=@CoId and Id=@Id"
        ElseIf Session("T") = 2 Then
            SDSQustion.SelectCommand = "Select  * From CoQu2 Where CoId=@CoId"
            SDSQustion.InsertCommand = "Insert Into CoQu2 (CoId,QString,Option1,Option2,Option3,Option4,RightOption,QMark) Values (@CoId,@QString,@Option1,@Option2,@Option3,@Option4,@RightOption,@QMark)"
            SDSQustion.DeleteCommand = "Delete From CoQu2 Where CoId=@CoId and Id=@Id"
            SDSQustion.UpdateCommand = "Update CoQu2 Set CoId=@CoId, QString=@QString,Option1=@Option1,Option2=@Option2,Option3=@Option3,Option4=@Option4,RightOption=@RightOption,QMark=@QMark Where CoId=@CoId and Id=@Id"
        End If
        GVQ.DataSource = SDSQustion
        GVQ.DataBind()
    End Sub

    Protected Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click
        txtQ.Text = ""
        txtA1.Text = ""
        txtA2.Text = ""
        txtA3.Text = ""
        txtA4.Text = ""
        txtMark.Text = ""
        txtRA.Text = ""
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        SDSQustion.Insert()
        Response.Redirect("~/AddQustionWF.aspx")
    End Sub

    Protected Sub btnEdit_Click(sender As Object, e As EventArgs) Handles btnEdit.Click
        SDSQustion.Update()
        Response.Redirect("~/AddQustionWF.aspx")
    End Sub

    Protected Sub btnDel_Click(sender As Object, e As EventArgs) Handles btnDel.Click
        SDSQustion.Delete()
        Response.Redirect("~/AddQustionWF.aspx")
    End Sub

    Private Sub GVQ_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVQ.PageIndexChanging
        GVQ.PageIndex = e.NewPageIndex
        GVQ.DataBind()
    End Sub

    Private Sub GVQ_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVQ.SelectedIndexChanged
        Session("Id") = GVQ.SelectedRow.Cells(1).Text
        txtQ.Text = GVQ.SelectedRow.Cells(2).Text
        txtA1.Text = GVQ.SelectedRow.Cells(3).Text
        txtA2.Text = GVQ.SelectedRow.Cells(4).Text
        txtA3.Text = GVQ.SelectedRow.Cells(5).Text
        txtA4.Text = GVQ.SelectedRow.Cells(6).Text
        txtRA.Text = GVQ.SelectedRow.Cells(7).Text
        txtMark.Text = GVQ.SelectedRow.Cells(8).Text
    End Sub
End Class