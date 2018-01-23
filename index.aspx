<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="xmp2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        var info = $(".info");
        $(".picture").bind("mouseenter", function () {
            var p = GetScreenCordinates(this);
            $("input", info).attr("rel", this.src);
            info.show();
            info.css("height", $(this)[0].offsetHeight / 2);
            info.css("width", $(this).width());
            info.css({ "left": p.x, "top": p.y + this.offsetHeight - info[0].offsetHeight });
        });
        $(".info a, .info").bind("mouseenter, mousemove, mouseover", function () {
            info.show();
        });
        $(".picture").bind("mouseleave", function () {
            info.hide();
        });
        $("[id*=imgFaceBook]").bind("click", function () {
            if (this.alt == "login") {
                window.open("index.aspx?login=1", "LoginPopup", "width=550,height=300,resizable=1");
                return false;
            }
            var hidden = $("<input name = 'image_url' type = 'hidden' />");
            hidden.val($(this).attr("rel"));
            $("form").append(hidden);
        });
    });

    function GetScreenCordinates(obj) {
        var p = {};
        p.x = obj.offsetLeft;
        p.y = obj.offsetTop;
        while (obj.offsetParent) {
            p.x = p.x + obj.offsetParent.offsetLeft;
            p.y = p.y + obj.offsetParent.offsetTop;
            if (obj == document.getElementsByTagName("body")[0]) {
                break;
            }
            else {
                obj = obj.offsetParent;
            }
        }
        return p;
    }
</script>


    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
       <asp:ImageButton ID="imgFaceBook" AlternateText="login" ImageUrl="~/img/fbLogin.jpg"
            runat="server" OnClick="ShareImage"></asp:ImageButton>
    </div>
    </form>
</body>
</html>
