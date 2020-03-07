Public Class VidCourseViewUC
    Inherits System.Web.UI.UserControl
    Dim DS, DS1, DS2 As DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSView.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS2 = SDSView.Select(DataSourceSelectArguments.Empty())
        lblTitle.Text = DS2.Table.Rows(0).Item(1)
        VideoFam.Src = "VidCourses/" & DS2.Table.Rows(0).Item(3).ToString
        Content1.InnerText = DS2.Table.Rows(0).Item(4)
        lblCredit.Text = DS2.Table.Rows(0).Item(5)

        SDSView2.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS = SDSView2.Select(DataSourceSelectArguments.Empty())
        lblTitle.Text = DS.Table.Rows(0).Item(1)
        Session("Title") = DS.Table.Rows(0).Item(1)
        lblDate.Text = Now.Date
    End Sub

    Protected Sub btnTest_Click(sender As Object, e As EventArgs) Handles btnTest.Click
        If Session("UNo") <> Nothing Then
            SDSView2.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            SDSView2.SelectCommand = "Select * From UserCourses Where UserNo = @UserNo And CoType = @CoType And CoId = @CoId"
            DS1 = SDSView2.Select(DataSourceSelectArguments.Empty())
            If DS1.Table.Rows.Count <> 0 Then
                SDSView2.SelectCommand = "Select Id,CoTitle,CoPara,CoImg,CoType From VidCourses Where Id=@Id"
                DS = SDSView2.Select(DataSourceSelectArguments.Empty())
                If DS.Table.Rows(0).Item(4) = 0 Then
                    Session("First") = 20
                    Session("Mark1") = 0
                    Session("MarkAll") = 0
                    Session("CoType") = 0
                    Session("Approval") = DS1.Table.Rows(0).Item(9)
                    Response.Redirect("~/CertificateWF.aspx")
                ElseIf DS.Table.Rows(0).Item(4) = 1 Then
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
                ElseIf DS.Table.Rows(0).Item(4) = 2 Then
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
                ElseIf DS.Table.Rows(0).Item(4) = 3 Then
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
                If DS.Table.Rows(0).Item(4) = 0 Then
                    Session("First") = 20
                    Session("Mark1") = 0
                    Session("MarkAll") = 0
                    Session("Approval") = 1
                    Session("CoType") = 0
                    SDSView2.Insert()
                    Response.Redirect("~/CertificateWF.aspx")
                ElseIf DS.Table.Rows(0).Item(4) = 1 Then
                    Session("First") = 20
                    Session("Mark1") = 0
                    Session("MarkAll") = 0
                    Session("Approval") = 0
                    Session("CoType") = 1
                    SDSView2.Insert()
                    Response.Redirect("~/CertificateWF.aspx")
                ElseIf DS.Table.Rows(0).Item(4) = 2 Then
                    Session("First") = 0
                    Session("Mark1") = 0
                    Session("MarkAll") = 0
                    Session("Approval") = 1
                    Session("CoType") = 2
                    SDSView2.Insert()
                    Response.Redirect("~/QuastionWF.aspx")
                ElseIf DS.Table.Rows(0).Item(4) = 3 Then
                    Session("First") = 0
                    Session("Mark1") = 0
                    Session("MarkAll") = 0
                    Session("Approval") = 0
                    Session("CoType") = 3
                    SDSView2.Insert()
                    Response.Redirect("~/QuastionWF.aspx")
                End If
            End If
        Else
            Response.Redirect("~/LoginWF.aspx")
        End If
    End Sub
End Class