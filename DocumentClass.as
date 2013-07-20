//Joynisha Sumpter DocumentClass for GlassDrop Workaholic Game

package 
{
	
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import glasses.lt.uza.utils.*; // A Singleton written by Paulius Uza that lets you store dynamic variables in a globally accessible location within your AS3 application.
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class DocumentClass extends MovieClip 
	{
		private var global:Global = Global.getInstance(); // initialize the global object
		private var menuSound:Sound = new Sound();
		private var menuSoundChannel:SoundChannel = new SoundChannel();
		private var maingameSound:Sound = new Sound();
		private var maingameSoundChannel:SoundChannel = new SoundChannel();
		private var songlastPosition:Number = 0;
		private var introOff:Boolean = false;
		public var playScreen:Main;
		public var gameoverScreen:gameOverScreen;
		public var GameStart:gameStart;
		public var Instructions:instructionsMC;
		public var instructionsP:instructionsPB;
		public var Credits:creditsMc;
		public var PausedS:pausedScreen;
		private var gameo:Boolean = false;
		private var newGame:Boolean = false;
					
						
		public function DocumentClass() 
		{
		global.activateGamestart = activateGamestart; // setting a global variable
		global.activateGameover = activateGameover;
		global.restartGame = restartGame;
		global.addInstruct = addInstruct;
		global.addCredit = addCredit;
		global.removeCredit = removeCredit;
		global.removeInstruct = removeInstruct;
		global.addPause = addPause;
		global.addInstructPB = addInstructPB;
		global.removeInstructPB = removeInstructPB;
		global.removePause = removePause;
		global.mainMenu = mainMenu;
		global.maingameSoundChannel = maingameSoundChannel;
		global.menuSoundChannel = menuSoundChannel;
		global.menuSound = menuSound;
		global.maingameSound = maingameSound;
		global.loopMainMusic = loopMainMusic;
		global.loopIntroMusic = loopIntroMusic;
		global.songlastPosition = songlastPosition;
		global.gameo = gameo;
		global.newGame = newGame;
		global.newerGame = newerGame;
		GameStart = new gameStart();
		GameStart.x = 0; // Setting the Game Start Screen location
		GameStart.y = 0;
		addChild(GameStart);
		global.menuSound.load(new URLRequest("http://www.breaklimitdesign.com/Sounds/glassMainS.mp3"));
		global.menuSound.addEventListener(Event.COMPLETE, onSoundComplete, false, 0, true);
		}	
	////////////////////////////////////Sound Control///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		private function onSoundComplete(e:Event)
			{
			playIntroMusic();
			global.menuSoundChannel.removeEventListener(Event.COMPLETE, onSoundComplete);
			}		
		
		private function playIntroMusic():void
			{
			global.menuSoundChannel = global.menuSound.play();	
			global.menuSoundChannel.addEventListener(Event.SOUND_COMPLETE, global.loopIntroMusic,false, 0, true);
			}
			
		private	function loopIntroMusic(e:Event)
			{
			playIntroMusic();	
			}
		
		private function onMainSoundComplete(e:Event)
			{
			trace("COMEON");	
			playMainMusic();
			global.maingameSoundChannel.removeEventListener(Event.COMPLETE, onMainSoundComplete);
			}
			
		private function playMainMusic():void
			{
			global.maingameSoundChannel = global.maingameSound.play();	
			global.maingameSoundChannel.addEventListener(Event.SOUND_COMPLETE, loopMainMusic,false, 0, true);
			}	
			
		private	function loopMainMusic(e:Event)
			{
			playMainMusic();	
			}	
				
		///////////////////////////////Game Control///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		private function activateGamestart():void //Function to load the Main Class holding all the game objects.
			{
			playScreen = new Main();
			playScreen.x = 0;
			playScreen.y = 0;
			addChild(playScreen);
			//trace(playScreen + "works");
			removeChild(GameStart); //Removes the Game Start Screen from the display list.
			GameStart = null; // Setting the object to null to make sure it is sent to garbage collection.
			global.maingameSound.load(new URLRequest("http://www.breaklimitdesign.com/Sounds/glassintro.mp3"));
			global.maingameSound.addEventListener(Event.COMPLETE, onMainSoundComplete, false, 0, true);
			global.menuSoundChannel.removeEventListener(Event.SOUND_COMPLETE, global.loopIntroMusic);
			global.menuSoundChannel.stop();	
			global.gameo = false;
			global.clickgTrack = false;
			}
		
		private function activateGameover():void // Function to load the Game Over screen.
			{
			gameoverScreen = new gameOverScreen();
			gameoverScreen.x = 0;
			gameoverScreen.y = 0;
			global.gameo = true;
			addChild(gameoverScreen);
			removeChild(playScreen);
			playScreen = null;
			}	
			
		private function restartGame():void // Function to restart the Game.
			{
			playScreen = new Main();
			playScreen.x = 0;
			playScreen.y = 0;
			global.gameo = false;
			addChild(playScreen);
			removeChild(gameoverScreen);
			gameoverScreen = null;
			}
		
		private function newerGame():void // Function to restart the Game.
			{
			playScreen = new Main();
			playScreen.x = 0;
			playScreen.y = 0;
			addChild(playScreen);
			removeChild(GameStart); //Removes the Game Start Screen from the display list.
			GameStart = null; // Setting the object to null to make sure it is sent to garbage collection.
			global.maingameSoundChannel = global.maingameSound.play();	
			global.maingameSoundChannel.addEventListener(Event.SOUND_COMPLETE, loopMainMusic,false, 0, true);
			global.menuSoundChannel.removeEventListener(Event.SOUND_COMPLETE, global.loopIntroMusic);
			global.menuSoundChannel.stop();
			}	
			
		private function addInstruct()
			{
			Instructions = new instructionsMC();
			Instructions.x = -18;
			Instructions.y = -0.5;
			addChild(Instructions);
			}	
			
		private function addInstructPB()
			{
			instructionsP = new instructionsPB();
			instructionsP.x = -18;
			instructionsP.y = -0.5;
			addChild(instructionsP);
			}		
			
		private function addCredit()
			{
			Credits = new creditsMc();
			Credits.x = -18;
			Credits.y = -0.5;
			addChild(Credits);
			}	
		
		private function removeCredit()
			{
			removeChild(Credits);
			Credits = null;
			}		
			
		private function removeInstruct()
			{
			removeChild(Instructions);
			Instructions = null;
			}		
		
		private function removeInstructPB()
			{
			removeChild(instructionsP);
			instructionsP = null;
			}	
			
		private function addPause()
			{
			PausedS = new pausedScreen();
			PausedS.x = 0;
			PausedS.y = 0;
			addChild(PausedS);
			}	
		
		private function removePause()
			{
			removeChild(PausedS);
			PausedS = null;
			}	
	
		private function mainMenu()
			{
			GameStart = new gameStart();
			GameStart.x = 0; // Setting the Game Start Screen location
			GameStart.y = 0;
			addChild(GameStart);
			GameStart.gotoAndStop("mainMenu");	
			removeChild(PausedS);
			PausedS = null;
			removeChild(playScreen);
			playScreen = null;	
			global.newGame = true;
			}	
	}
}