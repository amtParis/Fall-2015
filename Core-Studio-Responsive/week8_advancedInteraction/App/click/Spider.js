var Spider = function(x,y,ctx,json,image){
    this.x=x;
    this.y=y;
    this.ctx=ctx;
    this.w = Math.random()*10+5;
    this.h = Math.random()*10+5;
    this.json = json;
    this.image = image;
    this.counter = 0;
    this.speed = Math.random()*4+1; //random value between 1 and 5
    //this.height = this.json.frames[0].frame.h;
    this.width = this.json.frames[0].frame.w;
    console.log(this.json.frames.length);
}
Spider.prototype = {
update:function(){
    if(this.counter>=this.json.frames.length-1){
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
    // this.ctx.drawImage(this.image, _x,_y,_w,_h, this.x, this.y,_w,_h);
   
    
    this.ctx.fillStyle = '#d11168';
    this.ctx.beginPath();
    this.ctx.rect(this.x, this.y,this.w,this.h);
    this.ctx.fill();
    this.ctx.closePath();
},
    //move:function(){
    //if(this.y<-this.height){
    //  this.y = window.innerHeight;
    //}else{
    // this.y-=this.speed;
    // }
    //}
move:function(){
    if(this.x<-this.width){
        this.x = window.innerWidth;
    }else{
        this.x-=this.speed;
    }
}
}