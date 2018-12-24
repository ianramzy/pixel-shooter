package pixelshooter_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.media.Sound;
   import flash.text.TextField;
   import flash.ui.Mouse;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var bgmusic:Sound;
      
      public var bullet:Bullet;
      
      public var backround:MovieClip;
      
      public var backround2:MovieClip;
      
      public var heart5move:Number;
      
      public var losesound:Sound;
      
      public var spawn2:Number;
      
      public var lives:Number;
      
      public var jetman:MovieClip;
      
      public var lasersound:Sound;
      
      public var heart4hit:Number;
      
      public var enemies:Array;
      
      public var mousepointer1:MovieClip;
      
      public var mousepointer2:MovieClip;
      
      public var numenemies2:Number;
      
      public var playbutton:SimpleButton;
      
      public var i:int;
      
      public var yspeed:Number;
      
      public var spawn:Number;
      
      public var heart4move:Number;
      
      public var heart5hit:Number;
      
      public var enemy:Enemy;
      
      public var score:Number;
      
      public var hit:Number;
      
      public var reload:int;
      
      public var enemy2:Enemy2;
      
      public var heart1:MovieClip;
      
      public var heart2:MovieClip;
      
      public var heart3:MovieClip;
      
      public var heart4:MovieClip;
      
      public var heart5:MovieClip;
      
      public var bullets:Array;
      
      public var keysDown:Array;
      
      public var scoretext:TextField;
      
      public var multiplier:Number;
      
      public var xspeed:Number;
      
      public var lightning:MovieClip;
      
      public var enemies2:Array;
      
      public var rot;
      
      public var replaybutton:SimpleButton;
      
      public var numenemies:Number;
      
      public var bbackround:MovieClip;
      
      public var i2:int;
      
      public var bbackround2:MovieClip;
      
      public var mousepointer:MovieClip;
      
      public var friction:Number;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3);
         addEventListener(Event.ADDED_TO_STAGE,this.__setPerspectiveProjection_);
      }
      
      public function movehearts(param1:Event) : void
      {
         if(this.score == 10)
         {
            this.heart4.x = 1080;
            this.heart4.y = 400;
            this.heart4move = 1;
         }
         if(this.heart4move == 1)
         {
            this.heart4.x = this.heart4.x - 16;
         }
         if(this.heart4.x <= -100)
         {
            this.heart4move = 0;
         }
         if(this.score == 24)
         {
            this.heart5.x = 1080;
            this.heart5.y = 200;
            this.heart5move = 1;
         }
         if(this.heart5move == 1)
         {
            this.heart5.x = this.heart5.x - 16;
         }
         if(this.heart5.x <= -100)
         {
            this.heart5move = 0;
         }
      }
      
      public function hitTest2(param1:Event) : void
      {
         for each(this.bullet in this.bullets)
         {
            if(this.bullet.parent == null)
            {
               this.bullets.splice(this.bullets.indexOf(this.bullet),1);
            }
            else
            {
               for each(this.enemy2 in this.enemies2)
               {
                  if(this.enemy2 != null && this.bullet.hitTestObject(this.enemy2))
                  {
                     this.enemies2.splice(this.enemies2.indexOf(this.enemy2),1);
                     this.enemy2.remove2();
                     this.score++;
                     this.multiplier = this.multiplier * 1.01;
                     this.scoretext.text = String(this.score);
                     this.enemy2 = null;
                     this.bullets.splice(this.bullets.indexOf(this.bullet),1);
                     this.bullet.remove();
                     this.hit = 1;
                     this.enemy2 = new Enemy2(Math.random() * stage.stageWidth,Math.random() * stage.stageHeight);
                     addChild(this.enemy2);
                     this.enemies2.push(this.enemy2);
                  }
               }
            }
         }
      }
      
      public function enemy2spawn(param1:Event) : void
      {
         this.spawn2 = this.spawn2 + this.multiplier;
         if(this.spawn2 > 1000)
         {
            this.enemy2 = new Enemy2(0,0);
            addChild(this.enemy2);
            this.enemies2.push(this.enemy2);
            this.spawn2 = 1;
         }
      }
      
      public function loop2(param1:Event) : *
      {
         var _loc2_:* = new drop();
         _loc2_.x = Math.random() * 1300;
         _loc2_.y = -10;
         _loc2_.rotation = 130;
         _loc2_.scale = _loc2_.scaleY = Math.random() * 0.6;
         _loc2_.ground = 500 + 60 * _loc2_.scaleX;
         addChild(_loc2_);
         _loc2_.addEventListener(Event.ENTER_FRAME,this.fall);
      }
      
      public function fall2(param1:Event) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = param1.currentTarget;
         _loc2_.x = _loc2_.x + 50 * _loc2_.scaleX * Math.cos(_loc2_.rotation / 180 * Math.PI);
         _loc2_.y = _loc2_.y + 100 * _loc2_.scaleX * Math.sin(_loc2_.rotation / 180 * Math.PI);
         if(_loc2_.y > 520)
         {
            _loc2_.y = _loc2_.ground;
            _loc3_ = new ripple();
            _loc3_.x = _loc2_.x;
            _loc3_.y = _loc2_.y;
            _loc3_.scaleX = _loc2_.scaleX;
            _loc3_.scaleY = _loc2_.scaleY / 3;
            addChild(_loc3_);
            _loc3_.addEventListener(Event.ENTER_FRAME,this.fade);
            _loc2_.removeEventListener(Event.ENTER_FRAME,this.fall);
            removeChild(_loc2_);
         }
      }
      
      public function checkHitship(param1:Event) : void
      {
         for each(this.enemy in this.enemies)
         {
            if(this.enemy.hitTestObject(this.jetman))
            {
               this.enemies.splice(this.enemies.indexOf(this.enemy),1);
               this.enemy.remove();
               this.enemy = null;
               this.lives--;
               if(this.lives == 4)
               {
                  this.heart5.visible = false;
               }
               if(this.lives == 3)
               {
                  this.heart4.visible = false;
               }
               if(this.lives == 2)
               {
                  this.heart3.visible = false;
               }
               if(this.lives == 1)
               {
                  this.heart2.visible = false;
               }
               if(this.lives == 0)
               {
                  for each(this.enemy in this.enemies)
                  {
                     this.enemy.remove();
                  }
                  for each(this.enemy2 in this.enemies2)
                  {
                     this.enemy2.remove2();
                  }
                  this.jetman.removeEventListener(Event.ENTER_FRAME,this.movejetman);
                  stage.removeEventListener(MouseEvent.CLICK,this.shootfun);
                  stage.removeEventListener(Event.ENTER_FRAME,this.hitTest);
                  stage.removeEventListener(Event.ENTER_FRAME,this.hitTest2);
                  stage.removeEventListener(Event.ENTER_FRAME,this.checkHitship);
                  stage.removeEventListener(Event.ENTER_FRAME,this.checkHitship2);
                  stage.removeEventListener(Event.ENTER_FRAME,this.enemyspawn);
                  stage.removeEventListener(Event.ENTER_FRAME,this.enemy2spawn);
                  stage.removeEventListener(Event.ENTER_FRAME,this.checkHitheart);
                  stage.removeEventListener(Event.ENTER_FRAME,this.checkHitheart2);
                  stage.removeEventListener(Event.ENTER_FRAME,this.movehearts);
                  for each(this.bullet in this.bullets)
                  {
                     this.bullet.remove();
                  }
                  this.losesound.play();
                  nextFrame();
                  return;
               }
            }
         }
      }
      
      public function fade2(param1:Event) : *
      {
         var _loc2_:* = param1.currentTarget;
         if(_loc2_.currentFrame == _loc2_.totalFrames)
         {
            _loc2_.removeEventListener(Event.ENTER_FRAME,this.fade);
            removeChild(_loc2_);
         }
      }
      
      public function __setPerspectiveProjection_(param1:Event) : void
      {
         root.transform.perspectiveProjection.fieldOfView = 86.850343;
         root.transform.perspectiveProjection.projectionCenter = new Point(275,200);
      }
      
      public function movejetman(param1:Event) : void
      {
         if(this.jetman.x < mouseX)
         {
            this.xspeed = this.xspeed + 3.6;
         }
         if(this.jetman.x > mouseX)
         {
            this.xspeed = this.xspeed + -3.6;
         }
         if(this.jetman.y < mouseY)
         {
            this.yspeed = this.yspeed + 3.6;
         }
         if(this.jetman.y > mouseY)
         {
            this.yspeed = this.yspeed + -3.6;
         }
         if(Math.abs(this.jetman.y - mouseY) < 3)
         {
            this.yspeed = 0;
         }
         if(Math.abs(this.jetman.x - mouseX) < 3)
         {
            this.xspeed = 0;
         }
         this.mousepointer.x = mouseX;
         this.mousepointer.y = mouseY;
         this.xspeed = this.xspeed * this.friction;
         this.yspeed = this.yspeed * this.friction;
         this.jetman.x = this.jetman.x + this.xspeed;
         this.jetman.y = this.jetman.y + this.yspeed;
         this.backround.x = this.backround.x - 2;
         this.backround2.x = this.backround2.x - 2;
         if(this.backround.x <= -1395)
         {
            this.backround.x = this.backround2.x + 1395;
         }
         if(this.backround2.x <= -1395)
         {
            this.backround2.x = this.backround.x + 1395;
         }
      }
      
      public function shootfun(param1:MouseEvent) : void
      {
         this.bullet = new Bullet(this.jetman.x + 40,this.jetman.y,20,90);
         stage.addChild(this.bullet);
         this.bullets.push(this.bullet);
         this.lasersound.play();
      }
      
      function frame1() : *
      {
         stop();
         addEventListener(Event.ENTER_FRAME,this.firstfunction);
         this.playbutton.addEventListener(MouseEvent.CLICK,this.correctfun);
         this.bgmusic = new bgMusic();
         this.bgmusic.play();
         this.lasersound = new Lasersound();
         this.losesound = new Losesound();
         addEventListener(Event.ENTER_FRAME,this.loop2);
      }
      
      function frame2() : *
      {
         stop();
         this.xspeed = 0;
         this.yspeed = 0;
         this.hit = 0;
         this.spawn = 2;
         this.heart4hit = 0;
         this.heart4move = 0;
         this.heart5hit = 0;
         this.heart5move = 0;
         this.spawn2 = 2;
         this.multiplier = 2;
         this.score = 0;
         this.numenemies = 2;
         this.numenemies2 = 2;
         this.lives = 3;
         this.friction = 0.88;
         this.enemies = new Array();
         this.enemy = null;
         this.enemies2 = new Array();
         this.enemy2 = null;
         this.bullet = null;
         this.bullets = new Array();
         this.rot = 0;
         this.keysDown = new Array();
         this.reload = 10;
         Mouse.hide();
         this.jetman.addEventListener(Event.ENTER_FRAME,this.movejetman);
         this.i = 0;
         while(this.i < this.numenemies)
         {
            this.enemy = new Enemy(0,0);
            addChild(this.enemy);
            this.enemies.push(this.enemy);
            this.i++;
         }
         this.i2 = 0;
         while(this.i2 < this.numenemies2)
         {
            this.enemy2 = new Enemy2(0,0);
            addChild(this.enemy2);
            this.enemies2.push(this.enemy2);
            this.i2++;
         }
         stage.addEventListener(MouseEvent.CLICK,this.shootfun);
         stage.addEventListener(Event.ENTER_FRAME,this.hitTest);
         stage.addEventListener(Event.ENTER_FRAME,this.hitTest2);
         stage.addEventListener(Event.ENTER_FRAME,this.enemyspawn);
         stage.addEventListener(Event.ENTER_FRAME,this.enemy2spawn);
         stage.addEventListener(Event.ENTER_FRAME,this.checkHitheart);
         stage.addEventListener(Event.ENTER_FRAME,this.checkHitheart2);
         stage.addEventListener(Event.ENTER_FRAME,this.movehearts);
         stage.addEventListener(Event.ENTER_FRAME,this.checkHitship);
         stage.addEventListener(Event.ENTER_FRAME,this.checkHitship2);
         addEventListener(Event.ENTER_FRAME,this.loop);
      }
      
      function frame3() : *
      {
         stop();
         addEventListener(Event.ENTER_FRAME,this.firstfunction2);
         this.replaybutton.addEventListener(MouseEvent.CLICK,this.correctfun2);
      }
      
      public function fade(param1:Event) : *
      {
         var _loc2_:* = param1.currentTarget;
         if(_loc2_.currentFrame == _loc2_.totalFrames)
         {
            _loc2_.removeEventListener(Event.ENTER_FRAME,this.fade);
            removeChild(_loc2_);
         }
      }
      
      public function firstfunction(param1:Event) : void
      {
         this.bbackround.x = this.bbackround.x - 2;
         this.bbackround2.x = this.bbackround2.x - 2;
         if(this.bbackround.x <= -1395)
         {
            this.bbackround.x = this.bbackround2.x + 1395;
         }
         if(this.bbackround2.x <= -1395)
         {
            this.bbackround2.x = this.bbackround.x + 1395;
         }
         this.mousepointer1.x = mouseX;
         this.mousepointer1.y = mouseY;
      }
      
      public function fall(param1:Event) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = param1.currentTarget;
         _loc2_.x = _loc2_.x + 50 * _loc2_.scaleX * Math.cos(_loc2_.rotation / 180 * Math.PI);
         _loc2_.y = _loc2_.y + 100 * _loc2_.scaleX * Math.sin(_loc2_.rotation / 180 * Math.PI);
         if(_loc2_.y > 520)
         {
            _loc2_.y = _loc2_.ground;
            _loc3_ = new ripple();
            _loc3_.x = _loc2_.x;
            _loc3_.y = _loc2_.y;
            _loc3_.scaleX = _loc2_.scaleX;
            _loc3_.scaleY = _loc2_.scaleY / 3;
            addChild(_loc3_);
            _loc3_.addEventListener(Event.ENTER_FRAME,this.fade);
            _loc2_.removeEventListener(Event.ENTER_FRAME,this.fall);
            removeChild(_loc2_);
         }
      }
      
      public function loop(param1:Event) : *
      {
         var _loc2_:* = new drop();
         _loc2_.x = Math.random() * 1300;
         _loc2_.y = -10;
         _loc2_.rotation = 130;
         _loc2_.scale = _loc2_.scaleY = Math.random() * 0.6;
         _loc2_.ground = 500 + 60 * _loc2_.scaleX;
         addChild(_loc2_);
         _loc2_.addEventListener(Event.ENTER_FRAME,this.fall);
      }
      
      public function firstfunction2(param1:Event) : void
      {
         this.bbackround.x = this.bbackround.x - 2;
         this.bbackround2.x = this.bbackround2.x - 2;
         if(this.bbackround.x <= -1395)
         {
            this.bbackround.x = this.bbackround2.x + 1395;
         }
         if(this.bbackround2.x <= -1395)
         {
            this.bbackround2.x = this.bbackround.x + 1395;
         }
         this.mousepointer2.x = mouseX;
         this.mousepointer2.y = mouseY;
      }
      
      public function checkHitheart(param1:Event) : void
      {
         if(this.heart4.hitTestObject(this.jetman))
         {
            if(this.heart4hit == 0)
            {
               this.lives++;
               this.heart4hit = 1;
               if(this.lives == 2)
               {
                  this.heart2.visible = true;
                  this.heart4.x = 0;
                  this.heart4.y = -50;
               }
               if(this.lives == 3)
               {
                  this.heart3.visible = true;
                  this.heart4.x = 0;
                  this.heart4.y = -50;
               }
               if(this.lives == 4)
               {
                  this.heart4.visible = true;
                  this.heart4.x = 222;
                  this.heart4.y = 571;
                  this.heart4move = 0;
               }
            }
         }
      }
      
      public function hitTest(param1:Event) : void
      {
         for each(this.bullet in this.bullets)
         {
            if(this.bullet.parent == null)
            {
               this.bullets.splice(this.bullets.indexOf(this.bullet),1);
            }
            else
            {
               for each(this.enemy in this.enemies)
               {
                  if(this.enemy != null && this.bullet.hitTestObject(this.enemy))
                  {
                     this.enemies.splice(this.enemies.indexOf(this.enemy),1);
                     this.enemy.remove();
                     this.score++;
                     this.multiplier = this.multiplier * 1.01;
                     this.scoretext.text = String(this.score);
                     this.enemy = null;
                     this.bullets.splice(this.bullets.indexOf(this.bullet),1);
                     this.bullet.remove();
                     this.hit = 1;
                     this.enemy = new Enemy(Math.random() * stage.stageWidth,Math.random() * stage.stageHeight);
                     addChild(this.enemy);
                     this.enemies.push(this.enemy);
                  }
               }
            }
         }
      }
      
      public function correctfun(param1:MouseEvent) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.firstfunction);
         this.playbutton.removeEventListener(MouseEvent.CLICK,this.correctfun);
         gotoAndStop(2);
      }
      
      public function checkHitheart2(param1:Event) : void
      {
         if(this.heart5.hitTestObject(this.jetman))
         {
            if(this.heart5hit == 0)
            {
               this.heart5.y = -200;
               this.lives++;
               this.heart5hit = 1;
               if(this.lives == 2)
               {
                  this.heart2.visible = true;
                  this.heart5.x = 0;
                  this.heart5.y = -50;
               }
               if(this.lives == 3)
               {
                  this.heart3.visible = true;
                  this.heart5.x = 0;
                  this.heart5.y = -50;
               }
               if(this.lives == 4)
               {
                  this.heart4.visible = true;
                  this.heart4.x = 222;
                  this.heart4.y = 571;
                  this.heart4move = 0;
               }
               if(this.lives == 5)
               {
                  this.heart5move = 0;
                  this.heart5.visible = true;
                  this.heart5.x = 291;
                  this.heart5.y = 571;
               }
            }
         }
      }
      
      public function checkHitship2(param1:Event) : void
      {
         for each(this.enemy2 in this.enemies2)
         {
            if(this.enemy2.hitTestObject(this.jetman))
            {
               this.enemies2.splice(this.enemies2.indexOf(this.enemy2),1);
               this.enemy2.remove2();
               this.enemy2 = null;
               this.lives--;
               if(this.lives == 4)
               {
                  this.heart5.visible = false;
               }
               if(this.lives == 3)
               {
                  this.heart4.visible = false;
               }
               if(this.lives == 2)
               {
                  this.heart3.visible = false;
               }
               if(this.lives == 1)
               {
                  this.heart2.visible = false;
               }
               if(this.lives == 0)
               {
                  for each(this.enemy2 in this.enemies2)
                  {
                     this.enemy2.remove2();
                  }
                  for each(this.enemy in this.enemies)
                  {
                     this.enemy.remove();
                  }
                  this.jetman.removeEventListener(Event.ENTER_FRAME,this.movejetman);
                  stage.removeEventListener(MouseEvent.CLICK,this.shootfun);
                  stage.removeEventListener(Event.ENTER_FRAME,this.hitTest);
                  stage.removeEventListener(Event.ENTER_FRAME,this.hitTest2);
                  stage.removeEventListener(Event.ENTER_FRAME,this.checkHitship);
                  stage.removeEventListener(Event.ENTER_FRAME,this.checkHitship2);
                  stage.removeEventListener(Event.ENTER_FRAME,this.enemyspawn);
                  stage.removeEventListener(Event.ENTER_FRAME,this.enemy2spawn);
                  stage.removeEventListener(Event.ENTER_FRAME,this.checkHitheart);
                  stage.removeEventListener(Event.ENTER_FRAME,this.checkHitheart2);
                  stage.removeEventListener(Event.ENTER_FRAME,this.movehearts);
                  this.losesound.play();
                  for each(this.bullet in this.bullets)
                  {
                     this.bullet.remove();
                  }
                  nextFrame();
                  return;
               }
            }
         }
      }
      
      public function enemyspawn(param1:Event) : void
      {
         this.spawn = this.spawn + this.multiplier;
         if(this.spawn > 1000)
         {
            this.enemy = new Enemy(0,0);
            addChild(this.enemy);
            this.enemies.push(this.enemy);
            this.spawn = 1;
         }
      }
      
      public function correctfun2(param1:MouseEvent) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.firstfunction2);
         this.replaybutton.removeEventListener(MouseEvent.CLICK,this.correctfun2);
         gotoAndStop(2);
      }
   }
}
