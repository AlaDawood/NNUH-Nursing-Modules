Public Class ChangePassUC
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        SDSChange.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Dim DS As DataView
        DS = SDSChange.Select(DataSourceSelectArguments.Empty())
        If DS.Table.Rows.Count <> 0 Then
            SDSChange.Update()
        End If
    End Sub
End Class