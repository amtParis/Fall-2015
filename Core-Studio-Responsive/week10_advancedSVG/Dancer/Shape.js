var Shape = function(coordinates,ctx){
    this.ctx = ctx;
    this.coordinates = coordinates;
    
    //Other Global variables
    this.x = 0;
    this.y = 0;
    this.color = 'rgba(255,255,255,1)';
    this.strokeColor = 'rgba(255,255,255,1)';
    this.strokeWidth = 1;
    this.isMoving = false;
    
    this.movingRules;
    this.angle = 0;
    this.scale = 1;
    
    this.bounds = this.getBounds();
}


Shape.prototype ={
    
    setColor:function(color){
        this.color = color;
    },

    setStrokeColor:function(color){
        this.strokeColor = color;
    },
    
    setStrokeWidth:function(width){
        this.ctx.strokeWidth;
    },

    update:function(val){
        var v = val || 1;
        this.angle+=v;
    },
    
    getBounds:function(){
        var bounds = {"x":0,"y":0};
         for(var i=0;i<this.coordinates.length;i++){
              var XY = this.coordinates[i].split(",");
             if(XY[0]>bounds.x){
                 bounds.x =XY[0];
             }
             if(XY[1]>bounds.x){
                 bounds.x =XY[1];
             }
         }
        return bounds;
    },
    
    display:function(){
        this.ctx.beginPath();
        for(var i=0;i<this.coordinates.length;i++){
            var XY = this.coordinates[i].split(",");
            var x = (this.x + parseFloat(XY[0]))*this.scale;// - (this.x+this.bounds.x*this.scale)/2;
            var y = (this.y + parseFloat(XY[1]))*this.scale;// - (this.y+this.bounds.y*this.scale)/2;
            
            if(this.isMoving){
                
                for(var j = 0;j<this.movingRules.length;j++){
                    if( i>=this.movingRules[j].low && i<=this.movingRules[j].high ){
                        x = x + (Math.cos(this.angle*this.movingRules[j].xSpeed*Math.PI/180)*this.movingRules[j].xAmp)*this.scale;
                        y = y + (Math.sin(this.angle*this.movingRules[j].ySpeed*Math.PI/180)*this.movingRules[j].yAmp)*this.scale;
                    }
                }
                
            }
            
            
            //drawline
            if(i==0){
                this.ctx.moveTo(x,y);
            }else{
                this.ctx.lineTo(x,y);
            }
        }
        this.ctx.closePath();
        this.ctx.fillStyle = this.color;
        this.ctx.fill();
        this.ctx.lineWidth = this.strokeWidth;
        this.ctx.strokeStyle = this.strokeColor;
        this.ctx.stroke();
        
    },
    
debug:function(val){
    var v = val || 0;
    var XY = this.coordinates[v].split(",");
    var x = this.x + parseFloat(XY[0]);
    var y = this.y + parseFloat(XY[1]);
    this.ctx.beginPath();
    this.ctx.arc(x,y,3,0,Math.PI*2,true);
    this.ctx.closePath();
    this.ctx.fillStyle = '#00ff00';
    this.ctx.fill();
    
}

}