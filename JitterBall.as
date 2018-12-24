package
{
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class JitterBall extends Sprite
   {
       
      
      public function JitterBall()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.added);
      }
      
      private function added(param1:Event) : *
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.added);
         addEventListener(Event.ENTER_FRAME,this.loop);
         addEventListener(Event.REMOVED_FROM_STAGE,this.removed);
      }
      
      private function loop(param1:Event) : *
      {
         var _loc2_:* = parent.mouseX - x;
         var _loc3_:* = parent.mouseY - y;
         var _loc4_:* = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
         if(_loc4_ < 40)
         {
            scaleX = scaleY = 1 + (40 - _loc4_) / 40;
         }
         else
         {
            scaleX = scaleY = 1;
         }
      }
      
      private function removed(param1:Event) : *
      {
         removeEventListener(Event.ENTER_FRAME,this.loop);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.removed);
      }
   }
}
