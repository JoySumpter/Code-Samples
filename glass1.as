//Joynisha Sumpter Glass 1 Class for GlassDrop Workaholic Game

package glasses
	{
	import flash.display.MovieClip;	
	import flash.events.*;
	import glasses.glassManager;
	import people.peopleManager;
	import people.woman;
	import people.basket;
	import people.basket2;
	import glasses.lt.uza.utils.*;
	import glasses.PixelPerfectCollisionDetection;
	import flash.system.System;
	
		
	public class glass1 extends MovieClip
		{
		private var global:Global = Global.getInstance();	
		private var oneGlass:Number;
		private var trueMe:Boolean=false;
		private var holder:Number =0;
		private var pHolder:Number =0;
		private var yVelocity:Number =-2;	
		private var accel:Number=-1;
		private var isMovie:glass1;
		private var hitMe:Boolean = false;
		private var isMx:Number = 0;
		private var fallSound = new fall();
		private var frameHolder:Number=0;
		
		
				
		public function glass1()
			{
			isMovie=this;	
			oneGlass=isMovie.y;
			global.yPos = isMovie.y;	
			global.glassPos = oneGlass;
			global.hitting = hitMe;
			global.frameHolder = frameHolder;
			addEventListener(MouseEvent.CLICK, clickTime, false, 0, true );
			}
		
		//Gets the index number of the clicked object in the array by comparing the clicked object
	   // to all the objects in the array.
		private function trackMe():void
			{
			var srow:Number=global.G1.length;
			for(var i=0; i<srow; i++)
				{
				for(var j=0; j<=0; j++)
					{
					if(global.G1[i][j]==isMovie)
						{
						holder=i;	
						pHolder=isMovie.x;
						trueMe = true;
						global.isTrue = trueMe;
						}
					else if (global.G1[i][j] != isMovie)
							{
						
							}	
					}
				}
			}
			
		private function clickTime(e:MouseEvent):void 
			{
			var mem:String = Number( System.totalMemory / 1024 / 1024 ).toFixed( 2 ) + 'Mb';
			global.isMx = isMovie.x;
			
			if (global.isPaused == false)
				{	
				if (isMovie.currentFrame == 1)
					{
					global.frameHolder = 1;	
					}
				if (isMovie.currentFrame == 2)
					{
					global.frameHolder = 2;	
					}	
				if (isMovie.currentFrame == 3)
					{
					global.frameHolder = 3;	
					}	
				fallSound.play();	
				this.addEventListener(Event.ENTER_FRAME, dropTime, false, 0, true );
				}
			}
		
		//Drops the clicked object and calls the clearMe function. 
		private function dropTime(e:Event)	
			{
			if (global.dropMax==0)
				{
				this.removeEventListener(Event.ENTER_FRAME, dropTime);	
				this.removeEventListener(Event.ENTER_FRAME, clickTime);
				}	
			if (isMovie != null)
				{
				if (global.isPaused == false)
					{	
					global.myTimer.start();	
					yVelocity=yVelocity+accel;
					isMovie.y=isMovie.y-yVelocity;
					global.glassPos = isMovie.y;
					this.clearMe();
					}
				}	
				
			if (global.isPaused == true)
				{
				global.myTimer.stop();
				isMovie.y=isMovie.y-0;
				}
			}
			
		//checks to see if the clicked object position is greater than 500 
		//Activates the function trackMe
		//Removes the object from the displaylist and deletes it from memory 
		//by giving it a null value.	
		//Activate printMe and addMe functions and increases the global variable global.1 by 1
		private function clearMe():void
			{
			if(isMovie.y>550)
					{
					if (isMovie.parent != null)
						{
					this.trackMe();	
						if(trueMe==true)
							{
							this.addMe();	
							this.printMe();
							global.l=global.l+1;
							global.t = global.t + 1;
							global.gDrop = global.gDrop + 1;
							global.glassLost = global.glassLost + 1;
							global.dropMax = global.dropMax - 1;
							global.clearLife();
							global.mNumber = 1;	
							global.bFull = 0;
							if (global.sNumber != 0)
								{
								global.sNumber  = global.sNumber  - global.totalPoints;
								}
							global.breakTime1(global.holdBreak1);
							isMovie.parent.removeChild(isMovie);
							isMovie.removeEventListener(Event.ENTER_FRAME, dropTime);
							isMovie=null;
							trueMe == false;
							global.isTrue = trueMe;
							}
						}
					}
				else	
					{
					if (isMovie.parent != null)
						{	
						this.trackMe();	
						if (trueMe == true)	
							{
							if (global.checking(isMovie)) 
								{
								global.clickgTrack = true;		
								this.addMe();	
								this.printMe();
								global.l=global.l+1;
								global.t = global.t + 1;
							if (isMovie.currentFrame == 1 && global.pointsActive==false)
									{
									global.totalPoints = 100;	
									global.collectMe = global.totalPoints * global.mNumber;	
									global.scoreTime(global.holderScoreT);
									global.sNumber  = global.sNumber  + global.totalPoints * global.mNumber;
									global.frameHolder = 1;
									}
							if (isMovie.currentFrame == 2 && global.pointsActive==false)
									{
									global.totalPoints = 300;
									global.collectMe = global.totalPoints * global.mNumber;	
									global.scoreTime(global.holderScoreT);
									global.sNumber  = global.sNumber  + global.totalPoints * global.mNumber;
									}
							if (isMovie.currentFrame == 3 && global.pointsActive==false)
									{
									global.totalPoints = 500;	
									global.collectMe = global.totalPoints * global.mNumber;	
									global.scoreTime(global.holderScoreT);
									global.sNumber  = global.sNumber  + global.totalPoints * global.mNumber;
									}	
							if (isMovie.currentFrame == 1 && global.pointsActive==true)
									{
									global.totalPoints = 1000;	
									global.collectMe = global.totalPoints * global.mNumber;	
									global.scoreTime(global.holderScoreT);
									global.sNumber  = global.sNumber  + global.totalPoints * global.mNumber;
									}
							if (isMovie.currentFrame == 2 && global.pointsActive==true)
									{
									global.totalPoints = 3000;
									global.collectMe = global.totalPoints * global.mNumber;	
									global.scoreTime(global.holderScoreT);
									global.sNumber  = global.sNumber  + global.totalPoints * global.mNumber;
									}
							if (isMovie.currentFrame == 3 && global.pointsActive==true)
									{
									global.totalPoints = 5000;	
									global.collectMe = global.totalPoints * global.mNumber;	
									global.scoreTime(global.holderScoreT);
									global.sNumber  = global.sNumber  + global.totalPoints * global.mNumber;
									}				
								isMovie.parent.removeChild(isMovie);
								isMovie.removeEventListener(Event.ENTER_FRAME, dropTime);
								isMovie = null;
								global.getBasket = null;
								trueMe == false;
								global.hitting = true;	
								global.isTrue = trueMe;
								}
								else 
									{
									global.hitting = false;	
									}	
							}	
								
						}	
													
					}
					
			}		
			
			private function droppings():void
				{
				if (global.dropMax==0)
					{
					global.gDrop = 0;	
					global.dropMax = 3;
					}
				}
		
		//Transfers positions of objects into another array
		private function addMe():void
			{
			if(global.gh1[global.l-1]!=holder)
				{
				global.gh1[global.l]=holder;
				global.gp1[global.t]=pHolder;
				}
			}
			
		//Traces positions of the objects in the new array
		private function printMe():void
			{
			for(var t=0; t<global.gh1.length; t++)
				{
			
				}		
			}
			
			
				
					
		}
		
	}	
			
			
		
	