var Character = function(datas,ctx){
    this.ctx        = ctx;
    this.datas      = datas.points;
    this.allShapes  = [];
    this.scale      = 1;
    this.easing     = 0.1;
    this.vx         = 0.0;
    this.x          = 0;
    this.y          = 0;
    this.isShowing  = true;
    this.isout      = false;
    
    //this.init();
    
    //motion
    this.theta = Math.random()*Math.PI*2;
    this._vx = 0.0;
    this._vy = 0.0;
    this.drag = 0.92;
    this.wander = 0.15;
    
    this.name;
    this.finalScale  = 1;
    //ACTIVE ZONE FOR COLLISION DETECTION
    this.radius = 70;
    
    //SOUND STUFF
    this.audio = document.createElement('audio');
    this.audio.src = datas.sound;
    this.audio.preload = true;
    this.audio.loop = false;
    this.audio.load();
    document.body.appendChild(this.audio);
    this.isPlaying = false;

}

Character.prototype = {
    
    init:function(){
       // this.audio = sound;
        var XYcoordinates;
        var shape;
        for(var i = 0; i < this.datas.length; i++){
            XYcoordinates   = this.datas[i].points.split(" ");
            shape           = new Shape(XYcoordinates,this.ctx);
            shape.scale     = this.scale;
            shape.setColor(this.datas[i].color);
            shape.setStrokeColor(this.datas[i].strokeColor);
            shape.setStrokeWidth(this.datas[i].strokeWidth);
            shape.movingRules = this.datas[i].movements;
            if(this.datas[i].movements != null){
                shape.isMoving = true;
            }
            this.allShapes.push(shape);
        }
        this.audio.play();
    },
    
    scaleX:function(val){
        this.vx += (val-this.scale) * this.easing;
        this.vx *= 0.95;
        this.scale += this.vx;
    },

    display:function(){
        //console.log(this.x,this.y);
        for(var i = 0;i<this.allShapes.length;i++){
            this.allShapes[i].x = this.x;
            this.allShapes[i].y = this.y;
            this.allShapes[i].scale = this.scale;
            this.allShapes[i].update();
            this.allShapes[i].display();
        }
        
        //show collision area around the shape
       /*
        this.ctx.beginPath();
        this.ctx.fillStyle = 'rgba(255,0,0,0.05)';
        this.ctx.arc(this.x,this.y,this.radius*this.finalScale,0,Math.PI*2,true);
        this.ctx.fill();
        this.ctx.closePath();
        */
        
        //this.allShapes[0].debug(23);
        //this.allShapes[0].debug(24);
    },
    move:function(){
        this.x += this._vx;
        this.y += this._vy;
        
        this._vx *= this.drag;
        this._vy *= this.drag;
        
        this.theta += this.randomFloat( -0.5, 0.5 ) * this.wander;
        this._vx += Math.sin( this.theta ) * 0.1;
        this._vy += Math.cos( this.theta ) * 0.1;
        
        if(this.x<-100 || this.x>window.innerWidth+100 || this.y<-100 || this.y>window.innerHeight+100){
            this.isout = true;
        }
       
    },
    randomFloat:function(min,max)
    {
        //return Math.random()*(max-min+1)+min;
        return Math.random()*(max-min)+min;
    },
    checkCollision:function(allCharacters){
        for(var i=0;i<allCharacters.length;i++){
            var dist = this.getDistance(this.x,this.y,allCharacters[i].x,allCharacters[i].y);
            if((dist-(allCharacters[i].radius*allCharacters[i].finalScale))<(this.radius*this.finalScale) && dist != 0 &&  !this.isPlaying){
                //PLAY SOUND
                console.log("should play sound");
                
               // this.isPlaying = true;
                break;
            }
        }
    },
    getDistance:function(x1,y1,x2,y2){
        return Math.sqrt( Math.pow((x1-x2), 2) + Math.pow((y1-y2), 2) );
    },
    
}