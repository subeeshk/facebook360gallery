using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.FaceBookAPI;

public partial class CS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FaceBookConnect.API_Key = "1412197185517246";
        FaceBookConnect.API_Secret = "5ea43ec27c5f4856f5534ce213024972";
        if (!IsPostBack)
        {
            string code = Request.QueryString["code"];
            if (!string.IsNullOrEmpty(code))
            {
                FaceBookConnect.PostFile(code, "me/photos", (HttpPostedFile)Session["File"], Session["Message"].ToString());
                Session["File"] = null;
                Session["Message"] = null;
            }
        }
    }

    protected void UploadPhoto(object sender, EventArgs e)
    {
        Session["File"] = FileUpload1.PostedFile;
        Session["Message"] = txtMessage.Text;
        FaceBookConnect.Authorize("user_photos", "http://facebook360gallery.apphb.com/");
    }
}