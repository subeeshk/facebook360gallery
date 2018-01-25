Imports ASPSnippets.FaceBookAPI
Imports System.Web.Script.Serialization

Partial Class VB
    Inherits System.Web.UI.Page
    Protected Sub Login(sender As Object, e As EventArgs)
        FaceBookConnect.Authorize("user_photos,email", Request.Url.AbsoluteUri.Split("?"c)(0))
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        FaceBookConnect.API_Key = "<Your API Key>"
        FaceBookConnect.API_Secret = "<Your API Secret>"
        If Not IsPostBack Then
            If Request.QueryString("error") = "access_denied" Then
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('User has denied access.')", True)
                Return
            End If

            Dim code As String = Request.QueryString("code")
            If Not String.IsNullOrEmpty(code) Then
                Dim data As String = FaceBookConnect.Fetch(code, "me?fields=id,name,email")
                Dim faceBookUser As FaceBookUser = New JavaScriptSerializer().Deserialize(Of FaceBookUser)(data)
                faceBookUser.PictureUrl = String.Format("https://graph.facebook.com/{0}/picture", faceBookUser.Id)
                pnlFaceBookUser.Visible = True
                lblId.Text = faceBookUser.Id
                lblUserName.Text = faceBookUser.UserName
                lblName.Text = faceBookUser.Name
                lblEmail.Text = faceBookUser.Email
                ProfileImage.ImageUrl = faceBookUser.PictureUrl
                btnLogin.Enabled = False
            End If
        End If
    End Sub
End Class
Public Class FaceBookUser
    Public Property Id() As String
        Get
            Return m_Id
        End Get
        Set(value As String)
            m_Id = value
        End Set
    End Property
    Private m_Id As String
    Public Property Name() As String
        Get
            Return m_Name
        End Get
        Set(value As String)
            m_Name = value
        End Set
    End Property
    Private m_Name As String
    Public Property UserName() As String
        Get
            Return m_UserName
        End Get
        Set(value As String)
            m_UserName = value
        End Set
    End Property
    Private m_UserName As String
    Public Property PictureUrl() As String
        Get
            Return m_PictureUrl
        End Get
        Set(value As String)
            m_PictureUrl = value
        End Set
    End Property
    Private m_PictureUrl As String
    Public Property Email() As String
        Get
            Return m_Email
        End Get
        Set(value As String)
            m_Email = value
        End Set
    End Property
    Private m_Email As String
End Class




