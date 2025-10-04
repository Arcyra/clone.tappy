extends Node

"""
	Node Has Process Attribute. With this attribute you can use your linked scripts even the
	game scene is paused.
	-> Process -> Mode -> Always
	+ Commonly used when the player dies the game pauses even the scripts won't work. So we set the process
	mode to always. With this even the game pauses we can still use our unpaused scene script.
"""

""" Singal / Event
	If the game is large or medium-sized, signals can create a lot of confusion.
	It becomes difficult to know which signal goes where. In such cases, we use the 'Signal / Event' pattern.
	Basically, we keep all the signals inside a Hub, and the signals are emitted there. This way, the confusion is reduced.

	Scenes access the signals in the Hub and emit them.
	Scripts access the signals in the Hub and connect them to their functions.
"""

"""
	Below there is a new way and easy way to create getters and setters in gdscript.
	var best_score: int:
		get:
			return _best_score
		set(score):
			if _best_score < score:
				_best_score = score
"""

"""
	If you set class_name in your custom resources. You can see them while creating resources.
"""

"""
	In Godot, the "user://" path points to the directory where player-specific data is stored. 
	This folder is unique to the currently running instance of the game and can only be accessed by that player.
	It’s typically used to save information such as settings, progress, or scores. In this example, we are 
	saving the player’s best score. The ScoreManager handles both the saving process and loading the data 
	back when the game starts, ensuring that the player’s progress is preserved across sessions. 
	This way, the game can keep track of long-term achievements even after it is closed and reopened.
	
	Link: "https://docs.godotengine.org/en/stable/tutorials/io/data_paths.html"
"""

"""
	Parallax2D is new read the docs. It takes sprite2d's and uses depthed backgrounds. 
	Sprite2D's Offest must be off centered.
	
	If your game doesn't have camera u can use repeat properties just use autoscroll.. 
	In this you can repeat background images. Repeat size is your assets pixel size.
	
	U just have to create Parallax2Ds and sprites.
	
	If you scale the images using the parallax2d transform, parallax won't work. 
	Instead, save this parallax background as a scene and set the desired scale in that scene 
	when you add it to the game scene.
"""
