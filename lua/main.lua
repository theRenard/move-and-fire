
-- enable extended map
-- poke(0x5f56, 0x80)

function _init()
	cls()
	scene:load(game_scene)
end

function _update60()
	scene.current:update()
end

function _draw()
	scene.current:draw()
end
