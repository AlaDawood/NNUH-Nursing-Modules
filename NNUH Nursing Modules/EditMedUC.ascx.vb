Imports System.IO

Public Class EditMedUC
    Inherits System.Web.UI.UserControl
    Dim DS, DS1 As DataView
    Protected Sub UploadFile(sender As Object, e As EventArgs, path1 As String)
        Dim folderPath As String = Server.MapPath("/MedImg/")
        'Check whether Directory (Folder) exists.
        If Not Directory.Exists(folderPath) Then
            'If Directory (Folder) does not exists Create it.
            Directory.CreateDirectory(folderPath)
        End If
        FUimg.GetType()

        'Save the File to the Directory (Folder).
        FUimg.SaveAs(folderPath & path1)
        'Display the Picture in Image control.
        ImgM.ImageUrl = "/MedImg/" & path1
        Session.Add("ImgPath", "/MedImg/" & path1)
    End Sub
    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        If Session("Add") = 0 Then
            If FUimg.HasFile = True Then
                If txtName.Text <> "" Then
                    UploadFile(sender, e, DateTime.Now.Ticks.ToString & ".jpg")
                    SDSMedication.InsertCommand = "Insert INTO tblMedication (MName,MCatId,Preparation,Indecation,SideEffect,Reconsitution,Dilution,Administration,Notes,MImg) Values (@MName,@CatId,'" & txtPreparation.InnerText & "','" & txtIndecation.InnerText & "','" & txtSideEffect.InnerText & "','" & txtReconsitution.InnerText & "','" & txtDilution.InnerText & "','" & txtAdministration.InnerText & "','" & txtNotes.InnerText & "',@MImg)"
                    SDSMedication.Insert()
                    Server.Transfer("~/MedicationManagmentWF.aspx", True)
                Else
                    RequiredFieldValidator1.Validate()
                End If
            End If
        ElseIf Session("Add") = 1 Then
            If FUimg.HasFile = True Then

                If File.Exists(ImgM.ImageUrl.ToString()) Then
                    File.Delete(ImgM.ImageUrl.ToString())
                End If
                UploadFile(sender, e, DateTime.Now.Ticks.ToString & ".jpg")
                SDSMedication.UpdateCommand = "Update tblMedication Set MName=@MName,MCatId=@MCatId,Preparation='" & txtPreparation.InnerText & "',Indecation='" & txtIndecation.InnerText & "',SideEffect='" & txtSideEffect.InnerText & "',Reconsitution='" & txtReconsitution.InnerText & "',Dilution='" & txtDilution.InnerText & "',Administration='" & txtAdministration.InnerText & "',Notes='" & txtNotes.InnerText & "',MImg=@MImg Where Id=@Id"
                SDSMedication.Update()
                Server.Transfer("~/MedicationManagmentWF.aspx", True)
            Else
                SDSMedication.UpdateCommand = "Update tblMedication Set MName=@MName,MCatId=@MCatId,Preparation='" & txtPreparation.InnerText & "',Indecation='" & txtIndecation.InnerText & "',SideEffect='" & txtSideEffect.InnerText & "',Reconsitution='" & txtReconsitution.InnerText & "',Dilution='" & txtDilution.InnerText & "',Administration='" & txtAdministration.InnerText & "',Notes='" & txtNotes.InnerText & "' Where Id=@Id"
                SDSMedication.Update()
                Server.Transfer("~/MedicationManagmentWF.aspx", True)
            End If

        End If
    End Sub

    Private Sub EditMedUC_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        SDSCat.SelectCommand = "Select Id,Category From MCategory Order By Category"
        DS1 = SDSCat.Select(DataSourceSelectArguments.Empty())
        ddlCat.DataSource = DS1
        ddlCat.DataTextField = "Category"
        ddlCat.DataValueField = "Id"
        ddlCat.DataBind()
        SDSMedication.SelectCommand = "Select * From tblMedication Where Id=@Id"

        If Session("Add") = 1 Then
            DS = SDSMedication.Select(DataSourceSelectArguments.Empty())
            txtName.Text = DS.Table.Rows(0).Item(1).ToString()
            If Not IsDBNull(DS.Table.Rows(0).Item(2)) Then
                ddlCat.SelectedValue = DS.Table.Rows(0).Item(2)
            End If
            txtPreparation.InnerText = DS.Table.Rows(0).Item(3).ToString()
            txtIndecation.InnerText = DS.Table.Rows(0).Item(4).ToString()
            txtSideEffect.InnerText = DS.Table.Rows(0).Item(5).ToString()
            txtReconsitution.InnerText = DS.Table.Rows(0).Item(6).ToString()
            txtDilution.InnerText = DS.Table.Rows(0).Item(7).ToString()
            txtAdministration.InnerText = DS.Table.Rows(0).Item(8).ToString()
            txtNotes.InnerText = DS.Table.Rows(0).Item(9).ToString()
            If Not IsDBNull(DS.Table.Rows(0).Item(10)) Then
                ImgM.ImageUrl = DS.Table.Rows(0).Item(10).ToString()
            End If
        End If
    End Sub

    Private Sub EditMedUC_Load(sender As Object, e As EventArgs) Handles Me.Load
        SDSMedication.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        SDSCat.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    End Sub
End Class