-- Camera Object

local Camera = {}

function Camera:create()
	local new_camera = {}
	new_camera.photo_area = display.newRect( 0, 0, display.contentWidth / 3, display.contentHeight / 4 )
	new_camera.photo_area:setFillColor( 1.0, 1.0, 1.0, 0.4 )

	return new_camera
end

function Camera:takePicture()
	return display.captureBounds( self.contentBounds )
end

return Camera

