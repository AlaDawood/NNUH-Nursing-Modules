Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.tool.xml
Imports System.IO
Imports System.Net.Mail
Imports System.Net
Imports iTextSharp.tool.xml.pipeline.css
Imports System.Globalization

Public Class CertificateUC
    Inherits System.Web.UI.UserControl
    Dim DS As DataView
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SDSRepeat.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        DS = SDSRepeat.Select(DataSourceSelectArguments.Empty())
        SDSRepeat.SelectCommand = "Select * from UserCourses Where UserNo = @UserNo And CoType = @CoType And CoId = @CoId"
        Session("Mark1") = DS.Table.Rows(0).Item(4)
        Session("MarkAll") = DS.Table.Rows(0).Item(5)
        If Session("Mark1") = 0 And Session("MarkAll") = 0 Then
            If Session("Approval") = 1 Then
                btnReplay.Visible = False
                btnPrint.Visible = True
                lblResult.InnerHtml = "Congratulations! <br/> you get Approved Certification with zero Credit Hrs From Head of CNED"
            Else
                btnReplay.Visible = False
                btnPrint.Visible = True
                lblResult.InnerHtml = "Congratulations! <br/> you get Certification with zero Credit Hrs <br/> ***Your Certification Need Head of CNED Approval"
            End If
        Else
            If Session("Approval") = 1 Then
                If Session("Mark1") >= Session("MarkAll") * 80 \ 100 Then
                    btnPrint.Visible = True
                    btnReplay.Visible = False
                    lblResult.InnerHtml = "Congratulations! <br/> you've succeeded in the Exam <br/> ***Your Certification Approved by Head of CNED"
                ElseIf Session("Mark1") < Session("MarkAll") * 80 \ 100 Then
                    btnReplay.Visible = True
                    btnPrint.Visible = False
                    lblResult.InnerHtml = "Good Luck You Can Try Again"
                End If
            Else
                If Session("Mark1") >= Session("MarkAll") * 80 \ 100 Then
                    btnPrint.Visible = True
                    btnReplay.Visible = False
                    lblResult.InnerHtml = "Congratulations! <br/> you've succeeded in the Exam <br/> ***Your Certification need Approval from Head of CNED"
                ElseIf Session("Mark1") < Session("MarkAll") * 80 \ 100 Then
                    btnReplay.Visible = True
                    btnPrint.Visible = False
                    lblResult.InnerHtml = "Good Luck You Can Try Again"
                End If
            End If
        End If
        If Not IsPostBack Then
            GetUrl("/images/Certi.png")
        End If
    End Sub
    Private Function DivToHtml(hgc As HtmlGenericControl) As String
        Dim sb As StringBuilder = New StringBuilder()
        Dim sw As StringWriter = New StringWriter(sb)
        Dim hw As HtmlTextWriter = New HtmlTextWriter(sw)
        hgc.RenderControl(hw)
        Dim HtmlText As String = sb.ToString()
        Return HtmlText
    End Function

    Private Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click
        Using sw As New StringWriter()
            Using hw As New HtmlTextWriter(sw)
                Using mm As MailMessage = New MailMessage("NNUH.Nursing.Modules@gmail.com", Session("Email"))
                    Dim sr As New StringReader(sw.ToString())
                    Dim pdfDoc As New Document(PageSize.A4.Rotate(), 10.0F, 10.0F, 10.0F, 10.0F)
                    Dim writer As PdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream)
                    Dim mstream As New MemoryStream
                    Dim writer1 As PdfWriter = PdfWriter.GetInstance(pdfDoc, mstream)

                    pdfDoc.Open()
                    Dim image1 As Image = Image.GetInstance(MapPath("/images/Certi.png"))
                    image1.Alignment = Image.UNDERLYING
                    image1.ScaleAbsolute(PageSize.A4.Height - 10.0F, PageSize.A4.Width - 10.0F)
                    pdfDoc.Add(image1)
                    pdfDoc.Add(Chunk.NEWLINE)
                    Dim table As New PdfPTable(1)
                    Dim cell1, cell2, cell3, cell4, cell5, cell6, cell7 As New PdfPCell()
                    Dim p1, p2, p3, p4, p5, p6 As New Paragraph()
                    p1 = New Paragraph(New Phrase(vbNewLine & vbNewLine & vbNewLine & vbNewLine & vbNewLine & vbNewLine & vbNewLine & vbNewLine))
                    p1.Font = New Font(Font.FontFamily.TIMES_ROMAN, 25)
                    p1.Alignment = Element.ALIGN_CENTER
                    cell1.AddElement(p1)
                    cell1.PaddingBottom = 40.0F
                    cell1.HorizontalAlignment = Element.ALIGN_CENTER
                    cell1.Border = Nothing
                    table.AddCell(cell1)
                    table.HorizontalAlignment = Element.ALIGN_CENTER
                    If Session("CoType") = 0 Then
                        p2 = New Paragraph(New Phrase("THIS ACKNOWLEDGE THAT "))
                        p2.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                        p2.Alignment = Element.ALIGN_CENTER
                        cell2.AddElement(p2)
                        cell2.PaddingBottom = 10.0F
                        cell2.HorizontalAlignment = Element.ALIGN_CENTER
                        cell2.Border = Nothing
                        table.AddCell(cell2)
                        table.HorizontalAlignment = Element.ALIGN_CENTER

                        p3 = New Paragraph(New Phrase(vbNewLine & Session("UserName").ToString))
                        p3.Font = New Font(Font.FontFamily.COURIER, 27)
                        p3.Alignment = Element.ALIGN_CENTER
                        cell3.AddElement(p3)
                        cell3.PaddingBottom = 10.0F
                        cell3.HorizontalAlignment = Element.ALIGN_CENTER
                        cell3.Border = Nothing
                        table.AddCell(cell3)
                        table.HorizontalAlignment = Element.ALIGN_CENTER
                        'HAS BEEN SUCCESSFULLY COMPLETED THE
                        p4 = New Paragraph(New Phrase(vbNewLine & "HAS BEEN SUCCESSFULLY COMPLETED THE" & vbNewLine))
                        p4.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                        p4.Alignment = Element.ALIGN_CENTER
                        cell4.AddElement(p4)
                        cell4.PaddingBottom = 10.0F
                        cell4.HorizontalAlignment = Element.ALIGN_CENTER
                        cell4.Border = Nothing
                        table.AddCell(cell4)
                        table.HorizontalAlignment = Element.ALIGN_CENTER

                        p5 = New Paragraph(New Phrase(vbNewLine & vbNewLine & Session("Title").ToString))
                        p5.Font = New Font(Font.FontFamily.COURIER, 27)
                        'p5.Font.Color = CMYKColor.BLUE
                        p5.Alignment = Element.ALIGN_CENTER
                        cell5.AddElement(p5)
                        cell5.PaddingBottom = 10.0F
                        cell5.HorizontalAlignment = Element.ALIGN_CENTER
                        cell5.Border = Nothing
                        table.AddCell(cell5)
                        table.HorizontalAlignment = Element.ALIGN_CENTER

                        p6 = New Paragraph(New Phrase(vbNewLine & "Date: " & CDate(DS.Table.Rows(0).Item(7).ToString).ToLongDateString & vbNewLine & "CNED " & Now.Year.ToString))
                        p6.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                        p6.Alignment = Element.ALIGN_CENTER
                        cell6.AddElement(p6)
                        cell6.PaddingBottom = 10.0F
                        cell6.HorizontalAlignment = Element.ALIGN_CENTER
                        cell6.Border = Nothing
                        table.AddCell(cell6)
                        table.HorizontalAlignment = Element.ALIGN_CENTER
                    ElseIf Session("CoType") = 1 Then
                        If Session("Approval") = 0 Then
                            p2 = New Paragraph(New Phrase("You Need CNED Approval to Complete Certification"))
                            p2.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                            p2.Alignment = Element.ALIGN_CENTER
                            cell2.AddElement(p2)
                            cell2.PaddingBottom = 10.0F
                            cell2.HorizontalAlignment = Element.ALIGN_CENTER
                            cell2.Border = Nothing
                            table.AddCell(cell2)
                            table.HorizontalAlignment = Element.ALIGN_CENTER
                        ElseIf Session("Approval") = 1 Then
                            p2 = New Paragraph(New Phrase("THIS ACKNOWLEDGE THAT "))
                            p2.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                            p2.Alignment = Element.ALIGN_CENTER
                            cell2.AddElement(p2)
                            cell2.PaddingBottom = 10.0F
                            cell2.HorizontalAlignment = Element.ALIGN_CENTER
                            cell2.Border = Nothing
                            table.AddCell(cell2)
                            table.HorizontalAlignment = Element.ALIGN_CENTER

                            p3 = New Paragraph(New Phrase(vbNewLine & Session("UserName").ToString))
                            p3.Font = New Font(Font.FontFamily.COURIER, 27)
                            p3.Alignment = Element.ALIGN_CENTER
                            cell3.AddElement(p3)
                            cell3.PaddingBottom = 10.0F
                            cell3.HorizontalAlignment = Element.ALIGN_CENTER
                            cell3.Border = Nothing
                            table.AddCell(cell3)
                            table.HorizontalAlignment = Element.ALIGN_CENTER
                            'HAS BEEN SUCCESSFULLY COMPLETED THE
                            p4 = New Paragraph(New Phrase(vbNewLine & "HAS BEEN SUCCESSFULLY COMPLETED THE" & vbNewLine))
                            p4.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                            p4.Alignment = Element.ALIGN_CENTER
                            cell4.AddElement(p4)
                            cell4.PaddingBottom = 10.0F
                            cell4.HorizontalAlignment = Element.ALIGN_CENTER
                            cell4.Border = Nothing
                            table.AddCell(cell4)
                            table.HorizontalAlignment = Element.ALIGN_CENTER

                            p5 = New Paragraph(New Phrase(vbNewLine & Session("Title").ToString))
                            p5.Font = New Font(Font.FontFamily.COURIER, 27)
                            'p5.Font.Color = CMYKColor.BLUE
                            p5.Alignment = Element.ALIGN_CENTER
                            cell5.AddElement(p5)
                            cell5.PaddingBottom = 10.0F
                            cell5.HorizontalAlignment = Element.ALIGN_CENTER
                            cell5.Border = Nothing
                            table.AddCell(cell5)
                            table.HorizontalAlignment = Element.ALIGN_CENTER

                            p6 = New Paragraph(New Phrase(vbNewLine & "Date: " & CDate(DS.Table.Rows(0).Item(7).ToString).ToLongDateString & vbNewLine & "CNED " & Now.Year.ToString))
                            p6.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                            p6.Alignment = Element.ALIGN_CENTER
                            cell6.AddElement(p6)
                            cell6.PaddingBottom = 10.0F
                            cell6.HorizontalAlignment = Element.ALIGN_CENTER
                            cell6.Border = Nothing
                            table.AddCell(cell6)
                            table.HorizontalAlignment = Element.ALIGN_CENTER
                        End If
                    ElseIf Session("CoType") = 2 Then
                        p2 = New Paragraph(New Phrase("Continuing Education Hours Totaling " & DS.Table.Rows(0).Item(8).ToString & " Hours is Awarded to"))
                        p2.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                        p2.Alignment = Element.ALIGN_CENTER
                        cell2.AddElement(p2)
                        cell2.PaddingBottom = 10.0F
                        cell2.HorizontalAlignment = Element.ALIGN_CENTER
                        cell2.Border = Nothing
                        table.AddCell(cell2)
                        table.HorizontalAlignment = Element.ALIGN_CENTER

                        p3 = New Paragraph(New Phrase(vbNewLine & Session("UserName").ToString))
                        p3.Font = New Font(Font.FontFamily.COURIER, 27)
                        p3.Alignment = Element.ALIGN_CENTER
                        cell3.AddElement(p3)
                        cell3.PaddingBottom = 10.0F
                        cell3.HorizontalAlignment = Element.ALIGN_CENTER
                        cell3.Border = Nothing
                        table.AddCell(cell3)
                        table.HorizontalAlignment = Element.ALIGN_CENTER

                        p4 = New Paragraph(New Phrase(vbNewLine & "For Completion of " & vbNewLine))
                        p4.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                        p4.Alignment = Element.ALIGN_CENTER
                        cell4.AddElement(p4)
                        cell4.PaddingBottom = 10.0F
                        cell4.HorizontalAlignment = Element.ALIGN_CENTER
                        cell4.Border = Nothing
                        table.AddCell(cell4)
                        table.HorizontalAlignment = Element.ALIGN_CENTER

                        p5 = New Paragraph(New Phrase(vbNewLine & Session("Title").ToString))
                        p5.Font = New Font(Font.FontFamily.COURIER, 27)
                        'p5.Font.Color = CMYKColor.BLUE
                        p5.Alignment = Element.ALIGN_CENTER
                        cell5.AddElement(p5)
                        cell5.PaddingBottom = 10.0F
                        cell5.HorizontalAlignment = Element.ALIGN_CENTER
                        cell5.Border = Nothing
                        table.AddCell(cell5)
                        table.HorizontalAlignment = Element.ALIGN_CENTER

                        p6 = New Paragraph(New Phrase(vbNewLine & "Date: " & CDate(DS.Table.Rows(0).Item(7).ToString).ToLongDateString & vbNewLine & vbNewLine & "This certificate is valid for 1 years from the date of completion NNUH." & vbNewLine & "CNED " & Now.Year.ToString))
                        p6.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                        p6.Alignment = Element.ALIGN_CENTER
                        cell6.AddElement(p6)
                        cell6.PaddingBottom = 10.0F
                        cell6.HorizontalAlignment = Element.ALIGN_CENTER
                        cell6.Border = Nothing
                        table.AddCell(cell6)
                        table.HorizontalAlignment = Element.ALIGN_CENTER
                    ElseIf Session("CoType") = 3 Then
                        If Session("Approval") = 0 Then
                            p2 = New Paragraph(New Phrase("You Need CNED Approval to Complete Certification"))
                            p2.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                            p2.Alignment = Element.ALIGN_CENTER
                            cell2.AddElement(p2)
                            cell2.PaddingBottom = 10.0F
                            cell2.HorizontalAlignment = Element.ALIGN_CENTER
                            cell2.Border = Nothing
                            table.AddCell(cell2)
                            table.HorizontalAlignment = Element.ALIGN_CENTER
                        Else
                            p2 = New Paragraph(New Phrase("Continuing Education Hours Totaling " & DS.Table.Rows(0).Item(8).ToString & " Hours is Awarded to"))
                            p2.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                            p2.Alignment = Element.ALIGN_CENTER
                            cell2.AddElement(p2)
                            cell2.PaddingBottom = 10.0F
                            cell2.HorizontalAlignment = Element.ALIGN_CENTER
                            cell2.Border = Nothing
                            table.AddCell(cell2)
                            table.HorizontalAlignment = Element.ALIGN_CENTER

                            p3 = New Paragraph(New Phrase(vbNewLine & Session("UserName").ToString))
                            p3.Font = New Font(Font.FontFamily.COURIER, 27)
                            p3.Alignment = Element.ALIGN_CENTER
                            cell3.AddElement(p3)
                            cell3.PaddingBottom = 10.0F
                            cell3.HorizontalAlignment = Element.ALIGN_CENTER
                            cell3.Border = Nothing
                            table.AddCell(cell3)
                            table.HorizontalAlignment = Element.ALIGN_CENTER

                            p4 = New Paragraph(New Phrase(vbNewLine & "For Completion of " & vbNewLine))
                            p4.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                            p4.Alignment = Element.ALIGN_CENTER
                            cell4.AddElement(p4)
                            cell4.PaddingBottom = 10.0F
                            cell4.HorizontalAlignment = Element.ALIGN_CENTER
                            cell4.Border = Nothing
                            table.AddCell(cell4)
                            table.HorizontalAlignment = Element.ALIGN_CENTER

                            p5 = New Paragraph(New Phrase(vbNewLine & Session("Title").ToString))
                            p5.Font = New Font(Font.FontFamily.COURIER, 27)
                            'p5.Font.Color = CMYKColor.BLUE
                            p5.Alignment = Element.ALIGN_CENTER
                            cell5.AddElement(p5)
                            cell5.PaddingBottom = 10.0F
                            cell5.HorizontalAlignment = Element.ALIGN_CENTER
                            cell5.Border = Nothing
                            table.AddCell(cell5)
                            table.HorizontalAlignment = Element.ALIGN_CENTER

                            p6 = New Paragraph(New Phrase(vbNewLine & "Date: " & CDate(DS.Table.Rows(0).Item(7).ToString).ToLongDateString & vbNewLine & vbNewLine & "This certificate is valid for 1 years from the date of completion NNUH." & vbNewLine & "CNED " & Now.Year.ToString))
                            p6.Font = New Font(Font.FontFamily.TIMES_ROMAN, 20)
                            p6.Alignment = Element.ALIGN_CENTER
                            cell6.AddElement(p6)
                            cell6.PaddingBottom = 10.0F
                            cell6.HorizontalAlignment = Element.ALIGN_CENTER
                            cell6.Border = Nothing
                            table.AddCell(cell6)
                            table.HorizontalAlignment = Element.ALIGN_CENTER
                        End If
                    End If

                    pdfDoc.Add(table)
                    pdfDoc.Close()
                    Response.ContentType = "application/pdf"
                    Response.AddHeader("content-disposition", "attachment;filename=Nursing Module Certification.pdf")

                    mm.Subject = "NNUH Nursing Modules Certification Center"
                    mm.IsBodyHtml = True
                    mm.Body = "This Certification From NNUH CNED and NNUH Nursing Modules Certification Center as Digital CME Certification."
                    Dim smtp As SmtpClient = New SmtpClient("smtp.gmail.com", 587)
                    smtp.EnableSsl = True
                    Dim bytes As Byte() = mstream.ToArray()
                    mstream.Close()
                    mm.Attachments.Add(New Attachment(New MemoryStream(bytes), "Nursing Module Certification.pdf"))
                    Dim networkc As NetworkCredential = New NetworkCredential("NNUH.Nursing.Modules@gmail.com", "10716602Akm+")
                    smtp.UseDefaultCredentials = True
                    smtp.Credentials = networkc
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network
                    smtp.Send(mm)
                    Response.Cache.SetCacheability(HttpCacheability.NoCache)
                    Response.Write(pdfDoc)
                    Response.End()
                End Using
            End Using '
        End Using
    End Sub

    Protected Function GetUrl(ByVal imagepath As String) As String
        Dim splits As String() = Request.Url.AbsoluteUri.Split("/"c)
        If splits.Length >= 2 Then
            Dim url As String = splits(0) & "//"
            For i As Integer = 2 To splits.Length - 1 - 1
                url += splits(i)
                url += "/"
            Next

            Return url & imagepath
        End If

        Return imagepath
    End Function
    Protected Sub btnReplay_Click(sender As Object, e As EventArgs) Handles btnReplay.Click
        SDSRepeat.UpdateCommand = "Update UserCourses Set Mark= 0,MarkAll= 0,LastQ=0 Where UserNo=@UserNo And CoType=@CoType And CoId=@CoId"
        SDSRepeat.Update()
        Response.Redirect("~/Index.aspx")
    End Sub

End Class