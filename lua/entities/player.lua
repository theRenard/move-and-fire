--player functions from https://mboffin.itch.io/pico8-movement-with-inertia

-- person
person=entity:extend({
	x=60,
	y=60,
	w=7,
	h=5,

	dx=0,
	dy=0,

	update=function(_ENV)
		dx,dy=0,0

		if (btn(⬆️)) dy-=1
		if (btn(⬇️)) dy+=1
		if (btn(⬅️)) dx-=1
		if (btn(➡️)) dx+=1

		if dx!=0 or dy !=0 then
			-- normalize movement
			-- local a=atan2(dx,dy)
			-- x+=cos(a)
			-- y+=sin(a)

			-- add velocity but clamp it to 1
			dx=mid(-1,dx,1)
			dy=mid(-1,dy,1)

			-- add velocity to position
			x+=dx
			y+=dy


			-- spawn dust each 3/10 sec
			if (t()*10)\1%3==0 then
				dust({
					x=x+rnd(3),
					y=y+4,
					frames=18+rnd(4),
				})
			end
		end

		-- restrict movement
		x=mid(7,x,114)
		y=mid(15,y,116)
	end,

	draw=function(_ENV)
		prints("😐",x,y,7)
		print(dx)
	end,
})