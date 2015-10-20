var Spider = function (x,y,ctx,json,image){
    this.x = x;
    this.y = y;
    this.ctx = ctx;
    this.w = 5; //random value between 5 and 15. This is used in the square example
    this.h = 5; //random value between 5 and 15. This is used in the square example
    
    this.json = json;
    this.image = image;
    this.counter = 0;
    
    this.speedX = 0;//Math.random()*4+1;
    this.speedY = 1;
    this.height = this.json.frames[0].frame.h;
    this.width = this.json.frames[0].frame.w;
    
    this.speeds =[1,-1];
    //this.allowUsToChangeSpeed = true;
    
    this.inc = 0;
    this.limit = 10;
}


Spider.prototype = {
    
    update:function(){
       
        if(this.counter>= this.json.frames.length-1){
            this.counter = 0;
        }else{
            this.counter++;
        }
        
        this.inc++;
    },
    

    display:function(){
      
        
        var _x = this.json.frames[this.counter].frame.x;
        var _y = this.json.frames[this.counter].frame.y;
        var _w = this.json.frames[this.counter].frame.w;
        var _h = this.json.frames[this.counter].frame.h;
        
        //this.ctx.drawImage(this.image,_x,_y,_w,_h,this.x,this.y, _w,_h);
       
        
        this.ctx.fillStyle = 'black';
        this.ctx.beginPath();
        this.ctx.rect(this.x, this.y,this.w,this.h);
        this.ctx.fill();
        this.ctx.closePath();
         
    },
    
    move:function(){
        
        if(this.y<-this.height){
            this.y = window.innerHeight;
        }else{
            this.y-= this.speedY;
        }
        
        
        if(this.x < -this.width){
            this.x = window.innerWidth;
        }
        
        if(this.x > window.innerWidth){
            this.x = -this.width;
        }
        
         this.x-= this.speedX;
        
        
        
        
       /*
        if(this.y<window.innerHeight-100 && this.allowUsToChangeSpeed==true){
            this.speedY=0;
            //this.speedX=1;
            this.speedX = this.speeds[Math.round(Math.random())];
            this.allowUsToChangeSpeed = false;
        }
        
        if(this.x){}
        */
        
        
        if(this.inc%this.limit == 0){
            
            if(this.speedY!=0){
                this.speedY =0;
                this.speedX = this.speeds[Math.round(Math.random())];
            }else{
                this.speedX =0;
                this.speedY =1;
            }
            
        }
        //console.log(this.speedX);
        
        //this.y-=this.speed;
    }
    
}