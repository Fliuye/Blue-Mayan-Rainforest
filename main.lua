-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer"

display.setStatusBar( display.HiddenStatusBar )

local options = 
{
	effect = "fade",
    time = 400,
}

composer.gotoScene( "Screens.ExplorationScreen" , options )