var Spider = function(x,y,ctx,image,json){

	this.x = x;
	this.y = y;
	this.ctx = ctx;
	this.image = image;
	this.json = json;

	this.counter = 0;
	this.speedY = Math.floor(Math.random()*2)+2;
    this.rotation = 45-Math.random()*90;

}

Spider.prototype = {

	update:function(){

		if(this.y<-160){
			this.y =window.innerHeight+160;
		}else{
			this.y-=this.speedY;
		}
        
		 if(this.counter>=this.json.frames.length-1){
            this.counter = 0;
        }else{
            this.counter++;
        }
        
	},

	draw:function(){

		var px = this.json.frames[this.counter].frame.x;
        var py = this.json.frames[this.counter].frame.y;
        var w = this.json.frames[this.counter].frame.w;
        var h = this.json.frames[this.counter].frame.h;
        
        this.ctx.save();
        this.ctx.translate(this.x,this.y);
        this.ctx.rotate(this.rotation * Math.PI/180);
        this.ctx.drawImage(this.image,px,py,w,h,this.x-w/2,this.y-h/2,w,h);
        this.ctx.restore();
	}
}