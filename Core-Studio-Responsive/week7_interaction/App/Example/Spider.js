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
}


Spider.prototype = {
    
    update:function(){
       
        if(this.counter>= this.json.frames.length-1){
            this.counter = 0;
        }else{
            this.counter++;
        }
        
        this.c+=1;
    },
    

    display:function(){
      
        
        var _x = this.json.frames[this.counter].frame.x;
        var _y = this.json.frames[this.counter].frame.y;
        var _w = this.json.frames[this.counter].frame.w;
        var _h = this.json.frames[this.counter].frame.h;
        
       // this.ctx.save();
       // this.ctx.translate(this.x,this.y);
       // this.ctx.rotate(this.angle+Math.PI/2);//by default, our animation is vertical not horizontal. horizontal = 0
        this.ctx.drawImage(this.image,_x,_y,_w,_h,0,0, _w,_h);
       // this.ctx.restore();
      /*
        this.ctx.fillStyle = '#d11168';
        this.ctx.beginPath();
        this.ctx.rect(this.x, this.y,1,1);
        this.ctx.fill();
        this.ctx.closePath();
       */
    },
    
    move:function(){
        
        
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
        
    },
    
    getAngle:function(x1, y1, x2, y2){
        var dx = x2 - x1;
        var dy = y2 - y1;
        
        return Math.atan2(dy,dx);
    }
    
}