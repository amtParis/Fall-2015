/*
	VRRoom
	Gael Hugo
	12.10.2015

	allow to explore the gallery with google cardboard
*/

var VRRoom = function(all3DLayers){
	this.camera;
	this.scene;
	this.renderer;
	this.controls;
	this.objects = [];
	this.targets =  {sphere:[],helix:[]}
	this.all3DLayers = all3DLayers;



	this.mobile = false;
	this.timeout ;

	this.halfSize = 620;

	this.init();
	this.animate();

}

VRRoom.prototype = {

	init:function(){

		var ua = navigator.userAgent;
	    var checker = {
	      iphone: ua.match(/(iPhone|iPod|iPad)/),
	      blackberry: ua.match(/BlackBerry/),
	      android: ua.match(/Android/)
	    };

	    if(checker.iphone){
	    	console.log("is mobile !");
	    	this.mobile = true;
	    }else{
	    	console.log("is desktop !");
	    }





			this.camera = new THREE.PerspectiveCamera( 40, window.innerWidth / window.innerHeight, 1, 100 );
			this.camera.position.z = 0.1;//0.1;
			//this.camera.target = new THREE.Object3D();

			this.scene = new THREE.Scene();



			for ( var i = 0; i < this.all3DLayers.length; i ++ ) {
				this.scene.add( this.all3DLayers[i] );
				//this.objects.push( this.all3DLayers[i] );
			}


			//floor
			var floor = this.all3DLayers[4];
			floor.rotation.x = 90*Math.PI/180;
			floor.position.y = -this.halfSize;

			//Wall1
			var wall1 = this.all3DLayers[0];
			wall1.position.z = -this.halfSize;

			//Wall2
			var wall2 = this.all3DLayers[1];
			wall2.position.z = this.halfSize;

			//Wall3
			var wall3 = this.all3DLayers[2];
				wall3.rotation.y = 90*Math.PI/180;
			wall3.position.x = -this.halfSize;

			//Wall4
			var wall4 = this.all3DLayers[3];
				wall4.rotation.y = 90*Math.PI/180;
			wall4.position.x = this.halfSize;



		// helix
/*
		var vector = new THREE.Vector3();

		for ( var i = 0, l = this.objects.length; i < l; i ++ ) {

			var phi = i * 0.350 + Math.PI + Math.PI/2;

			var object = new THREE.Object3D();

			object.position.x = 2000 * Math.cos( phi );
			object.position.y = i*50;//- ( i * 50 ) + 1000;
			object.position.z = 2000 * Math.sin( phi );

			vector.x = object.position.x * -2; //pour inverser l'image
			vector.y = object.position.y;
			vector.z = object.position.z * -2; //pour inverser l'image

			object.lookAt( vector );

			this.targets.helix.push( object );

		}

		*/


		this.renderer = new THREE.CSS3DStereoRenderer();

		this.renderer.setSize( window.innerWidth, window.innerHeight );
		this.renderer.domElement.style.position = 'absolute';
		document.getElementById( 'gallery' ).appendChild( this.renderer.domElement );


		this.controls = new THREE.OrbitControls(this.camera);
		//this.controls.target.set(this.objects[0].position.x,this.objects[0].position.y,this.objects[0].position.z);
		//this.controls.object.position.y = 3000;


		window.addEventListener( 'resize', this.onWindowResize.bind(this), false );
		if(this.mobile){
			window.addEventListener('deviceorientation', this.setOrientationControls.bind(this), true);
		}

	window.addEventListener( 'click', this.onLayerClick.bind(this), true );
  window.addEventListener( 'touchstart', this.onLayerClick.bind(this), true );
	//this.transform( this.targets.helix, 2000 );

	},

	onLayerClick:function(e){
		console.log("click")


	},
	setOrientationControls:function(e){
		//console.log(e);
		 if (!e.alpha) {
          return;
        }

        this.controls = new THREE.DeviceOrientationControls(this.camera, true);
        this.controls.connect();
        this.controls.update();
  			window.removeEventListener('deviceorientation', this.setOrientationControls.bind(this), true);

	},

     transform:function( targets, duration ) {


     	  var allMoves = [];
        TWEEN.removeAll();

      for ( var k = 0; k < this.objects.length; k ++ ) {


          var object = this.objects[ k ];
          var target = targets[ k ];

          //console.log(target.position.x);
          var movePos = new TWEEN.Tween( object.position )
            .to( { x: target.position.x, y: target.position.y, z: target.position.z }, Math.random() * duration + duration )
            .easing( TWEEN.Easing.Exponential.InOut )
            .onUpdate( ( function(){  } ).bind(this) );
            //.start();



          var rotatePos = new TWEEN.Tween( object.rotation )
            .to( { x: target.rotation.x, y: target.rotation.y, z: target.rotation.z }, Math.random() * duration + duration )
            .easing( TWEEN.Easing.Exponential.InOut )
            .onComplete((function(){ }).bind(this));
            //.start();

            allMoves.push(movePos,rotatePos);


        }

        for(var l = 0;l<allMoves.length;l++){
        	allMoves[l].start();
        }

/*
          new TWEEN.Tween( this )
          .to( {}, duration * 2 )
          .onUpdate( this.render )
          .start();
*/

    },

	onWindowResize:function() {

				this.camera.aspect = window.innerWidth / window.innerHeight;
				this.camera.updateProjectionMatrix();
				this.renderer.setSize( window.innerWidth, window.innerHeight );
				this.render();
			},


	animate:function(){
		requestAnimationFrame( this.animate.bind(this) );
        TWEEN.update();
       //console.log(this.mobile);
       if(this.mobile == false){ this.controls.update(); }// need it for trackball control, only for desktop, because controls.update() is called in the motion device

      	this.render();
	},

	render:function(){
		this.renderer.render( this.scene, this.camera );
	}

}
