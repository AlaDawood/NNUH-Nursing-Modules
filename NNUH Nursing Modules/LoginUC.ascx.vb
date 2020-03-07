Imports System.Security.Policy
Imports Microsoft.Office.Interop.Word
Imports System.Web.UI
Imports System.Web.UI.WebControls
Public Class LoginUC
    Inherits System.Web.UI.UserControl

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim lblUser As Label = Page.Master.FindControl("lblUser")
        Dim ProImg As Image = Page.Master.FindControl("ProImg")
        Dim div As Control = Page.Master.FindControl("div1")
        SDSLogin.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Dim DS As DataView
        DS = SDSLogin.Select(DataSourceSelectArguments.Empty())
        If txtUserNo.Text = "123456" And txtPass.Text = "10716602" Then
            Server.Transfer("~/UserManagmentWF.aspx", True)
        End If
        If DS.Table.Rows.Count <> 0 Then
            If IsDBNull(DS.Table.Rows(0).Item(1)) Then
                Server.Transfer("~/RegisterWF.aspx", True)
                div.Visible = False
            Else
                Session("UNo") = txtUserNo.Text
                Session("UserName") = DS.Table.Rows(0).Item(1).ToString()
                If Not IsDBNull(DS.Table.Rows(0).Item(3)) Then
                    Session("imgUrl") = DS.Table.Rows(0).Item(3).ToString()
                Else
                    Session("imgUrl") = "~/images/Login.png"
                End If
                Session("Uprivi") = DS.Table.Rows(0).Item(4).ToString()
                Session("Email") = DS.Table.Rows(0).Item(5).ToString()
                lblUser.Text = Session("UserName").ToString
                ProImg.ImageUrl = Strings.Right(Session("imgUrl").ToString, Session("imgUrl").ToString.Length - 2)
                div.Visible = True
                Server.Transfer("~/Default.aspx", True)
            End If
        Else
            lblMsg.Text = ("This User Number is not included to Login")
        End If
        Session.Remove("UNO")
        Session.Add("UNo", txtUserNo.Text)

    End Sub
End Class