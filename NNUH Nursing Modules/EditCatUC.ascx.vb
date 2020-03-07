Imports System.IO

Public Class EditCatUC
    Inherits System.Web.UI.UserControl
    Dim DS As DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSCat.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSCat.SelectCommand = "Select * From MCategory Where Id=@Id"
    End Sub

    Protected Sub UploadFile(sender As Object, e As EventArgs, path1 As String)
        Dim folderPath As String = Server.MapPath("/CatImg/")
        'Check whether Directory (Folder) exists.
        If Not Directory.Exists(folderPath) Then
            'If Directory (Folder) does not exists Create it.
            Directory.CreateDirectory(folderPath)
        End If
        FUImg.GetType()

        'Save the File to the Directory (Folder).
        FUImg.SaveAs(folderPath & path1)
        'Display the Picture in Image control.
        CImg.ImageUrl = "/CatImg/" & path1
        Session.Add("ImgPath", "/CatImg/" & path1)
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If Session("Add") = 0 Then
            btnSave.CausesValidation = True
            UploadFile(sender, e, DateTime.Now.Ticks.ToString & ".jpg")
            SDSCat.InsertCommand = "Insert INTO MCategory (Category,CatImg) Values (@Category,@CatImg)"
            SDSCat.Insert()
            Server.Transfer("~/MedicationManagmentWF.aspx", True)
        ElseIf Session("Add") = 1 Then
            If FUImg.HasFile = True Then
                If File.Exists(CImg.ImageUrl.ToString()) Then
                    File.Delete(CImg.ImageUrl.ToString())
                End If
                UploadFile(sender, e, DateTime.Now.Ticks.ToString & ".jpg")
                SDSCat.UpdateCommand = "Update MCategory Set Category=@Category,CatImg=@CatImg Where Id=@Id"
                SDSCat.Update()
                Server.Transfer("~/MedicationManagmentWF.aspx", True)
            Else
                SDSCat.UpdateCommand = "Update MCategory Set Category=@Category Where Id=@Id"
                SDSCat.Update()
                Server.Transfer("~/MedicationManagmentWF.aspx", True)
            End If

        End If
    End Sub

    Private Sub EditCatUC_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Session("Add") = 1 Then
            DS = SDSCat.Select(DataSourceSelectArguments.Empty())
            txtCategory.Text = DS.Table.Rows(0).Item(1)
            CImg.ImageUrl = DS.Table.Rows(0).Item(2)
        End If
    End Sub
End Class