var Spider = function(x,y,ctx,image,json){

	this.x = x;
	this.y = y;
	this.ctx = ctx;
	this.image = image;
	this.json = json;

	this.counter = 0;
	this.speedY = Math.floor(Math.random()*2)+2;
    this.rotation = 45-Math.random()*90;
    this.color = 'rgb(0,0,0)';
   
    //spiral stuff
    this._angle = 0;
    this.radius= 0;
    
    this.oldX = x;
    this.oldY = y;

}

Spider.prototype = {

	update:function(){
        if(this.counter>=this.json.frames.length-1){
            this.counter = 0;
        }else{
            this.counter++;
        }
        
        this._angle++;
        this.radius+=0.001;
        
	},

	draw:function(){
      
		var px = this.json.frames[this.counter].frame.x;
        var py = this.json.frames[this.counter].frame.y;
        var w = this.json.frames[this.counter].frame.w;
        var h = this.json.frames[this.counter].frame.h;
        
        this.ctx.save();
        this.ctx.translate(this.x,this.y);
        this.ctx.rotate(this.angle+Math.PI/2);
       // this.ctx.drawImage(this.image,px,py,w,h,-w/2,-h/2,w,h);
        this.ctx.restore();
      
    
        this.ctx.beginPath();
        this.ctx.fillStyle = this.color;
        this.ctx.fillRect(this.x,this.y,5,5);
        this.ctx.closePath();
       
	},
    
    move:function(){
        /*
        if(this.y<-160){
            this.y =window.innerHeight+160;
        }else{
            this.y-=this.speedY;
        }
         
        */
        
        this.x+= Math.cos(this._angle*Math.PI/180)*this.radius;
        this.y+= Math.sin(this._angle*Math.PI/180)*this.radius;
        
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