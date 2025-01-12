
-- enable extended map
poke(0x5f56, 0x80)

function _init()
	scene:load(title_scene)
end

function _update()
	scene.current:update()
end

function _draw()
	cls()
	scene.current:draw()
end
