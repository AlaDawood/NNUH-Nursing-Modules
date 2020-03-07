Imports System.IO

Public Class CoursesUC
    Inherits System.Web.UI.UserControl
    Dim DS, DS1, DS2, DS3 As DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSCourses.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSSlideCourses.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSVidCourses.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        If Not Page.IsPostBack Then
            DropDownList1.SelectedIndex = 0
            btnSearch_Click(sender, e)
            DS = SDSCourses.Select(DataSourceSelectArguments.Empty())
            DS1 = SDSVidCourses.Select(DataSourceSelectArguments.Empty())
            DS2 = SDSSlideCourses.Select(DataSourceSelectArguments.Empty())
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If DropDownList1.SelectedIndex = 0 Then
            SDSCourses.SelectCommand = "Select Id,CoTitle,CoPara,CoImg,CreditHr,CoType From ArtCourses"
            SDSVidCourses.SelectCommand = "Select Id,CoTitle,CoVid,CoImg,CreditHr,CoType From VidCourses"
            SDSSlideCourses.SelectCommand = "Select Id,CoTitle,CoImg,CreditHr,CoType From SliCourses"
        ElseIf DropDownList1.SelectedIndex = 1 Then
            SDSCourses.SelectCommand = "Select ArtCourses.Id,ArtCourses.CoTitle,ArtCourses.CoPara,ArtCourses.CoImg,ArtCourses.CreditHr,ArtCourses.CoType From ArtCourses INNER JOIN UserCourses ON ArtCourses.Id = UserCourses.CoId And UserCourses.CoType=0 And UserCourses.UserNo=@UserNo And UserCourses.LastQ <> 20"
            SDSVidCourses.SelectCommand = "Select VidCourses.Id,VidCourses.CoTitle,VidCourses.CoVid,VidCourses.CoImg,VidCourses.CreditHr,VidCourses.CoType From VidCourses INNER JOIN UserCourses ON VidCourses.Id = UserCourses.CoId And UserCourses.CoType=1 And UserCourses.UserNo=@UserNo And UserCourses.LastQ <> 20"
            SDSSlideCourses.SelectCommand = "Select SliCourses.Id,SliCourses.CoTitle,SliCourses.CoImg,SliCourses.CreditHr,SliCourses.CoType From SliCourses INNER JOIN UserCourses ON SliCourses.Id = UserCourses.CoId And UserCourses.CoType=2 And UserCourses.UserNo=@UserNo And UserCourses.LastQ <> 20"
        ElseIf DropDownList1.SelectedIndex = 2 Then
            SDSCourses.SelectCommand = "Select ArtCourses.Id,ArtCourses.CoTitle,ArtCourses.CoPara,ArtCourses.CoImg,ArtCourses.CreditHr,ArtCourses.CoType From ArtCourses INNER JOIN UserCourses ON ArtCourses.Id = UserCourses.CoId And UserCourses.CoType=0 And UserCourses.UserNo=@UserNo And UserCourses.LastQ = 20"
            SDSVidCourses.SelectCommand = "Select VidCourses.Id,VidCourses.CoTitle,VidCourses.CoVid,VidCourses.CoImg,VidCourses.CreditHr,VidCourses.CoType From VidCourses INNER JOIN UserCourses ON VidCourses.Id = UserCourses.CoId And UserCourses.CoType=1 And UserCourses.UserNo=@UserNo And UserCourses.LastQ = 20"
            SDSSlideCourses.SelectCommand = "Select SliCourses.Id,SliCourses.CoTitle,SliCourses.CoImg,SliCourses.CreditHr,SliCourses.CoType From SliCourses INNER JOIN UserCourses ON SliCourses.Id = UserCourses.CoId And UserCourses.CoType=2 And UserCourses.UserNo=@UserNo And UserCourses.LastQ = 20"
        ElseIf DropDownList1.SelectedIndex = 3 Then
            SDSCourses.SelectCommand = "Select ArtCourses.Id,ArtCourses.CoTitle,ArtCourses.CoPara,ArtCourses.CoImg,ArtCourses.CreditHr,ArtCourses.CoType From ArtCourses Where ArtCourses.Id Not IN (Select UserCourses.CoId From UserCourses Where ArtCourses.Id = UserCourses.CoId And UserCourses.UserNo = @UserNo)"
            SDSVidCourses.SelectCommand = "Select VidCourses.Id,VidCourses.CoTitle,VidCourses.CoVid,VidCourses.CoImg,VidCourses.CreditHr,VidCourses.CoType From VidCourses Where VidCourses.Id Not IN (Select UserCourses.CoId From UserCourses Where VidCourses.Id = UserCourses.CoId And UserCourses.UserNo = @UserNo)"
            SDSSlideCourses.SelectCommand = "Select SliCourses.Id,SliCourses.CoTitle,SliCourses.CoImg,SliCourses.CreditHr,SliCourses.CoType From SliCourses Where SliCourses.Id Not IN (Select UserCourses.CoId From UserCourses Where SliCourses.Id = UserCourses.CoId And UserCourses.UserNo = @UserNo)"
        End If
        DS = SDSCourses.Select(DataSourceSelectArguments.Empty())
        DS1 = SDSVidCourses.Select(DataSourceSelectArguments.Empty())
        DS2 = SDSSlideCourses.Select(DataSourceSelectArguments.Empty())
    End Sub

    Protected Sub ViewButton_Click(sender As Object, e As EventArgs)
        Dim btn As LinkButton = sender
        Session("CNo") = btn.CommandArgument
        Session("Type") = 0
        Dim div As Control = Page.Master.FindControl("div1")
        If div.Visible = True Then
            Server.Transfer("~/CourseViewWF.aspx", True)
        Else
            Server.Transfer("~/LoginWF.aspx", True)
        End If
    End Sub

    Protected Sub ThumbImg1_Click(sender As Object, e As EventArgs)
        Dim btn As LinkButton = sender
        Session("CNo") = btn.CommandArgument
        Session("Type") = 1
        Dim div As Control = Page.Master.FindControl("div1")
        If div.Visible = True Then
            Server.Transfer("~/VidCourseViewWF.aspx", True)
        Else
            Server.Transfer("~/LoginWF.aspx", True)
        End If
    End Sub
    Protected Sub ThumbImg2_Click(sender As Object, e As EventArgs)
        Dim btn As LinkButton = sender
        Session("CNo") = btn.CommandArgument
        Session("Type") = 2
        Dim div As Control = Page.Master.FindControl("div1")
        If div.Visible = True Then
            Server.Transfer("~/SlideCourseViewWF.aspx", True)
        Else
            Server.Transfer("~/LoginWF.aspx", True)
        End If
    End Sub
End Class