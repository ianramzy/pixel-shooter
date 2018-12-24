package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class Bullet extends MovieClip
   {
       
      
      var dx = 0;
      
      var dy = 0;
      
      public function Bullet(param1:*, param2:*, param3:*, param4:*)
      {
         super();
         x = param1;
         y = param2;
         this.dx = 8;
         this.dy = 0;
         rotation = param4;
         this.addEventListener(Event.ENTER_FRAME,this.moveMe);
      }
      
      function moveMe(param1:Event) : *
      {
         this.x = this.x + this.dx;
         this.y = this.y + this.dy;
         if(this.x < 0 || this.x > stage.stageWidth || this.y < 0 || this.y > stage.stageHeight)
         {
            this.remove();
         }
         else if(this.dx == 0 && this.dy == 0)
         {
            this.remove();
         }
      }
      
      public function remove() : *
      {
         this.removeEventListener(Event.ENTER_FRAME,this.moveMe);
         parent.removeChild(this);
      }
   }
}
