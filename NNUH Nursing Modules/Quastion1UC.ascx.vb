
Imports System.Web.Mail
Public Class QuastionUC
    Inherits System.Web.UI.UserControl
    Dim DS, DS1 As DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSUser.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        lblTitle.Text = Session("Title")
        SDSUser.SelectCommand = "Select * From UserCourses Where UserNo = @UserNo And CoType = @CoType And CoId = @CoId"
        DS1 = SDSUser.Select(DataSourceSelectArguments.Empty())
        'If Not (Me.IsPostBack) Then


        'End If
    End Sub
    Protected Sub btnNext_Click(sender As Object, e As EventArgs) Handles btnNext.Click


        If Session("RA") = lstOption.SelectedItem.Text Then
            Session("Mark1") = lblM.Text
        Else
            Session("Mark1") = 0
        End If
        Session("MarkAll") = lblM.Text
        SDSUser.Update()

        If Session("First") >= 20 Then

            'Response.Redirect("~/QuastionWF.aspx")
            Response.Redirect("~/CertificateWF.aspx")
        End If

        lstOption.ClearSelection()
        'Response.Redirect("~/MarkWF.aspx")
        'Response.Redirect("~/QuastionWF.aspx")

    End Sub

    Private Sub QuastionUC_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        DS1 = SDSUser.Select(DataSourceSelectArguments.Empty())
        If Session("Type") = 0 Then
            SDSQuastion.SelectCommand = "Select Top 1 * From CoQu Where CoId=@Id Order By NEWID()"
            SDSQuastion.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            DS = SDSQuastion.Select(DataSourceSelectArguments.Empty())
        ElseIf Session("Type") = 1 Then
            SDSQuastion.SelectCommand = "Select Top 1 * From CoQu1 Where CoId=@Id Order By NEWID()"
            SDSQuastion.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            DS = SDSQuastion.Select(DataSourceSelectArguments.Empty())
        ElseIf Session("Type") = 2 Then
            SDSQuastion.SelectCommand = "Select Top 1 * From CoQu2 Where CoId=@Id Order By NEWID()"
            SDSQuastion.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            DS = SDSQuastion.Select(DataSourceSelectArguments.Empty())
        End If
        Session("First") = DS1.Table.Rows(0).Item(6)
        Session("Mark1") = DS1.Table.Rows(0).Item(4)
        Session("MarkAll") = DS1.Table.Rows(0).Item(5)
        lblDate.Text = Now.Date
        lblQ.Text = DS.Table.Rows(0).Item(2).ToString
        lstOption.Items(0).Text = DS.Table.Rows(0).Item(3).ToString
        lstOption.Items(1).Text = DS.Table.Rows(0).Item(4).ToString
        lstOption.Items(2).Text = DS.Table.Rows(0).Item(5).ToString
        lstOption.Items(3).Text = DS.Table.Rows(0).Item(6).ToString
        Session("RA") = DS.Table.Rows(0).Item(7).ToString()
        lblQN.Text = Session("First") + 1 & " of 20"
        lblM.Text = DS.Table.Rows(0).Item(8)
        lblMark.Text = Session("Mark1") & " of " & Session("MarkAll")
        Session("First") += 1
        QProgress.Value = Val(Session("First"))
        MProgress.Maximum = Val(Session("MarkAll"))
        MProgress.Value = Val(Session("Mark1"))
    End Sub

End Class