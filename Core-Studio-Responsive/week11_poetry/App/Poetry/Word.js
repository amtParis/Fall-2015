var Word = function(x,y,ctx){
    
    this.originalX = x;
    this.originalY = y;
    
    this.x = x;
    this.y = y;
    this.ctx = ctx;
    
    //example
    this.width = 100;
    this.height = 50;
    this.color = '#ff0000';
}

Word.prototype = {

    display:function(){
        this.ctx.beginPath();
        this.ctx.fillStyle = this.color;
        this.ctx.fillRect(this.x,this.y,this.width,this.height);
    }
    
}