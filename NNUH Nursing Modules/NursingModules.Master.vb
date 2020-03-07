Public Class NursingModules
    Inherits System.Web.UI.MasterPage
    Dim DS1 As DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSRank.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS1 = SDSRank.Select(DataSourceSelectArguments.Empty())
        If Session("Logout") = 1 Then
            Session.RemoveAll()
            Login.Visible = True
            Register.Visible = True
            Logout.Visible = False
            div1.Visible = False
            ToolBar.Visible = False
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Cache.SetValidUntilExpires(False)
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches)
            Response.Cache.SetNoStore()
        End If
        Label1.Text = "Copyright Ala Dawood " & Now.Year.ToString
        If Session("UserName") <> Nothing Then
            lblUser.Text = "Welcome " & Session("UserName")
            Login.Visible = False
            Register.Visible = False
            Logout.Visible = True
            div1.Visible = True
        Else
            div1.Visible = False
        End If
        If Session("imgUrl") <> Nothing Then
            ProImg.ImageUrl = Strings.Right(Session("imgUrl").ToString, Session("imgUrl").ToString.Length - 2)
        End If
        If Session("Uprivi") <> Nothing Then
            If Session("Uprivi") = 1 Then
                ToolBar.Visible = True
            Else
                ToolBar.Visible = False
            End If
        Else
            ToolBar.Visible = False
        End If
    End Sub

    Protected Sub Logout_Click(sender As Object, e As EventArgs) Handles Logout.Click
        FormsAuthentication.SignOut()
        Session("Logout") = 1
        Server.Transfer("~/Default.aspx", False)
    End Sub
End Class