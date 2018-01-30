
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panoview.aspx.cs" Inherits="fb360.panoview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   	<style>
		body {
			font-family: Monospace;
			background-color: #f0f0f0;
			color: white;
			margin: 0px;
			overflow: hidden;
		}
	</style>
</head>
<body>
    <form id="form1" runat="server">
   <script src="js/three.min.js"></script>
	<script src="js/OrbitControls.js"></script>
	<script src="js/EquirectangularToCubemap.js"></script>
        <script type="application/javascript">
  window.fbAsyncInit = function() {
    // init the FB JS SDK
    FB.init({
        appId: '1412197185517246',
      status     : true,                                 
      xfbml      : true                                  
    });

  };

  // Load the SDK asynchronously
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/all.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

function FBShareOp(){
	var product_name   = 	'your title name';
	var description	   =	'description';
	var share_image	   =	'full image url ';
	var share_url	   =	'url to share';	
        var share_capt     =    'caption';
    FB.ui({
        method: 'feed',
        name: product_name,
        link: share_url,
        picture: share_image,
        caption: share_capt,
        description: description

    }, function(response) {
        if(response && response.post_id){}
        else{}
    });

}

</script>
	<script>

		var container;
		var camera, scene, renderer;
		var mesh, mesh2, sphere;
		var controls;

		window.addEventListener( 'load', function() {
			init();
			animate();
		});

		function init() {

			container = document.createElement( 'div' );
			document.body.appendChild( container );

			camera = new THREE.PerspectiveCamera( 70, window.innerWidth / window.innerHeight, 1, 10000 );
			camera.rotation.x = Math.PI;
			camera.position.set( 0, 0, 50 );

			scene = new THREE.Scene();

			renderer = new THREE.WebGLRenderer();
			renderer.setClearColor( 0xf0f0f0 );
			renderer.setPixelRatio( window.devicePixelRatio );
			renderer.setSize( window.innerWidth, window.innerHeight );
			container.appendChild(renderer.domElement);

			controls = new THREE.OrbitControls( camera, renderer.domElement );
			controls.enableZoom = false;

			var loader = new THREE.TextureLoader();
			loader.load('images/AQDI40C5kI.jpg', function (res) {

				var equiToCube = new EquirectangularToCubemap( renderer );

			

			

				sphere = new THREE.Mesh(
					new THREE.IcosahedronGeometry( 100, 5 ),
					new THREE.MeshBasicMaterial( { map: res, side: THREE.BackSide, depthWrite: false } )
				);
				scene.add( sphere );

			} );

	

		}

		function onWindowResize() {

			camera.aspect = window.innerWidth / window.innerHeight;
			camera.updateProjectionMatrix();

			renderer.setSize( window.innerWidth, window.innerHeight );

		}


		function animate() {

			requestAnimationFrame( animate );

			controls.update();
			render();

		}

		function render() {

			if( sphere ) sphere.position.copy( camera.position );
			renderer.render( scene, camera );

		}

	</script>

    </form>
</body>
</html>
