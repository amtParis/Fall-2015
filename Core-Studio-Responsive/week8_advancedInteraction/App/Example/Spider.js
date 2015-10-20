var Spider = function (x,y,ctx,json,image){
    this.x = x;
    this.y = y;
    this.ctx = ctx;
    this.w = Math.random()*10 + 5; //random value between 5 and 15. This is used in the square example
    this.h = Math.random()*10 + 5; //random value between 5 and 15. This is used in the square example
    
    this.json = json;
    this.image = image;
    this.counter = 0;
   
    this.curvyMove = true;
    if(this.curvyMove){
        this.speeds = [2,3,4,-2,-3,-4];
        this.speedX =  this.speeds[Math.floor(Math.random()*this.speeds.length)]*0.6;
        this.speedY = this.speeds[Math.floor(Math.random()*this.speeds.length)]*0.6;
    }else{
        this.speedX = 2-Math.random()*4;
        this.speedY = 2-Math.random()*4;
    }
  
    
    this.oldX = x;
    this.oldY = y;
    this.angle;
   
    this.c=Math.floor(Math.random()*100);
    this.amplitude =1+ Math.random()*4;
    
    this.matrix=[1,0,0,1,0,0];
    this.touched = false;
    this.isSliding = null;
    this.isSlidingY = null;
    this.fallSpeed = Math.random()*2 +1;
    
    
    this.scream = document.createElement('audio');
     this.scream.src = 'data/out3.mp3';
    this.scream.preload = true;
    this.scream.loop = false;
    this.scream.load();
    this.isScreaming = false;
    document.body.appendChild( this.scream);
    
    this.splash = document.createElement('audio');
    this.splash.src = 'data/splash.mp3';
    this.splash.volume = 0.05;
    this.splash.preload = true;
    this.splash.loop = false;
    this.splash.load();
    document.body.appendChild( this.splash);
    
    
}


Spider.prototype = {
    
    update:function(){
       
        if(this.counter>= this.json.frames.length-1){
            this.counter = 0;
        }else if(!this.touched){
           
            this.counter++;
                
        }
        
        this.c+=1;
    },
    

    display:function(){
        
       
      
        
        var _x = this.json.frames[this.counter].frame.x;
        var _y = this.json.frames[this.counter].frame.y;
        var _w = this.json.frames[this.counter].frame.w;
        var _h = this.json.frames[this.counter].frame.h;
        
       this.ctx.save();
       this.ctx.translate(this.x,this.y);
       this.ctx.rotate(this.angle+Math.PI/2);//by default, our animation is vertical not horizontal. horizontal = 0
       this.ctx.drawImage(this.image,_x,_y,_w,_h,0-_w/2,0-_h/2, _w,_h);
       this.ctx.restore();
        
        
        /*
        if(this.touched){
            this.ctx.fillStyle = 'rgba(0,0,0,1)';
            this.ctx.beginPath();
            this.ctx.arc(this.x,this.y,20,0,2*Math.PI,true);
            this.ctx.closePath();
            this.ctx.fill();
        }
         */
        
        
      /*
        this.ctx.fillStyle = '#d11168';
        this.ctx.beginPath();
        this.ctx.rect(this.x, this.y,1,1);
        this.ctx.fill();
        this.ctx.closePath();
       */
    },
    
    check:function(x,y){
        
        var dist = this.getDistance(this.x,this.y,x,y);
        if(dist<100 && !this.touched){
            this.touched = true;
            this.splash.play();
        }
        
    },
    
    slide:function(val){
        //this.x+=val;
        this.isSliding = val* this.fallSpeed ;
        if( !this.isScreaming){
            this.isScreaming = true;
            this.scream.play();
        }
    },
    slideY:function(val){
        this.isSlidingY = val* this.fallSpeed ;
        if( !this.isScreaming){
            this.isScreaming = true;
            this.scream.play();
        }
    },
    /*
    translate:function(x,y){

        this.matrix[4] += this.matrix[0] * x + this.matrix[2] * y;
        this.matrix[5] += this.matrix[1] * x + this.matrix[3] * y;
        this.ctx.translate(x,y);

    },
    
    getXY:function(mouseX,mouseY){
    
        var newX = mouseX * this.matrix[0] + mouseY * this.matrix[2] + this.matrix[4];
        var newY = mouseX * this.matrix[1] + mouseY * this.matrix[3] + this.matrix[5];
        return({x:newX,y:newY});
    },
    */
    getDistance:function(x1,y1,x2,y2){
        return Math.sqrt( Math.pow((x1-x2), 2) + Math.pow((y1-y2), 2) );
    },
    
    move:function(){
        
        if(!this.touched){
        
            if(this.y<-160){
                this.y =window.innerHeight+160;
            }else{
                this.y-=this.speedY;
            }
            
            if(this.y>window.innerHeight+160){
                this.y =-160;
            }else{
                this.y-=this.speedY;
            }
            
            
            if(this.x<-160){
                this.x = window.innerWidth+160;
            }else{
               this.x-=this.speedX;
            }
            
            if(this.x>window.innerWidth+160){
                this.x =-160;
            }else{
                this.x-=this.speedX;
            }
            
            if(this.curvyMove){
                this.x -= Math.cos(this.c * Math.PI/180)* this.amplitude  ;
            }
            
            
            
            this.angle = this.getAngle(this.oldX,this.oldY,this.x,this.y);
            this.oldX = this.x;
            this.oldY = this.y;
            
            
        }else if(this.isSliding !=null){
        
            this.x+= this.isSliding;
            
            if(this.x>=window.innerWidth+500 || this.x<=-500){
                this.touched = false;
                this.isSliding = null;
                 this.isScreaming = false;
            }
            
        }else if(this.isSlidingY !=null){
            
            this.y-= this.isSlidingY;
            
            if(this.y>=window.innerHeight+500 || this.y<=-500){
                this.touched = false;
                this.isSlidingY = null;
                 this.isScreaming = false;
            }
        
        }
        
    },
    
    getAngle:function(x1, y1, x2, y2){
        var dx = x2 - x1;
        var dy = y2 - y1;
        
        return Math.atan2(dy,dx);
    }
    
}