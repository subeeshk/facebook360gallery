Imports ASPSnippets.FaceBookAPI

Partial Class VB
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        FaceBookConnect.API_Key = "<API Key>"
        FaceBookConnect.API_Secret = "<API Secret>"
        If Not IsPostBack Then
            Dim code As String = Request.QueryString("code")
            If Not String.IsNullOrEmpty(code) Then
                FaceBookConnect.PostFile(code, "me/photos", DirectCast(Session("File"), HttpPostedFile), Session("Message").ToString())
                Session("File") = Nothing
                Session("Message") = Nothing
            End If
        End If
    End Sub

    Protected Sub UploadPhoto(sender As Object, e As EventArgs)
        Session("File") = FileUpload1.PostedFile
        Session("Message") = txtMessage.Text
        FaceBookConnect.Authorize("user_photos", Request.Url.AbsoluteUri.Split("?"c)(0))
    End Sub
End Class
