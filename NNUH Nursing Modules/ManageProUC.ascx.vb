Imports System.IO
Imports System.Collections.Generic
Public Class ManageProUC
    Inherits System.Web.UI.UserControl
    Dim DS As DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtUserNo.Text = Session("UNo")
        SDSManage.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS = SDSManage.Select(DataSourceSelectArguments.Empty())
    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If fuImage.HasFile = True Then
            UploadFile(sender, e)
        End If
        Session("UserName") = txtUserName.Text
        SDSManage.Update()
        Server.Transfer("~/ManageProWF.aspx")
    End Sub
    Protected Sub UploadFile(sender As Object, e As EventArgs)
        Dim folderPath As String = Server.MapPath("/ProfileImg/")

        If Directory.Exists(Server.MapPath("/ProfileImg/") & Session("UNo") & ".jpg") Then
            Directory.Delete(Server.MapPath("/ProfileImg/") & Session("UNo") & ".jpg")
        End If
        'Save the File to the Directory (Folder).
        fuImage.SaveAs(folderPath & Session("UNo") & ".jpg")
        'Display the Picture in Image control.
        imgPro.ImageUrl = "~/ProfileImg/" & Path.GetFileName(Session("UNo").ToString() & ".jpg")
        Session.Add("UImg", "~/ProfileImg/" & Path.GetFileName(Session("UNo").ToString() & ".jpg"))
        Session("imgUrl") = "~/ProfileImg/" & Path.GetFileName(Session("UNo").ToString() & ".jpg")
    End Sub

    Private Sub ManageProUC_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If DS.Table.Rows.Count <> 0 Then
            If Not IsDBNull(DS.Table.Rows(0).Item(1)) Then
                txtUserName.Text = DS.Table.Rows(0).Item(0)
                txtEmail.Text = DS.Table.Rows(0).Item(1)
                txtPhone.Text = DS.Table.Rows(0).Item(2)
                txtGender.SelectedValue = DS.Table.Rows(0).Item(4)
                If Not IsDBNull(DS.Table.Rows(0).Item(5)) Then
                    imgPro.ImageUrl = DS.Table.Rows(0).Item(5)
                End If
            End If
        End If
    End Sub
End Class