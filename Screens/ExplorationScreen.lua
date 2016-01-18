-- ExplorationScreen

--------------------------------------------
--       intialize required files
--------------------------------------------
local composer = require "composer"
local Camera = require "Camera"

--------------------------------------------
--        initialize variables
--------------------------------------------
local scene = composer.newScene()

-- numbers
local previous_x
local previous_y

local min_x_border
local min_y_border
local max_x_border
local max_y_border

-- display objects
local background

--------------------------------------------
--        initialize functions
--------------------------------------------


--------------------------------------------
--        initialize listeners
--------------------------------------------
local touchScreenListener



function scene:create( event )

    local sceneGroup = self.view
    previous_x = 0
	previous_y = 0

	min_x_border = -206
	min_y_border = 0
	max_x_border = 0
	max_y_border = 0	

	-- background = display.newImage( "Images/rainforest-bg.jpg", 0, 0 )

end


function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
    	background = display.newImage( "Images/rainforest–bg.jpg", 0, 0 )
    	sceneGroup:insert( background )

    	-- set bounds, based on background image
    	max_x_border = background.contentBounds.xMax + 16
		max_y_border = background.contentBounds.yMax - 32

    elseif ( phase == "did" ) then
    	Runtime:addEventListener( "touch", touchScreenListener )

    end
end


function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then

    elseif ( phase == "did" ) then
    	Runtime:removeEventListener( "touch", touchScreenListener )

    end
end


function scene:destroy( event )

    local sceneGroup = self.view

end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

--------------------------------------------
--      		  FUNCTIONS
--------------------------------------------



--------------------------------------------
--      		  LISTENERS
--------------------------------------------

-- 
function touchScreenListener( event )
	if ( event.phase == "began" ) then
		previous_x = event.x
		previous_y = event.y

	elseif ( event.phase == "moved" ) then
		local new_background_x = background.x + ( event.x - previous_x ) 
		local new_background_y = background.y + ( event.y - previous_y )

		-- print ( tostring( new_background_x ))
		-- print ( tostring( new_background_y ))

		if ( new_background_x > min_x_border and new_background_x < max_x_border ) then
			background.x = new_background_x
		end

		if ( new_background_y > min_y_border and new_background_y < max_y_border ) then
			background.y = new_background_y
		end

		previous_x = event.x
		previous_y = event.y

	elseif ( event.phase == "ended" ) then
		previous_x = 0
		previous_y = 0
	end
end

return scene













