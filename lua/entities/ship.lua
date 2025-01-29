-- Ship entity
ship = entity:extend({
	x = 60,
	y = 60,
	w = 7,
	h = 5,

	dx = 0,
	dy = 0,
	spd = 1,

	sprts = { 1, 3, 5, 7, 9 },
	sprt = 0,

	shotTemp = 0,
	sprtTemp = 0,

	fire = function(_ENV)
		-- spawn bullet
		-- add(shots, {x=x+3, y=y-2})
		if shotTemp == 0 then
			shot({
				x = x + 3,
				y = y - 2
			})
			shotTemp = 5
		end
	end,

	update = function(_ENV)
		dx, dy, sx = 0, 0, 0

		if (btn(⬆️)) dy -= spd
		if (btn(⬇️)) dy += spd
		if (btn(⬅️)) dx -= spd
		if (btn(➡️)) dx += spd
		if (btn(🅾️)) fire(_ENV)

		if dx != 0 or dy != 0 then
			-- normalize movement
			local a = atan2(dx, dy)
			sx = cos(a)
			y += sin(a)

			x = flr(x + sx) + 0.5
			y = flr(y) + 0.5

			sprtTemp += (sx - sprtTemp) * 0.15

			-- spawn dust each 3/10 sec
			-- if (t()*10)\1%3==0 then
			-- 	dust({
			-- 		x=x+rnd(3),
			-- 		y=y+4,
			-- 		frames=18+rnd(4),
			-- 	})
			-- end
		end

		-- restrict movement
		x = mid(7, x, 114)
		y = mid(15, y, 116)

		if shotTemp > 0 then
			shotTemp -= 1
		end
	end,

	draw = function(_ENV)
		spr(sprts[flr(sprt * 2.4 + 3.5)], x, y, 2, 2)
		-- pset(x,y,7)
		print(#shot.pool, 5, 5, 7)
		print(sx)
		print(sprtTemp)
	end
})