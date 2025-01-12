
title_scene=scene:extend({
	init=function(_ENV)
		frame=0
		-- title_heart=heart({
		-- 	x=15,
		-- 	y=30
		-- })
	end,

	update=function(_ENV)
		entity:each("update")

		if btnp(❎) then
			scene:load(game_scene)
		end

		-- spawn spark each 4/10 sec
		if (t()*10)\1%4==0 then
			-- title_heart:create_spark()
		end
	end,

	draw=function()
		-- draw entities
		entity:each("draw")

		-- title
		print_title("heartseeker",32,7)

		-- instructions
		printc("collect all the hearts",60,6)
		printc("before time runs out!",68,6)

		-- prompt
		printc("❎ start game",96,7)
	end,
})