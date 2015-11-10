var Character = function(datas,ctx){
    this.ctx        = ctx;
    this.datas      = datas;
    this.allShapes  = [];
    this.scale      = 1;
    this.easing     = 0.1;
    this.vx         = 0.0;
    this.x          = 0;
    this.y          = 0;
    
    //this.init();
}

Character.prototype = {
    
    init:function(){
        var XYcoordinates;
        var shape;
        for(var i = 0; i < this.datas.length; i++){
            XYcoordinates   = this.datas[i].points.split(" ");
            shape           = new Shape(XYcoordinates,this.ctx);
            shape.scale     = this.scale;
            shape.setColor(this.datas[i].color);
            shape.setStrokeColor(this.datas[i].strokeColor);
            shape.setStrokeWidth(this.datas[i].strokeWidth);
            shape.movingRules = this.datas[i].movements;
            if(this.datas[i].movements != null){
                shape.isMoving = true;
            }
            this.allShapes.push(shape);
        }

    },
    
    scaleX:function(val){
        this.vx += (val-this.scale) * this.easing;
        this.vx *= 0.95;
        this.scale += this.vx;
    },

    display:function(){
        for(var i = 0;i<this.allShapes.length;i++){
            this.allShapes[i].x = this.x;
            this.allShapes[i].y = this.y;
            this.allShapes[i].scale = this.scale;
            this.allShapes[i].update();
            this.allShapes[i].display();
        }
    }
}