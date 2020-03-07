Imports System.Net.Mail
Imports System.Net
Imports System.Globalization
Public Class UserDetailsUC
    Inherits System.Web.UI.UserControl
    Dim DS, DS1, DS2 As New DataView

    Protected Sub btnDelAll_Click(sender As Object, e As EventArgs) Handles btnDelAll.Click
        SDSCourses.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSCourses.DeleteCommand = "Delete from UserCourses Where UserNo = @UserNo"
        SDSCourses.Delete()
        GVCourses.DataBind()
        Response.Redirect("~\UserDetailWF.aspx")
    End Sub

    Protected Sub btnApproved_Click(sender As Object, e As EventArgs) Handles btnApproved.Click
        SDSCourses.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSCourses.SelectCommand = "Select UserCourses.Id, Case UserCourses.CoType When 0 then (Select ArtCourses.CoTitle From ArtCourses Where UserCourses.CoId=ArtCourses.Id) When 1 then (Select VidCourses.CoTitle From VidCourses Where UserCourses.CoId=VidCourses.Id) When 2 then (Select SliCourses.CoTitle From SliCourses Where UserCourses.CoId=SliCourses.Id) End As 'Title',Mark,MarkAll,CreditHr,Dat, Case UserCourses.CoApproval When 0 then 'Need Approval' When 1 then 'Approved' END AS 'CoApproval' From UserCourses Where UserNo=@UserNo AND CoApproval=1"
        DS1 = SDSCourses.Select(DataSourceSelectArguments.Empty())
        GVCourses.DataSource = DS1
        GVCourses.DataBind()
        'Response.Redirect("~\UserDetailWF.aspx")
    End Sub

    Protected Sub btnUnApproved_Click(sender As Object, e As EventArgs) Handles btnUnApproved.Click
        SDSCourses.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSCourses.SelectCommand = "Select UserCourses.Id, Case UserCourses.CoType When 0 then (Select ArtCourses.CoTitle From ArtCourses Where UserCourses.CoId=ArtCourses.Id) When 1 then (Select VidCourses.CoTitle From VidCourses Where UserCourses.CoId=VidCourses.Id) When 2 then (Select SliCourses.CoTitle From SliCourses Where UserCourses.CoId=SliCourses.Id) End As 'Title',Mark,MarkAll,CreditHr,Dat, Case UserCourses.CoApproval When 0 then 'Need Approval' When 1 then 'Approved' END AS 'CoApproval' From UserCourses Where UserNo=@UserNo AND CoApproval=0"
        DS1 = SDSCourses.Select(DataSourceSelectArguments.Empty())
        GVCourses.DataSource = DS1
        GVCourses.DataBind()
        'Response.Redirect("~\UserDetailWF.aspx")
    End Sub

    Protected Sub btnAll_Click(sender As Object, e As EventArgs) Handles btnAll.Click
        SDSCourses.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSCourses.SelectCommand = "Select UserCourses.Id, Case UserCourses.CoType When 0 then (Select ArtCourses.CoTitle From ArtCourses Where UserCourses.CoId=ArtCourses.Id) When 1 then (Select VidCourses.CoTitle From VidCourses Where UserCourses.CoId=VidCourses.Id) When 2 then (Select SliCourses.CoTitle From SliCourses Where UserCourses.CoId=SliCourses.Id) End As 'Title',Mark,MarkAll,CreditHr,Dat, Case UserCourses.CoApproval When 0 then 'Need Approval' When 1 then 'Approved' END AS 'CoApproval' From UserCourses Where UserNo=@UserNo"
        DS1 = SDSCourses.Select(DataSourceSelectArguments.Empty())
        GVCourses.DataSource = DS1
        GVCourses.DataBind()
        'Response.Redirect("~\UserDetailWF.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Private Sub GVCourses_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GVCourses.RowCommand
        SDSCourses.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        If e.CommandName = "Approval_click" Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Session("Approv") = Convert.ToInt32(GVCourses.DataKeys(index).Value)
            Dim lbtn As LinkButton = TryCast(GVCourses.Rows(index).Cells(5).Controls(0), LinkButton)
            Dim sName As String = lbtn.Text
            If sName = "Approved" Then
                SDSCourses.UpdateCommand = "Update UserCourses SET CoApproval = 0 Where Id = @Id"
                SDSCourses.Update()
                GVCourses.DataBind()
                Response.Redirect("~\UserDetailWF.aspx")
            Else
                SDSCourses.UpdateCommand = "Update UserCourses SET CoApproval = 1 Where Id = @Id"
                SDSCourses.Update()
                GVCourses.DataBind()
                Response.Redirect("~\UserDetailWF.aspx")
            End If
        ElseIf e.CommandName = "Delete_Click" Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Session("Del12") = Convert.ToInt32(GVCourses.DataKeys(index).Value)
            SDSCourses.Delete()
            GVCourses.DataBind()
            Response.Redirect("~\UserDetailWF.aspx")
        End If

    End Sub

    Private Sub UserDetailsUC_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        lblNo.Text = Session("UsrNo")
        SDSUsers.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS = SDSUsers.Select(DataSourceSelectArguments.Empty())
        lblEmail.Text = DS.Table.Rows(0).Item(3)
        lblName.Text = DS.Table.Rows(0).Item(2)
        SDSCourses.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS1 = SDSCourses.Select(DataSourceSelectArguments.Empty())
        GVCourses.DataSource = DS1
        GVCourses.DataBind()
        SDSRank.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS2 = SDSRank.Select(DataSourceSelectArguments.Empty())
        lblCN.Text = DS2.Table.Rows(0).Item(1)
        lblScore.Text = DS2.Table.Rows(0).Item(2) & " / " & DS2.Table.Rows(0).Item(3)
        If IsDBNull(DS2.Table.Rows(0).Item(4)) Then
            lblCredit.Text = 0
        Else
            lblCredit.Text = DS2.Table.Rows(0).Item(4)
        End If
    End Sub
End Class