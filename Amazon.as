package
	{
	import flash.display.*;
	import flash.display.MovieClip;	
	import flash.events.*;
	import flash.ui.Keyboard; 
	import flash.display.DisplayObject;
	
	public class Amazon extends MovieClip
		{
		private var	displayMe:Boolean=false;	
		private var gPressed:Boolean=false;
		private var lPressed:Boolean=false;
		private var kPressed:Boolean=false;	
		private var upPressed:Boolean=false;	
		private var bothPressed:Boolean=true;	
		private var wPressed:Boolean=false;
		private var fPressed:Boolean=false;
		private var fight:Boolean=false;
		private var pressMe:Boolean=false; // Variable to allow animation to keep playing if button is held down
		
		
		public function Amazon(t:Stage)
			{
			addEventListener(Event.ENTER_FRAME,newFrame);
			addEventListener(Event.ENTER_FRAME,listenersMove);
			function listenersMove(e:Event):void
				{
				t.addEventListener(KeyboardEvent.KEY_DOWN,block);	
				t.addEventListener(KeyboardEvent.KEY_DOWN,superMove);
				t.addEventListener(KeyboardEvent.KEY_UP,onFrame);
				t.addEventListener(KeyboardEvent.KEY_DOWN,walkAmazon);	
				t.addEventListener(KeyboardEvent.KEY_DOWN,greatArrow);	
				t.addEventListener(KeyboardEvent.KEY_DOWN,jabYou);	
				t.addEventListener(KeyboardEvent.KEY_DOWN,twirl);	
				displayMe=MovieClip(root).gamesOverNow;
				if(displayMe==true)
					{
					t.removeEventListener(KeyboardEvent.KEY_DOWN,block);		
					removeEventListener(Event.ENTER_FRAME,listenersMove);
					t.removeEventListener(KeyboardEvent.KEY_DOWN,superMove);
					t.removeEventListener(KeyboardEvent.KEY_UP,onFrame);
					t.removeEventListener(KeyboardEvent.KEY_DOWN,walkAmazon);	
					t.removeEventListener(KeyboardEvent.KEY_DOWN,greatArrow);	
					t.removeEventListener(KeyboardEvent.KEY_DOWN,jabYou);	
					t.removeEventListener(KeyboardEvent.KEY_DOWN,twirl);	
					}	
				}
			}

////////////////////////////////////////////////////////////////////////////////
//Events called when no keys are pressed and onEnterFrame
////////////////////////////////////////////////////////////////////////////////

		private function newFrame(e:Event):void
			{
			if(displayMe==true)
				{
				removeEventListener(Event.ENTER_FRAME,newFrame);
				}				
			if(MovieClip(root).newAmazon.currentLabel=="stance")
				{
				fight=false;
				}
			}
		
		private function onFrame(e:KeyboardEvent):void
			{
			fPressed =false;						
			wPressed =false;
			bothPressed=true;
			kPressed=false;
			upPressed=false;
			pressMe=false;
			lPressed=false;
			gPressed=false;
			MovieClip(root).pressedLNow2=false;
			MovieClip(root).pressedRNow2=false;
			
			if(MovieClip(root).P2Me1==true && MovieClip(root).gScreenTimer.text!="99")
				{	
				if(e.keyCode== 83)
					{
		   			MovieClip(root).newAmazon.gotoAndPlay("stance");
           	 		}
				}
			else if(MovieClip(root).P2Me2==true && MovieClip(root).gScreenTimer.text!="99")
				{
				if(e.keyCode== Keyboard.DOWN)
					{
		   			MovieClip(root).newAmazon.gotoAndPlay("stance");
					}
				}
			if(fight == false && MovieClip(root).newAmazon.currentLabel!="damage")
				{
				MovieClip(root).newAmazon.gotoAndStop("stance");
				}
			}	
			
///////////////////////////////////////////////////////////////////////////////
//Walking Code for Left and Right Sides of Stage
///////////////////////////////////////////////////////////////////////////////

		private function walkAmazon(e:KeyboardEvent):void	
			{
			if(MovieClip(root).P2Me1==true && MovieClip(root).gScreenTimer.text!="99" && MovieClip(root).gamesOverNow==false)
				{
				if(fight == false && MovieClip(root).newAmazon.currentLabel!="damage")
					{
					if(e.keyCode== 65 || MovieClip(root).pressedLNow2==true && MovieClip(root).pressedLNow==true || MovieClip(root).pressedLNow2==true && MovieClip(root).pressedRNow==true)
						{
						MovieClip(root).newAmazon.x -= 10;
						MovieClip(root).pressedLNow2=true;
						if(pressMe==false)
							{
							pressMe=true;
							MovieClip(root).newAmazon.x -= 10;
							MovieClip(root).newAmazon.gotoAndPlay("amwalk");
							}
						}
					else if(e.keyCode==68 || MovieClip(root).pressedRNow2==true && MovieClip(root).pressedRNow==true || MovieClip(root).pressedRNow2==true && MovieClip(root).pressedLNow==true )
						{
						MovieClip(root).newAmazon.x += 10;
						MovieClip(root).pressedRNow2=true;
         	 			if(pressMe==false)
							{
							MovieClip(root).newAmazon.x += 10;
							pressMe=true;
							MovieClip(root).newAmazon.gotoAndPlay("amwalk");
							}
						}
					}
				}
				else if(MovieClip(root).P2Me2==true && MovieClip(root).gScreenTimer.text!="99" && MovieClip(root).gamesOverNow==false)
					{
					if(fight == false && MovieClip(root).newAmazon.currentLabel!="damage")
						{
						if(e.keyCode== Keyboard.LEFT || MovieClip(root).pressedLNow2==true && MovieClip(root).pressedLNow==true || MovieClip(root).pressedLNow2==true && MovieClip(root).pressedRNow==true )
							{
							MovieClip(root).newAmazon.x -= 10;
							MovieClip(root).pressedLNow2=true;
        				   	if(pressMe==false)
								{
								MovieClip(root).newAmazon.x -= 10;
								pressMe=true;
								MovieClip(root).newAmazon.gotoAndPlay("amwalk");
								}
		   					}
						else if(e.keyCode== Keyboard.RIGHT || MovieClip(root).pressedRNow2==true && MovieClip(root).pressedRNow==true || MovieClip(root).pressedRNow2==true && MovieClip(root).pressedLNow==true)
							{
							MovieClip(root).newAmazon.x += 10;
							MovieClip(root).pressedRNow2=true;
           	 				if(pressMe==false)
								{
								MovieClip(root).newAmazon.x += 10;
								pressMe=true;
								MovieClip(root).newAmazon.gotoAndPlay("amwalk");
								}
							}
						}
					}
				}
			
			
//////////////////////////////////////////////////////////////////////////////////
//Character Moves and Cancels
/////////////////////////////////////////////////////////////////////////////////

		private function greatArrow(e:KeyboardEvent):void
			{
			if(MovieClip(root).P2Me1==true && MovieClip(root).gScreenTimer.text!="99")
				{	
				if(e.keyCode== 70 && pressMe==false && fight==false && MovieClip(root).begin2==false)
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{
						MovieClip(root).newAmazon.gotoAndPlay("attack1");
           	 			fight = true;
						pressMe=true;
						}
					}
				}
			else if(MovieClip(root).P2Me2==true && MovieClip(root).gScreenTimer.text!="99" && MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
				{
				if(e.keyCode== 75 && pressMe==false && fight==false && MovieClip(root).begin2==false)
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{
		   				MovieClip(root).newAmazon.gotoAndPlay("attack1");
           	 			fight = true;
						pressMe=true;
						}
					}
				}
			}
			
//////////////////////////////////////////////////////////////////////////////////

		private function jabYou(e:KeyboardEvent):void
			{
			if(MovieClip(root).P2Me1==true && MovieClip(root).gScreenTimer.text!="99" )
				{	
				if(e.keyCode== 71 && pressMe==false && fight==false && MovieClip(root).begin2==false ) 
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
		   				MovieClip(root).newAmazon.gotoAndPlay("attack2");
           	 			fight = true;
						pressMe=true;
						}
					}
				/*if(e.keyCode== 71 && pressMe==false && MovieClip(root).newTomoe.currentLabel=="damage" && MovieClip(root).twirlArrowCancel==true ) 
					{
		   			MovieClip(root).newAmazon.gotoAndPlay("attack2");
           	 		fight = true;
					pressMe=true;
					}*/
				if(e.keyCode== 71 && pressMe==false && MovieClip(root).newTomoe.currentLabel=="damage" && MovieClip(root).shootArrowCancel==true ) 
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
		   				MovieClip(root).newAmazon.gotoAndPlay("attack2");
           	 			fight = true;
						pressMe=true;
						}		
					}
				}
			else if(MovieClip(root).P2Me2==true && MovieClip(root).gScreenTimer.text!="99")
				{
				if(e.keyCode== 76 && pressMe==false && fight==false && MovieClip(root).begin2==false) 
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						MovieClip(root).newAmazon.gotoAndPlay("attack2");
           	 			fight = true;
						pressMe=true;
						}
					}
				/*if(e.keyCode== 76 && pressMe==false && MovieClip(root).newTomoe.currentLabel=="damage"  && MovieClip(root).twirlArrowCancel==true ) 
					{
		   			MovieClip(root).newAmazon.gotoAndPlay("attack2");
           	 		fight = true;
					pressMe=true;
					}*/	
					
				if(e.keyCode== 76 && pressMe==false && MovieClip(root).newTomoe.currentLabel=="damage" && MovieClip(root).shootArrowCancel==true ) 
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
		   				MovieClip(root).newAmazon.gotoAndPlay("attack2");
           	 			fight = true;
						pressMe=true;
						}	
					}
				}
			}

////////////////////////////////////////////////////////////////////////////////////

		private function block(e:KeyboardEvent):void
			{
			if(MovieClip(root).P2Me1==true && MovieClip(root).gScreenTimer.text!="99")
				{	
				if(e.keyCode== 83 && pressMe==false && fight==false && MovieClip(root).newAmazon.currentLabel!="damage")
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
		   				MovieClip(root).newAmazon.gotoAndPlay("block");
           	 			fight = true;
						pressMe=true;
						}
					}
				}
			else if(MovieClip(root).P2Me2==true && MovieClip(root).gScreenTimer.text!="99")
				{
				if(e.keyCode== Keyboard.DOWN && pressMe==false && fight==false && MovieClip(root).newAmazon.currentLabel!="damage")
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
		   				MovieClip(root).newAmazon.gotoAndPlay("block");
           	 			fight = true;
						pressMe=true;
						}
					}
				}
			}	
			
////////////////////////////////////////////////////////////////////////////////////

		private function twirl(e:KeyboardEvent):void
			{
			if(MovieClip(root).P2Me1==true && MovieClip(root).gScreenTimer.text!="99")
				{	
				if(e.keyCode== 70) 
					{
		   			fPressed =true;					
					}
				if(e.keyCode== 87)
					{
		   			wPressed =true;
					}
				
				if(wPressed==true && fPressed==true) 
					{
					bothPressed=false;
					}
					
				if(bothPressed==false && MovieClip(root).begin2==false && MovieClip(root).shootArrow==false && MovieClip(root).jabArrow==false)  
				 	{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						wPressed=false;
						fPressed=false;
						MovieClip(root).newAmazon.gotoAndPlay("attack3");
						fight = true;
						bothPressed=true;
						}
					}
				if(bothPressed==false && MovieClip(root).newTomoe.currentLabel=="damage" && MovieClip(root).shootArrowCancel==true)
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						wPressed=false;
						fPressed=false;
						MovieClip(root).newAmazon.gotoAndPlay("attack3");
						fight = true;
						bothPressed=true;
						}	
					}
				}
				
			else if(MovieClip(root).P2Me2==true && MovieClip(root).gScreenTimer.text!="99")
				{
				if(e.keyCode== 75)
					{
		   			kPressed =true;
					}
				if(e.keyCode== Keyboard.UP )
					{
		   			upPressed =true;
					}
					
				if(kPressed==true && upPressed==true) 
					{
					bothPressed=false;	
					}
				
				if(bothPressed==false && MovieClip(root).begin2==false && MovieClip(root).shootArrow==false && MovieClip(root).jabArrow==false)
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						kPressed=false;
						upPressed=false;	
						MovieClip(root).newAmazon.gotoAndPlay("attack3");
						fight = true;
						bothPressed=true;
						}
					}
				if(bothPressed==false && MovieClip(root).newTomoe.currentLabel=="damage" && MovieClip(root).shootArrowCancel==true)
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						kPressed=false;
						upPressed=false;
						MovieClip(root).newAmazon.gotoAndPlay("attack3");
						fight = true;
						bothPressed=true;
						}	
					}
				}
			}
			
///////////////////////////////////////////////////////////////////////////////////////////////////	

		private function superMove(e:KeyboardEvent):void
			{
			if(MovieClip(root).P2Me1==true && MovieClip(root).gScreenTimer.text!="99" && MovieClip(root).adrenBar1.width>=220)
				{	
				if(e.keyCode== 71) 
					{
		   			gPressed =true;
					}
				if(e.keyCode== 87)
					{
		   			wPressed =true;
					}
					
				if(gPressed==true && wPressed==true) 
					{
					bothPressed=false;	
					}
					
				if(bothPressed==false && MovieClip(root).begin2==false && MovieClip(root).shootArrow==false ) 
				 	{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						gPressed=false;
						wPressed=false;	
						MovieClip(root).newAmazon.gotoAndPlay("amsuper");
						MovieClip(root).adrenBar1.width=0;
						fight = true;
						bothPressed=true;
						}	
					}
				
				if(bothPressed==false && MovieClip(root).begin2==false && MovieClip(root).jabArrow==false  ) 
				 	{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						gPressed=false;
						wPressed=false;	
						MovieClip(root).newAmazon.gotoAndPlay("amsuper");
						MovieClip(root).adrenBar1.width=0;
						fight = true;
						bothPressed=true;
						}	
					}
					
				if(bothPressed==false && MovieClip(root).newTomoe.currentLabel=="damage" && MovieClip(root).shootArrowCancel==true)
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						gPressed=false;
						wPressed=false;
						MovieClip(root).newAmazon.gotoAndPlay("amsuper");
						MovieClip(root).adrenBar1.width=0;
						fight = true;
						bothPressed=true;
						}	
					}
					
				if(bothPressed==false && MovieClip(root).newTomoe.currentLabel=="damage" && MovieClip(root).twirlArrowCancel==true)
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						gPressed=false;
						wPressed=false;
						MovieClip(root).newAmazon.gotoAndPlay("amsuper");
						MovieClip(root).adrenBar1.width=0;
						fight = true;
						bothPressed=true;
						}
					}
				}
				
			else if(MovieClip(root).P2Me2==true && MovieClip(root).gScreenTimer.text!="99" && MovieClip(root).adrenBar2.width>=220)
				{
				if(e.keyCode== 76)
					{
		   			lPressed =true;
					}
				if(e.keyCode== Keyboard.UP)
					{
		   			upPressed =true;
					}
					
				if(lPressed==true && upPressed==true) 
					{
					bothPressed=false;	
					}					
				
				if(bothPressed==false && MovieClip(root).begin2==false && MovieClip(root).shootArrow==false)
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						lPressed=false;
						upPressed=false;	
						MovieClip(root).adrenBar2.width=0;
						MovieClip(root).newAmazon.gotoAndPlay("amsuper");
						fight = true;
						bothPressed=true;
						}
					}
				
				if(bothPressed==false && MovieClip(root).begin2==false && MovieClip(root).jabArrow==false )
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						lPressed=false;
						upPressed=false;	
						MovieClip(root).adrenBar2.width=0;
						MovieClip(root).newAmazon.gotoAndPlay("amsuper");
						fight = true;
						bothPressed=true;
						}
					}
					
				if(bothPressed==false && MovieClip(root).newTomoe.currentLabel=="damage" && MovieClip(root).shootArrowCancel==true)
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						lPressed=false;
						upPressed=false;
						MovieClip(root).newAmazon.gotoAndPlay("amsuper");
						MovieClip(root).adrenBar2.width=0;
						fight = true;
						bothPressed=true;
						}		
					}
				if(bothPressed==false && MovieClip(root).newTomoe.currentLabel=="damage" && MovieClip(root).twirlArrowCancel==true)
					{
					if(MovieClip(root).healthBar2.width>0 && MovieClip(root).healthBar1.width>0)
						{	
						lPressed=false;
						upPressed=false;
						MovieClip(root).newAmazon.gotoAndPlay("amsuper");
						MovieClip(root).adrenBar2.width=0;
						fight = true;
						bothPressed=true;
						}	
					}
				}
			}	
		}
	}
	