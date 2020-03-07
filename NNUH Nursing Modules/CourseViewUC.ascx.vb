Imports System.Text.RegularExpressions
Imports System.IO
Imports Microsoft.Office.Interop.Word
Public Class CourseViewUC
    Inherits System.Web.UI.UserControl
    Public htmlFilePath As Object
    Public directoryPath As String
    Dim DS, DS1 As DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSView.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS = SDSView.Select(DataSourceSelectArguments.Empty())
        lblTitle.Text = DS.Table.Rows(0).Item(1)
        Session("Title") = DS.Table.Rows(0).Item(1)
        Image1.ImageUrl = DS.Table.Rows(0).Item(3)
        lblCredit.Text = DS.Table.Rows(0).Item(4)
        '----------------------------------------------------------------------------
        htmlFilePath = Server.MapPath("/CoursePage/") & DS.Table.Rows(0).Item(2).ToString()

        'Read the saved Html File.
        Dim wordHTML As String = System.IO.File.ReadAllText(htmlFilePath.ToString)

        'Loop and replace the Image Path.
        'For Each match As Match In Regex.Matches(wordHTML, "<img\s[^\>]*src\s*=\s*[""']([^/<]*/)*([^""']+)[^\>]*\s*/*>", RegexOptions.IgnoreCase)
        '    wordHTML = Regex.Replace(wordHTML, match.Groups(1).Value, ("/CoursePage/" & match.Groups(1).Value))
        'Next
        Content1.InnerHtml = wordHTML
        '-------------------------------------------------------------------------------------------
        lblDate.Text = Now.Date
    End Sub

    Protected Sub btnTest_Click(sender As Object, e As EventArgs) Handles btnTest.Click
        If Session("UNo") <> Nothing Then
            SDSView.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            SDSView.SelectCommand = "Select * From UserCourses Where UserNo = @UserNo And CoType = @CoType And CoId = @CoId"
            DS1 = SDSView.Select(DataSourceSelectArguments.Empty())
            If DS1.Table.Rows.Count <> 0 Then
                SDSView.SelectCommand = "Select Id,CoTitle,CoPara,CoImg,CreditHr,CoType From ArtCourses Where Id=@Id"
                DS = SDSView.Select(DataSourceSelectArguments.Empty())
                If DS.Table.Rows(0).Item(5) = 0 Then
                    Session("First") = 20
                    Session("Mark1") = 0
                    Session("MarkAll") = 0
                    Session("Approval") = DS1.Table.Rows(0).Item(9)
                    Session("CoType") = 0
                    Response.Redirect("~/CertificateWF.aspx")
                ElseIf DS.Table.Rows(0).Item(5) = 1 Then
                    If DS1.Table.Rows(0).Item(9) = 1 Then
                        Session("First") = 20
                        Session("Mark1") = 0
                        Session("MarkAll") = 0
                        Session("Approval") = DS1.Table.Rows(0).Item(9)
                        Response.Redirect("~/CertificateWF.aspx")
                    Else
                        Session("First") = 20
                        Session("Mark1") = 0
                        Session("MarkAll") = 0
                        Session("Approval") = DS1.Table.Rows(0).Item(9)
                        Response.Redirect("~/CertificateWF.aspx")
                    End If
                    Session("CoType") = 1
                ElseIf DS.Table.Rows(0).Item(5) = 2 Then
                    If DS1.Table.Rows(0).Item(6) = 20 Then
                        Session("First") = DS1.Table.Rows(0).Item(6)
                        Session("Mark1") = DS1.Table.Rows(0).Item(4)
                        Session("MarkAll") = DS1.Table.Rows(0).Item(5)
                        Session("Approval") = DS1.Table.Rows(0).Item(9)
                        Response.Redirect("~/CertificateWF.aspx")
                    Else
                        Session("First") = DS1.Table.Rows(0).Item(6)
                        Session("Mark1") = DS1.Table.Rows(0).Item(4)
                        Session("MarkAll") = DS1.Table.Rows(0).Item(5)
                        Session("Approval") = DS1.Table.Rows(0).Item(9)
                        Response.Redirect("~/QuastionWF.aspx")
                    End If
                    Session("CoType") = 2
                ElseIf DS.Table.Rows(0).Item(5) = 3 Then
                    If DS1.Table.Rows(0).Item(6) = 20 Then
                        Session("First") = DS1.Table.Rows(0).Item(6)
                        Session("Mark1") = DS1.Table.Rows(0).Item(4)
                        Session("MarkAll") = DS1.Table.Rows(0).Item(5)
                        Session("Approval") = DS1.Table.Rows(0).Item(9)
                        Response.Redirect("~/CertificateWF.aspx")
                    Else
                        Session("First") = DS1.Table.Rows(0).Item(6)
                        Session("Mark1") = DS1.Table.Rows(0).Item(4)
                        Session("MarkAll") = DS1.Table.Rows(0).Item(5)
                        Session("Approval") = DS1.Table.Rows(0).Item(9)
                        Response.Redirect("~/QuastionWF.aspx")
                    End If
                    Session("CoType") = 3
                End If
            Else
                If DS.Table.Rows(0).Item(5) = 0 Then
                    Session("First") = 20
                    Session("Mark1") = 0
                    Session("MarkAll") = 0
                    Session("Approval") = 1
                    Session("CoType") = 0
                    SDSView.Insert()
                    Response.Redirect("~/CertificateWF.aspx")
                ElseIf DS.Table.Rows(0).Item(5) = 1 Then
                    Session("First") = 20
                    Session("Mark1") = 0
                    Session("MarkAll") = 0
                    Session("Approval") = 0
                    Session("CoType") = 1
                    SDSView.Insert()
                    Response.Redirect("~/CertificateWF.aspx")
                ElseIf DS.Table.Rows(0).Item(5) = 2 Then
                    Session("First") = 0
                    Session("Mark1") = 0
                    Session("MarkAll") = 0
                    Session("Approval") = 1
                    Session("CoType") = 2
                    SDSView.Insert()
                    Response.Redirect("~/QuastionWF.aspx")
                ElseIf DS.Table.Rows(0).Item(5) = 3 Then
                    Session("First") = 0
                    Session("Mark1") = 0
                    Session("MarkAll") = 0
                    Session("Approval") = 0
                    Session("CoType") = 3
                    SDSView.Insert()
                    Response.Redirect("~/QuastionWF.aspx")
                End If
            End If
        Else
            Response.Redirect("~/LoginWF.aspx")
        End If
    End Sub
End Class