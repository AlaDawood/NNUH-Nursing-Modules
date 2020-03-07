Imports System.IO

Public Class AddCourseSlides
    Inherits System.Web.UI.UserControl
    Dim DS As DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSSlides.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS = SDSSlides.Select(DataSourceSelectArguments.Empty())
        txtID.Text = Session("SliId")
        txtTitle.Text = Session("SliTitle")
        Dim ListHtml As String = "<Table class='table'>"
        Dim s As Integer = 0
        For itmNo = 0 To DS.Table.Rows.Count - 1
            s += 1
            If s < 3 Then
                ListHtml = ListHtml & "<td><div class='card'><a href='#'><img src='" & DS.Table.Rows(itmNo).Item(2) & "' class='img-thumbnail rounded mx-auto d-block' width='200' /><div class='card-body'><h3 class='card-title'>Slide" & (itmNo + 1) & " </h3></div></a></div></td>"
            ElseIf s > 3 Then
                s = 0
                ListHtml = ListHtml & "<tr><td><div class='card'><a href='#'><img src='" & DS.Table.Rows(itmNo).Item(2) & "' class='img-thumbnail rounded mx-auto d-block' width='200' /><div class='card-body'><h3>Slide" & (itmNo + 1) & " </h3></div></a></div></td>"
            ElseIf s = 3 Then
                s = 0
                ListHtml = ListHtml & "<td><div class='card'><a href='#'><img src='" & DS.Table.Rows(itmNo).Item(2) & "' class='img-thumbnail rounded mx-auto d-block' width='200' /><div class='card-body'><h3>Slide" & (itmNo + 1) & " </h3></div></a></div></td>"
                ListHtml = ListHtml & "</tr>"
            End If
        Next
        ListHtml = ListHtml & "</Table>"
        List.InnerHtml = ListHtml
    End Sub

    Protected Sub btnBack_Click(sender As Object, e As EventArgs) Handles btnBack.Click
        Session("Redirect") = 4
        Response.Redirect("~/CoursesManagmentWF.aspx")
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        Dim ImageFiles As HttpFileCollection = Request.Files

        For i As Integer = 0 To ImageFiles.Count - 1
            Dim file As HttpPostedFile = ImageFiles(i)
            Dim zName As String = DateTime.Now.Ticks.ToString
            file.SaveAs(Server.MapPath("/SliSubImg/") & zName & i & ".jpg")
            Session("ImgPath") = "/SliSubImg/" & zName & i & ".jpg"
            SDSSlides.Insert()
        Next
        SDSSlides.Select(DataSourceSelectArguments.Empty())
        Response.Redirect("~/AddCourseSlidesWF.aspx")
    End Sub

    Protected Sub btnDel_Click(sender As Object, e As EventArgs) Handles btnDel.Click
        For x = 0 To DS.Table.Rows.Count - 1
            If File.Exists(Server.MapPath(DS.Table.Rows(x).Item(2).ToString)) Then
                File.Delete(Server.MapPath(DS.Table.Rows(x).Item(2).ToString))
            End If
        Next
        SDSSlides.Delete()
    End Sub
End Class