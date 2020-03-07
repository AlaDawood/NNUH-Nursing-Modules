Imports System.IO
Imports DevExpress.Web.ASPxRichEdit
Public Class CourseManagmentUC
    Inherits System.Web.UI.UserControl
    Dim DS, DS1, DS2, DS3 As DataView
    Dim randomName As String
    Dim extention As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSCourses.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS = SDSCourses.Select(DataSourceSelectArguments.Empty())

        SDSVideo.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS1 = SDSVideo.Select(DataSourceSelectArguments.Empty())

        SDSSlide.SelectCommand = "Select * from SliCourses"
        SDSSlide.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS2 = SDSSlide.Select(DataSourceSelectArguments.Empty())

        If Not IsPostBack Then
            BindilArCourses()
            BindilVidCourses()
            BindilSliCourses()
            MultiView1.ActiveViewIndex = Val(Session("Redirect"))
        End If
    End Sub

#Region "Article Courses Functions"
    Sub BindilArCourses()
        ilArCourses.DataSource = DS
        ilArCourses.DataBind()
    End Sub
    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        randomName = DateTime.Now.Ticks.ToString

        If FUArticl.HasFile Then
            extention = System.IO.Path.GetExtension(FUArticl.FileName)
            If extention = ".doc" Or extention = ".docx" Or extention = ".rtf" Then
                FUArticl.SaveAs(Server.MapPath("/CoursePage/") & randomName & extention)
                Editor1.Open(Server.MapPath("/CoursePage/") & randomName & extention)
                Editor1.SaveCopy(Server.MapPath("/CoursePage/") & randomName + ".html")
                Session("ArtPath") = randomName + ".html"

                extention = System.IO.Path.GetExtension(FUImag.FileName)
                Dim ImgPath As String = DateTime.Now.Ticks.ToString + extention
                FUImag.SaveAs(Server.MapPath("/ArtImg/") & ImgPath)
                Session("ImgPath") = "/ArtImg/" & ImgPath

                SDSCourses.Insert()
                File.Delete(Server.MapPath("/CoursePage/") & randomName & extention)
            Else
                MsgBox("This file not as word document!!")
            End If
        End If
        txtTitle.Text = ""
        Session.Remove("ImgPath")
        Session.Remove("ArtPath")
        FUImag.Attributes.Remove("Filename")
        Editor1.[New]()
        FUArticl.Attributes.Remove("Filename")
        txtCredit.Text = ""
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub ItemsList_EditCommand(source As Object, e As DataListCommandEventArgs)
        'Dim CoPara As String = (CType(e.Item.FindControl("txtArt"), TextBox)).Text
        'CType(e.Item.FindControl("EditorDoc"), ASPxRichEdit).Open(Server.MapPath("~/CoursePage/" & CoPara))
        ilArCourses.EditItemIndex = e.Item.ItemIndex
        BindilArCourses()
    End Sub
    Protected Sub ItemsList_CancelCommand(source As Object, e As DataListCommandEventArgs)
        ilArCourses.EditItemIndex = -1
        BindilArCourses()
    End Sub
    Protected Sub ItemsList_DeleteCommand(source As Object, e As DataListCommandEventArgs)
        Dim CoImg As String =
             (CType(e.Item.FindControl("COImg"), Image)).ImageUrl
        Dim CoPara As String =
             (CType(e.Item.FindControl("txtArt"), TextBox)).Text
        If File.Exists(Server.MapPath(CoImg)) Then
            File.Delete(Server.MapPath(CoImg))
        End If
        If File.Exists(Server.MapPath("CoursePage/") & CoPara) Then
            File.Delete(Server.MapPath("CoursePage/") & CoPara)
        End If
        SDSCourses.DeleteParameters("Id").DefaultValue = ilArCourses.DataKeys(e.Item.ItemIndex).ToString()
        SDSCourses.Delete()
        ilArCourses.EditItemIndex = -1
        BindilArCourses()
        Session("Redirect") = 0
        Response.Redirect("~/CoursesManagmentWF.aspx")
    End Sub
    Protected Sub ilArCourses_UpdateCommand(source As Object, e As DataListCommandEventArgs)
        If e.CommandName = "Update" Then

            Dim txtID As String = (CType(e.Item.FindControl("txtID"), TextBox)).Text
            Dim Title As String = (CType(e.Item.FindControl("txtTitl"), TextBox)).Text
            Dim CreditHr As Integer = Int(Val((CType(e.Item.FindControl("txtCredit"), TextBox)).Text))
            Dim txtType As Integer = (CType(e.Item.FindControl("TextBox1"), DropDownList)).SelectedValue
            Dim FileUImage As String = (CType(e.Item.FindControl("FUImage"), FileUpload)).PostedFile.FileName
            Dim CoImg As String = (CType(e.Item.FindControl("COImg"), Image)).ImageUrl
            Session("ImgPath") = CoImg
            Dim FileUArticle As String = (CType(e.Item.FindControl("FUArticle"), FileUpload)).PostedFile.FileName
            Dim CoPara As String = (CType(e.Item.FindControl("txtArt"), TextBox)).Text
            Session("ArtPath") = CoPara
            Dim EditorDoc As ASPxRichEdit = CType(e.Item.FindControl("EditorDoc"), ASPxRichEdit)
            Dim FUploadArticle As FileUpload = (CType(e.Item.FindControl("FUArticle"), FileUpload))
            Dim FUploadImage As FileUpload = (CType(e.Item.FindControl("FUImage"), FileUpload))
            extention = System.IO.Path.GetExtension(FileUImage)
            If (FUploadArticle.HasFile) Then
                If (FUploadImage.HasFile) Then
                    If File.Exists(Server.MapPath(CoImg)) Then
                        File.Delete(Server.MapPath(CoImg))
                    End If
                    If File.Exists(Server.MapPath("/CoursePage/" & CoPara)) Then
                        File.Delete(Server.MapPath("/CoursePage/" & CoPara))
                    End If
                    randomName = DateTime.Now.Ticks.ToString
                    FUploadArticle.SaveAs(Server.MapPath("/CoursePage/") & randomName & Path.GetExtension(FileUArticle))
                    EditorDoc.Open(Server.MapPath("/CoursePage/") & randomName & Path.GetExtension(FileUArticle))
                    EditorDoc.SaveCopy(Server.MapPath("/CoursePage/") & randomName + ".html")
                    Session("ArtPath") = randomName + ".html"
                    Dim ImgPath As String = DateTime.Now.Ticks.ToString + extention
                    FUploadImage.SaveAs(Server.MapPath("/ArtImg/") & ImgPath)
                    Session("ImgPath") = "/ArtImg/" & ImgPath
                    File.Delete(Server.MapPath("/CoursePage/") & randomName & Path.GetExtension(FileUArticle))
                Else
                    If File.Exists(Server.MapPath("CoursePage/" & CoPara)) Then
                        File.Delete(Server.MapPath("CoursePage/" & CoPara))
                    End If
                    randomName = DateTime.Now.Ticks.ToString
                    FUploadArticle.SaveAs(Server.MapPath("/CoursePage/") + randomName + Path.GetExtension(FileUArticle))
                    EditorDoc.Open(Server.MapPath("/CoursePage/") + randomName + Path.GetExtension(FileUArticle))
                    EditorDoc.SaveCopy(Server.MapPath("/CoursePage/") + randomName + ".html")
                    Session("ArtPath") = randomName + ".html"
                    File.Delete(Server.MapPath("/CoursePage/") + randomName + Path.GetExtension(FileUArticle))
                End If
            Else
                If (FUploadImage.HasFile) Then
                    If File.Exists(CoImg) Then
                        File.Delete(CoImg)
                    End If
                    Dim ImgPath As String = DateTime.Now.Ticks.ToString + extention
                    FUploadImage.SaveAs(Server.MapPath("/ArtImg/") & ImgPath)
                    Session("ImgPath") = "/ArtImg/" & ImgPath
                End If
            End If
            SDSCourses.UpdateParameters("Id").DefaultValue = ilArCourses.DataKeys(e.Item.ItemIndex).ToString()
            SDSCourses.UpdateParameters("CoTitle").DefaultValue = Title
            SDSCourses.UpdateParameters("CoPara").DefaultValue = Session("ArtPath")
            SDSCourses.UpdateParameters("CoImg").DefaultValue = Session("ImgPath")
            SDSCourses.UpdateParameters("CreditHr").DefaultValue = CreditHr
            SDSCourses.UpdateParameters("CoType").DefaultValue = txtType
            SDSCourses.Update()
            ilArCourses.EditItemIndex = -1
            BindilArCourses()
            Session("Redirect") = 0
            Response.Redirect("~/CoursesManagmentWF.aspx")
        End If
    End Sub
    Protected Sub BtnAddCourse_Click(sender As Object, e As EventArgs)
        MultiView1.ActiveViewIndex = 1
    End Sub
    Protected Sub ilArCourses_SelectedIndexChanged(sender As Object, e As EventArgs)
        Session("T") = 0
        Session("CNo") = ilArCourses.DataKeys.Item(ilArCourses.SelectedItem.ItemIndex)
        Response.Redirect("~/AddQustionWF.aspx")
    End Sub
#End Region

#Region "Video Courses Functions"
    Sub BindilVidCourses()
        ilVidCourses.DataSource = DS1
        ilVidCourses.DataBind()
    End Sub
    Protected Sub ilVidCourses_EditCommand(source As Object, e As DataListCommandEventArgs)
        ilVidCourses.EditItemIndex = e.Item.ItemIndex
        BindilVidCourses()
    End Sub
    Protected Sub ilVidCourses_CancelCommand(source As Object, e As DataListCommandEventArgs)
        ilVidCourses.EditItemIndex = -1
        BindilVidCourses()
    End Sub
    Protected Sub ilVidCourses_DeleteCommand(source As Object, e As DataListCommandEventArgs)
        Dim CoVidImg As String =
             (CType(e.Item.FindControl("COVidImg"), Image)).ImageUrl
        Dim CoVide As String =
             (CType(e.Item.FindControl("txtVid"), TextBox)).Text
        If File.Exists(Server.MapPath(CoVidImg)) Then
            File.Delete(Server.MapPath(CoVidImg))
        End If
        If File.Exists(Server.MapPath("VidCourses/") & CoVide) Then
            File.Delete(Server.MapPath("VidCourses/") & CoVide)
        End If
        SDSVideo.DeleteParameters("Id").DefaultValue = ilVidCourses.DataKeys(e.Item.ItemIndex).ToString()
        SDSVideo.Delete()
        ilVidCourses.EditItemIndex = -1
        BindilVidCourses()
        Session("Redirect") = 2
        Response.Redirect("~/CoursesManagmentWF.aspx")
    End Sub
    Protected Sub btnAdd1_Click(sender As Object, e As EventArgs) Handles btnAdd1.Click
        randomName = DateTime.Now.Ticks.ToString
        FUVideo.SaveAs(Server.MapPath("/VidCourses/") & randomName & Path.GetExtension(FUVideo.PostedFile.FileName))
        Session("VidPath") = randomName + Path.GetExtension(FUVideo.PostedFile.FileName)
        Dim ImgPath As String = DateTime.Now.Ticks.ToString
        FUImage2.SaveAs(Server.MapPath("/VidImg/") & ImgPath & Path.GetExtension(FUImage2.PostedFile.FileName))
        Session("ImgPath") = "/VidImg/" & ImgPath & Path.GetExtension(FUImage2.PostedFile.FileName)
        Session("CoPara") = txtPara.InnerText
        SDSVideo.Insert()
        MultiView1.ActiveViewIndex = 2
    End Sub
    Protected Sub ilVidCourses_UpdateCommand(source As Object, e As DataListCommandEventArgs)
        If e.CommandName = "Update" Then
            Dim txtID As String = (CType(e.Item.FindControl("txtVidID"), TextBox)).Text
            Dim txtType As Integer = (CType(e.Item.FindControl("DropDownList1"), DropDownList)).SelectedValue
            Dim Title As String = (CType(e.Item.FindControl("txtVidTitl"), TextBox)).Text
            Dim CreditHr As Integer = Int(Val((CType(e.Item.FindControl("txtVidCredit"), TextBox)).Text))
            Dim CoPara As String = (CType(e.Item.FindControl("txtPara"), HtmlTextArea)).InnerText
            Dim FileUImage As String = (CType(e.Item.FindControl("FUVidImage"), FileUpload)).PostedFile.FileName
            Dim CoImg As String = (CType(e.Item.FindControl("COVidImg"), Image)).ImageUrl
            Session("ImgPath") = CoImg
            Dim FileUVideo As String = (CType(e.Item.FindControl("FUVideo"), FileUpload)).PostedFile.FileName
            Dim txtVid As String = (CType(e.Item.FindControl("txtVid"), TextBox)).Text
            Session("VidPath") = txtVid
            Dim FUploadVideo As FileUpload = (CType(e.Item.FindControl("FUVideo"), FileUpload))
            Dim FUploadImage As FileUpload = (CType(e.Item.FindControl("FUVidImage"), FileUpload))
            extention = System.IO.Path.GetExtension(FileUImage)
            If (FUploadVideo.HasFile) Then
                If (FUploadImage.HasFile) Then
                    If File.Exists(Server.MapPath(CoImg)) Then
                        File.Delete(Server.MapPath(CoImg))
                    End If
                    If File.Exists(Server.MapPath("/VidCourses/" & txtVid)) Then
                        File.Delete(Server.MapPath("/VidCourses/" & txtVid))
                    End If
                    randomName = DateTime.Now.Ticks.ToString
                    FUploadVideo.SaveAs(Server.MapPath("/VidCourses/") & randomName & Path.GetExtension(FileUVideo))
                    Session("VidPath") = randomName + Path.GetExtension(FileUVideo)
                    Dim ImgPath As String = DateTime.Now.Ticks.ToString + extention
                    FUploadImage.SaveAs(Server.MapPath("/VidImg/") & ImgPath)
                    Session("ImgPath") = "/VidImg/" & ImgPath
                Else
                    If File.Exists(Server.MapPath("VidCourses/" & txtVid)) Then
                        File.Delete(Server.MapPath("VidCourses/" & txtVid))
                    End If
                    randomName = DateTime.Now.Ticks.ToString
                    FUploadVideo.SaveAs(Server.MapPath("/VidCourses/") + randomName + Path.GetExtension(FileUVideo))
                    Session("VidPath") = randomName + Path.GetExtension(FileUVideo)
                End If
            Else
                If (FUploadImage.HasFile) Then
                    If File.Exists(CoImg) Then
                        File.Delete(CoImg)
                    End If
                    Dim ImgPath As String = DateTime.Now.Ticks.ToString + extention
                    FUploadImage.SaveAs(Server.MapPath("/VidImg/") & ImgPath)
                    Session("ImgPath") = "/VidImg/" & ImgPath
                End If
            End If
            SDSVideo.UpdateParameters("Id").DefaultValue = ilVidCourses.DataKeys(e.Item.ItemIndex).ToString()
            SDSVideo.UpdateParameters("CoTitle").DefaultValue = Title
            SDSVideo.UpdateParameters("CoVid").DefaultValue = Session("VidPath")
            SDSVideo.UpdateParameters("CoImg").DefaultValue = Session("ImgPath")
            SDSVideo.UpdateParameters("CreditHr").DefaultValue = CreditHr
            SDSVideo.UpdateParameters("Copara").DefaultValue = CoPara
            SDSVideo.UpdateParameters("CoType").DefaultValue = txtType
            SDSVideo.Update()
            ilVidCourses.EditItemIndex = -1
            BindilVidCourses()
            Session("Redirect") = 2
            Response.Redirect("~/CoursesManagmentWF.aspx")
        End If
    End Sub
    Protected Sub BtnAddVidCourse_Click(sender As Object, e As EventArgs)
        MultiView1.ActiveViewIndex = 3
    End Sub
    Protected Sub ilVidCourses_SelectedIndexChanged(sender As Object, e As EventArgs)
        Session("T") = 1
        Session("CNo") = ilVidCourses.DataKeys.Item(ilVidCourses.SelectedItem.ItemIndex)
        Response.Redirect("~/AddQustionWF.aspx")
    End Sub
#End Region

#Region "Slide Courses Functions"
    Sub BindilSliCourses()
        ilSliCourses.DataSource = DS2
        ilSliCourses.DataBind()
    End Sub
    Protected Sub ilSliCourses_EditCommand(source As Object, e As DataListCommandEventArgs)
        ilSliCourses.EditItemIndex = e.Item.ItemIndex
        BindilSliCourses()
    End Sub
    Protected Sub ilSliCourses_CancelCommand(source As Object, e As DataListCommandEventArgs)
        ilSliCourses.EditItemIndex = -1
        BindilSliCourses()
    End Sub
    Protected Sub ilSliCourses_DeleteCommand(source As Object, e As DataListCommandEventArgs)
        SDSSlide.SelectCommand = "SELECT SubPage FROM SliSubCourses Where SliCoId=@Id"
        SDSSlide.SelectParameters.Add("Id", ilSliCourses.DataKeys(e.Item.ItemIndex).ToString())
        DS3 = SDSSlide.Select(DataSourceSelectArguments.Empty())
        For x = 0 To DS3.Table.Rows.Count - 1
            If File.Exists(Server.MapPath(DS3.Table.Rows(x).Item(0))) Then
                File.Delete(Server.MapPath(DS3.Table.Rows(x).Item(0)))
            End If
        Next
        Dim CoSliImg As String =
     (CType(e.Item.FindControl("COSliImg"), Image)).ImageUrl
        If File.Exists(Server.MapPath(CoSliImg)) Then
            File.Delete(Server.MapPath(CoSliImg))
        End If
        SDSSlide.DeleteCommand = "Delete  From SliCourses Where Id=@Id"
        SDSSlide.DeleteParameters("Id").DefaultValue = ilSliCourses.DataKeys(e.Item.ItemIndex).ToString()
        SDSSlide.Delete()
        SDSSlide.DeleteCommand = "Delete From SliSubCourses Where SliCoId=@Id"
        SDSSlide.DeleteParameters("Id").DefaultValue = ilSliCourses.DataKeys(e.Item.ItemIndex).ToString()
        SDSSlide.Delete()
        ilSliCourses.EditItemIndex = -1
        BindilSliCourses()
        Session("Redirect") = 4
        Response.Redirect("~/CoursesManagmentWF.aspx")
    End Sub
    Protected Sub ilSliCourses_UpdateCommand(source As Object, e As DataListCommandEventArgs)
        If e.CommandName = "Update" Then
            Dim txtID As String = (CType(e.Item.FindControl("txtSliID"), TextBox)).Text
            Dim Title As String = (CType(e.Item.FindControl("txtSliTitl"), TextBox)).Text
            Dim txtType As Integer = (CType(e.Item.FindControl("DropDownList2"), DropDownList)).SelectedValue
            Dim CreditHr As Integer = Int(Val((CType(e.Item.FindControl("txtSliCredit"), TextBox)).Text))
            Dim FileUImage As String = (CType(e.Item.FindControl("FUSliImage"), FileUpload)).PostedFile.FileName
            Dim CoImg As String = (CType(e.Item.FindControl("COSliImg"), Image)).ImageUrl
            Session("ImgPath") = CoImg
            Dim FUploadImage As FileUpload = (CType(e.Item.FindControl("FUSliImage"), FileUpload))
            extention = System.IO.Path.GetExtension(FileUImage)

            If (FUploadImage.HasFile) Then
                If File.Exists(Server.MapPath(CoImg)) Then
                    File.Delete(Server.MapPath(CoImg))
                End If
                Dim ImgPath As String = DateTime.Now.Ticks.ToString + extention
                FUploadImage.SaveAs(Server.MapPath("/SliImg/") & ImgPath)
                Session("ImgPath") = "/SliImg/" & ImgPath
            End If
            SDSSlide.UpdateParameters("Id").DefaultValue = ilSliCourses.DataKeys(e.Item.ItemIndex).ToString()
            SDSSlide.UpdateParameters("CoTitle").DefaultValue = Title
            SDSSlide.UpdateParameters("CoType").DefaultValue = txtType
            SDSSlide.UpdateParameters("CoImg").DefaultValue = Session("ImgPath")
            SDSSlide.UpdateParameters("CreditHr").DefaultValue = CreditHr
            SDSSlide.Update()
            ilSliCourses.EditItemIndex = -1
            BindilSliCourses()
            Session("Redirect") = 4
            Response.Redirect("~/CoursesManagmentWF.aspx")
        End If
    End Sub
    Protected Sub ilSliCourses_SelectedIndexChanged(sender As Object, e As EventArgs)
        Session("T") = 2
        Session("CNo") = ilSliCourses.DataKeys.Item(ilSliCourses.SelectedItem.ItemIndex)
        Response.Redirect("~/AddQustionWF.aspx")
    End Sub
    Protected Sub ilSliCourses_ItemCommand(source As Object, e As DataListCommandEventArgs)
        If e.CommandName = "AddQ" Then
            Session("SliId") = ilSliCourses.DataKeys(e.Item.ItemIndex).ToString()
            Session("SliTitle") = (CType(e.Item.FindControl("lblTitle"), Label)).Text
            Response.Redirect("~/AddCourseSlidesWF.aspx")
        End If
    End Sub
    Protected Sub btnAdd2_Click(sender As Object, e As EventArgs) Handles btnAdd2.Click
        Dim ImgPath As String = DateTime.Now.Ticks.ToString
        FUImage3.SaveAs(Server.MapPath("/SliImg/") & ImgPath & Path.GetExtension(FUImage3.PostedFile.FileName))
        Session("ImgPath") = "/SliImg/" & ImgPath & Path.GetExtension(FUImage3.PostedFile.FileName)
        SDSSlide.Insert()
        MultiView1.ActiveViewIndex = 4
    End Sub
    Protected Sub BtnAddSliCourse_Click(sender As Object, e As EventArgs)
        MultiView1.ActiveViewIndex = 5
    End Sub
#End Region

    Protected Sub btnArt_Click(sender As Object, e As EventArgs) Handles btnArt.Click
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub btnVid_Click(sender As Object, e As EventArgs) Handles btnVid.Click
        MultiView1.ActiveViewIndex = 2
    End Sub
    Protected Sub btnSli_Click(sender As Object, e As EventArgs) Handles btnSli.Click
        MultiView1.ActiveViewIndex = 4
    End Sub
End Class