
-- enable extended map
-- poke(0x5f56, 0x80)

function _init()
	scene:load(game_scene)
end

function _update60()
	scene.current:update()
end

function _draw()
	cls()
	scene.current:draw()
end
