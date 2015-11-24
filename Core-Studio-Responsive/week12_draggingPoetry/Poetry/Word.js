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
    
    this.isDragged = false;
}

Word.prototype = {

    display:function(){
        this.ctx.beginPath();
        this.ctx.fillStyle = this.color;
        this.ctx.fillRect(this.x,this.y,this.width,this.height);
    },
    
    check:function(x,y){
    
        if(x>=this.x && x<=this.x+this.width && y>=this.y && y<=this.y+this.height){
            this.isDragged = true;
            return true;
        }
        return false;
    }
    
}