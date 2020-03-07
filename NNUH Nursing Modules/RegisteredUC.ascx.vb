
Public Class RegisteredUC
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtUserNo.Text = Session("UNo")
    End Sub

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        SDSregister.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSregister.Update()
        Server.Transfer("~/LoginWF.aspx", True)
    End Sub
End Class