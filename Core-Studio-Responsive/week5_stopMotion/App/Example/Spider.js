var Spider = function (x,y,ctx,json,image){
    this.x = x;
    this.y = y;
    this.ctx = ctx;
    this.w = Math.random()*10 + 5; //random value between 5 and 15. This is used in the square example
    this.h = Math.random()*10 + 5; //random value between 5 and 15. This is used in the square example
    
    this.json = json;
    this.image = image;
    this.counter = 0;
}


Spider.prototype = {
    
    update:function(){
       
        if(this.counter>= this.json.frames.length-1){
            this.counter = 0;
        }else{
            this.counter++;
        }
    },
    

    display:function(){
      
        
        var _x = this.json.frames[this.counter].frame.x;
        var _y = this.json.frames[this.counter].frame.y;
        var _w = this.json.frames[this.counter].frame.w;
        var _h = this.json.frames[this.counter].frame.h;
        
        this.ctx.drawImage(this.image,_x,_y,_w,_h,this.x,this.y, _w,_h);
       
        /*
        this.ctx.fillStyle = '#d11168';
        this.ctx.beginPath();
        this.ctx.rect(this.x, this.y,this.w,this.h);
        this.ctx.fill();
        this.ctx.closePath();
         */
    },
    
    move:function(){}
    
}