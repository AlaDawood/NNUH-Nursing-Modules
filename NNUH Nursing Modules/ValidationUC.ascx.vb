Public Class Validation
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnValidate_Click(sender As Object, e As EventArgs) Handles btnValidate.Click
        Dim x As Integer = 0
        x = txtUserNo.Text
        ValidateSDS.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        ValidateSDS.SelectCommand = "Select UserNo,UserName From Users Where UserNo =" & x
        Dim DS As DataView
        DS = ValidateSDS.Select(DataSourceSelectArguments.Empty())
        If DS.Table.Rows.Count <> 0 Then
            If IsDBNull(DS.Table.Rows(0).Item(1)) Then
                Session("UNo") = txtUserNo.Text
                Server.Transfer("~/RegisterWF.aspx", True)
            Else
                lblMsg.Text = ("This User Number already registered!")
            End If
        Else
            lblMsg.Text = ("This User Number is not included to register")
        End If
    End Sub
End Class