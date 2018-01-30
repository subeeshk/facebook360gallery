<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="fb360.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta property="fb:app_id" content="1412197185517246">
    <meta property="og:type" content="article">
    <meta property="og:title" content="Make your 360 Photo Gallery">
    <meta property="og:site_name" content="facebook360gallery">
    <meta property="og:url" content="http://facebook360gallery.apphb.com">
    <meta property="og:image" content="https://www.androidcentral.com/sites/androidcentral.com/files/styles/large/public/topic_images/2016/photosphere-topic.png">
    <meta property="article:author" content="https://www.facebook.com/360Gallery-Community-576539799358104">




    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-113059173-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-113059173-1');
</script>

     <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>my 360photo Galery</title>
 

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/vendor.css">
    <link rel="stylesheet" href="css/main.css">

    <!-- script
    ================================================== -->
    <script src="js/modernizr.js"></script>
    <script src="js/pace.min.js"></script>

    <!-- favicons
    ================================================== -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">

</head>
<body>
    <form id="form1" runat="server">
   
    <!-- header
    ================================================== -->
    <header class="s-header">

       <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- facebook 360 gallery -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-7374990094149493"
     data-ad-slot="9672528435"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

      


    </header> <!-- end s-header -->


    <!-- home
    ================================================== -->
    <section id="home" class="s-home target-section" data-parallax="scroll" data-image-src="images/hero-bg.jpg" data-natural-width=3000 data-natural-height=2000 data-position-y=center>

        <div class="overlay"></div>
        <div class="shadow-overlay"></div>

        <div class="home-content">

            <div class="row home-content__main">

                <h3>Welcome to 360 Photo Gallery</h3>

                
                <div class="home-content__buttons">
               <a href="#">       <asp:ImageButton ID="imgFaceBook" AlternateText="login" CssClass="btn--medium" ImageUrl="~/images/fbLogin.png"
            runat="server" OnClick="ShareImage"></asp:ImageButton></a> 
                    
                    <!--<a href="#about" class="smoothscroll btn btn--stroke">
                        More About Us
                    </a>-->
                  
                </div>

            </div>

            <div class="footer-bottom">
               <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- facebook 360 gallery -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-7374990094149493"
     data-ad-slot="9672528435"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
            </div>

          

        </div> <!-- end home-content -->


    
        <!-- end home-social -->

    </section> <!-- end s-home -->




    <!-- photoswipe background
    ================================================== -->
    <div aria-hidden="true" class="pswp" role="dialog" tabindex="-1">

        <div class="pswp__bg"></div>
        <div class="pswp__scroll-wrap">

            <div class="pswp__container">
                <div class="pswp__item"></div>
                <div class="pswp__item"></div>
                <div class="pswp__item"></div>
            </div>

            <div class="pswp__ui pswp__ui--hidden">
                <div class="pswp__top-bar">
                    <div class="pswp__counter"></div><button class="pswp__button pswp__button--close" title="Close (Esc)"></button> <button class="pswp__button pswp__button--share" title=
                    "Share"></button> <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button> <button class="pswp__button pswp__button--zoom" title=
                    "Zoom in/out"></button>
                    <div class="pswp__preloader">
                        <div class="pswp__preloader__icn">
                            <div class="pswp__preloader__cut">
                                <div class="pswp__preloader__donut"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                    <div class="pswp__share-tooltip"></div>
                </div><button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button> <button class="pswp__button pswp__button--arrow--right" title=
                "Next (arrow right)"></button>
                <div class="pswp__caption">
                    <div class="pswp__caption__center"></div>
                </div>
            </div>

        </div>

    </div> <!-- end photoSwipe background -->


    <!-- preloader
    ================================================== -->
    <div id="preloader">
        <div id="loader">
            <div class="line-scale-pulse-out">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    </div>


    <!-- Java Script
    ================================================== -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/main.js"></script>
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
    </form>
</body>
</html>
