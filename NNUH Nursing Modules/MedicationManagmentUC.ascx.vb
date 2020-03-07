Imports System.IO

Public Class MedicationManagmentUC
    Inherits System.Web.UI.UserControl
    Dim DS, DS1, DS2 As DataView
#Region "Medications"
    Sub BindilMedications()
        ilMedication.DataSource = DS
        ilMedication.DataBind()
    End Sub
    Protected Sub ilMedication_EditCommand(source As Object, e As DataListCommandEventArgs)
        Session("Add") = 1
        Session("Redirect") = 0
        Session("MNo") = ilMedication.DataKeys.Item(e.Item.ItemIndex)
        Response.Redirect("~/EditMedWF.aspx", True)
    End Sub
    Protected Sub ilMedication_DeleteCommand(source As Object, e As DataListCommandEventArgs)
        Dim CoImg As String =
     (CType(e.Item.FindControl("COImg"), Image)).ImageUrl
        If File.Exists(Server.MapPath(CoImg)) Then
            File.Delete(Server.MapPath(CoImg))
        End If
        SDSMedication.DeleteCommand = "Delete From tblMedication Where Id=@Id"
        SDSMedication.DeleteParameters("Id").DefaultValue = ilMedication.DataKeys.Item(e.Item.ItemIndex).ToString()
        SDSMedication.Delete()
        ilMedication.EditItemIndex = -1
        BindilMedications()
        Session("Redirect") = 0
        Response.Redirect("~/MedicationManagmentWF.aspx")
    End Sub
    Protected Sub ilMedication_SelectedIndexChanged(sender As Object, e As EventArgs)
        Session("MNo") = ilMedication.DataKeys.Item(ilMedication.SelectedItem.ItemIndex)
        Session("Redirect") = 0
        Response.Redirect("~/ViewMedWF.aspx")
    End Sub
    Protected Sub BtnAddMed_Click(sender As Object, e As EventArgs)
        Session("Add") = 0
        Session("Redirect") = 0
        Response.Redirect("~/EditMedWF.aspx", True)
    End Sub
#End Region

#Region "Categories"
    Sub BindilCategory()
        ilCategory.DataSource = DS1
        ilCategory.DataBind()
    End Sub
    Protected Sub ilCategory_EditCommand(source As Object, e As DataListCommandEventArgs)
        Session("Add") = 1
        Session("Redirect") = 1
        Session("CatNo") = ilCategory.DataKeys.Item(e.Item.ItemIndex)
        Response.Redirect("~/EditCatWF.aspx", True)
    End Sub
    Protected Sub ilCategory_DeleteCommand(source As Object, e As DataListCommandEventArgs)
        Dim CoImg As String =
     (CType(e.Item.FindControl("COImg"), Image)).ImageUrl
        If File.Exists(Server.MapPath(CoImg)) Then
            File.Delete(Server.MapPath(CoImg))
        End If
        SDSCat.DeleteCommand = "Delete From MCategory Where Id=@Id"
        SDSCat.DeleteParameters("Id").DefaultValue = ilCategory.DataKeys.Item(e.Item.ItemIndex).ToString()
        SDSCat.Delete()
        ilCategory.EditItemIndex = -1
        BindilCategory()
        Session("Redirect") = 1
        Response.Redirect("~/MedicationManagmentWF.aspx")
    End Sub
    Protected Sub ilCategory_SelectedIndexChanged(sender As Object, e As EventArgs)
        Session("CatNo") = ilCategory.DataKeys.Item(ilCategory.SelectedItem.ItemIndex)
        SDSMedCat.SelectParameters("Id").DefaultValue = ilCategory.DataKeys.Item(ilCategory.SelectedItem.ItemIndex)
        SDSMedCat.SelectCommand = "Select * From tblMedication Where MCatId=@Id"
        DS2 = SDSMedCat.Select(DataSourceSelectArguments.Empty())
        ilCatMed.DataSource = DS2
        ilCatMed.DataBind()
        Session("Redirect") = 1
        MultiView1.ActiveViewIndex = 2
    End Sub
    Protected Sub BtnAddCat_Click(sender As Object, e As EventArgs)
        Session("Add") = 0
        Session("Redirect") = 1
        Response.Redirect("~/EditCatWF.aspx", True)
    End Sub
#End Region

#Region "CatMeds"
    Sub BindilCatMed()
        ilCatMed.DataSource = DS2
        ilCatMed.DataBind()
    End Sub
    Protected Sub ilCatMed_DeleteCommand(source As Object, e As DataListCommandEventArgs)
        Dim CoImg As String =
(CType(e.Item.FindControl("COImg"), Image)).ImageUrl
        If File.Exists(Server.MapPath(CoImg)) Then
            File.Delete(Server.MapPath(CoImg))
        End If
        SDSMedCat.DeleteCommand = "Delete From tblMedication Where Id=@Id"
        SDSMedCat.DeleteParameters("Id").DefaultValue = ilCatMed.DataKeys.Item(e.Item.ItemIndex).ToString()
        SDSMedCat.Delete()
        ilCatMed.EditItemIndex = -1
        BindilCatMed()
        Session("Redirect") = 2
        Response.Redirect("~/MedicationManagmentWF.aspx")
    End Sub
    Protected Sub ilCatMed_EditCommand(source As Object, e As DataListCommandEventArgs)
        Session("Add") = 1
        Session("Redirect") = 2
        Session("MNo") = ilCatMed.DataKeys.Item(e.Item.ItemIndex)
        Response.Redirect("~/EditMedWF.aspx", True)
    End Sub
    Protected Sub ilCatMed_SelectedIndexChanged(sender As Object, e As EventArgs)
        Session("MNo") = ilCatMed.DataKeys.Item(ilCatMed.SelectedItem.ItemIndex)
        Session("Redirect") = 2
        Response.Redirect("~/ViewMedWF.aspx")
    End Sub
    Protected Sub BtnAddCatMed_Click(sender As Object, e As EventArgs)
        Session("Add") = 0
        Session("Redirect") = 2
        Response.Redirect("~/EditMedWF.aspx", True)
    End Sub
#End Region

    Protected Sub btnM_Click(sender As Object, e As EventArgs) Handles btnM.Click
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub btnC_Click(sender As Object, e As EventArgs) Handles btnC.Click
        MultiView1.ActiveViewIndex = 1
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSMedication.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSCat.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSMedCat.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSCat.SelectCommand = "Select * From MCategory Order By Category"
        SDSMedication.SelectCommand = "Select * From tblMedication Order By MName"
        DS = SDSMedication.Select(DataSourceSelectArguments.Empty())
        DS1 = SDSCat.Select(DataSourceSelectArguments.Empty())
        If Not IsPostBack Then
            BindilMedications()
            BindilCategory()
            BindilCatMed()
            MultiView1.ActiveViewIndex = Val(Session("Redirect"))
        End If
    End Sub

End Class