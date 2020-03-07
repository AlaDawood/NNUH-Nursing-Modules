Public Class ViewMedUC
    Inherits System.Web.UI.UserControl
    Dim DS As DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSMed.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS = SDSMed.Select(DataSourceSelectArguments.Empty())
        formMed.DataBind()
    End Sub
End Class