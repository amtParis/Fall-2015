var World = function(x,y,ctx){
    this.x = x;
    this.y = y;
    this.ctx = ctx;
    
    this.isTouched = false;
    
    this.image = new Image();
    this.image.src = 'data/dirt.jpg';
    
    //Words part
    this.allWords = [];
    this.nbr = 20;
    
    this.createAllWords();
}

World.prototype = {

    display:function(){
        this.ctx.drawImage(this.image,0,0,this.image.width,this.image.height,this.x,this.y,this.image.width,this.image.height);
        
        for(var i = 0;i< this.allWords.length;i++){
            
            this.allWords[i].x = this.x + this.allWords[i].originalX;
            this.allWords[i].y = this.y + this.allWords[i].originalY;
            
            this.allWords[i].display();
        }
    
    },
    
    createAllWords:function(){
        for(var i = 0;i<this.nbr;i++){
            var myWord = new Word(Math.random()*window.innerWidth,Math.random()*window.innerHeight,this.ctx);
            this.allWords.push(myWord);
        }
    },
    
    checkWords:function(x,y){
        
        for(var i = 0;i< this.allWords.length;i++){
            if(this.allWords[i].check(x,y)){
                return true;
            }
        }
        return false;
    },
    unsetWords:function(){
        for(var i = 0;i< this.allWords.length;i++){
            this.allWords[i].isDragged = false;
        }
    },
    
    moveWords:function(diffX,diffY){
        
        for(var i = 0;i< this.allWords.length;i++){
            if(this.allWords[i].isDragged){
                console.log("should move number",diffX,diffY);
                this.allWords[i].originalX+=diffX;
                this.allWords[i].originalY+=diffY;
            }
        }
    }
    
}