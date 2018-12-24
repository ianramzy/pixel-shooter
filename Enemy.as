package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class Enemy extends MovieClip
   {
       
      
      private var dx = -5;
      
      private var dy = 0;
      
      public function Enemy(param1:Number, param2:Number)
      {
         super();
         this.addEventListener(Event.ENTER_FRAME,this.moveMe);
         this.x = 1200;
         this.y = Math.random() * 600;
      }
      
      function moveMe(param1:Event) : *
      {
         x = x + this.dx;
         y = y + this.dy;
         if(x < -100)
         {
            x = x + 1200;
         }
         if(y < 0)
         {
            y = y + stage.stageHeight;
         }
         if(y > stage.stageHeight)
         {
            y = y - stage.stageHeight;
         }
      }
      
      public function remove() : *
      {
         parent.removeChild(this);
         this.removeEventListener(Event.ENTER_FRAME,this.moveMe);
      }
   }
}
