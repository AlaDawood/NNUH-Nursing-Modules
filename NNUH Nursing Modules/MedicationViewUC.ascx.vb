Public Class MedicationViewUC
    Inherits System.Web.UI.UserControl
    Dim DS, DS1, DS2 As DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSMedication.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSCat.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSMedCat.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Session("Selectedi") = lstCat.SelectedIndex
    End Sub

    Protected Sub ViewM(sender As Object, e As EventArgs)
        Dim btn As LinkButton = sender
        Session("MNo") = btn.CommandArgument
        Response.Redirect("~/ViewMedWF.aspx")
    End Sub

    Protected Sub btnSearch1_Click(sender As Object, e As EventArgs) Handles btnSearch1.Click
        Session("Selectedi") = 3
    End Sub

    Protected Sub ViewC(sender As Object, e As EventArgs)
        Dim btn As LinkButton = sender
        Session("Selectedi") = 2
        Session("CatNo") = btn.CommandArgument
    End Sub

    Private Sub MedicationViewUC_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Session("Selectedi") = 0 Then
            SDSCat.SelectCommand = "Select * From MCategory Order By Category"
            DS = SDSCat.Select(DataSourceSelectArguments.Empty())
            ilCategory.DataSource = DS
            ilCategory.DataBind()
            MultiView1.ActiveViewIndex = 0
        ElseIf Session("Selectedi") = 1 Then
            SDSMedication.SelectCommand = "Select * From tblMedication Order By MName"
            DS1 = SDSMedication.Select(DataSourceSelectArguments.Empty())
            ilMedication.DataSource = DS1
            ilMedication.DataBind()
            MultiView1.ActiveViewIndex = 1
        ElseIf Session("Selectedi") = 2 Then
            SDSMedCat.SelectCommand = "Select * From tblMedication Where MCatId=@Id"
            DS2 = SDSMedCat.Select(DataSourceSelectArguments.Empty())
            ilMedCat.DataSource = DS2
            ilMedCat.DataBind()
            MultiView1.ActiveViewIndex = 2
        ElseIf Session("Selectedi") = 3 Then
            If txtSearch.Text <> "" Then
                SDSMedication.SelectCommand = "Select * From tblMedication Where MName Like '%" & txtSearch.Text & "%' Order By MName"
                DS1 = SDSMedication.Select(DataSourceSelectArguments.Empty())
                ilMedication.DataSource = DS1
                ilMedication.DataBind()
                MultiView1.ActiveViewIndex = 1
            End If
        End If
        If Session("Selectedi") < 3 Then
            lstCat.SelectedIndex = Session("Selectedi")
        End If
    End Sub
End Class