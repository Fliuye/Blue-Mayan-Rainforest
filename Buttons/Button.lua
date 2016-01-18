-- Button

local Button = {}

function Button:create( name )
	local new_button = display.newImage( "Images"..name..".png", 0, 0 )

	return new_button
end

return Button