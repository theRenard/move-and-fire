-- Ship entity
engine = entity:extend({
	x = 0,
	y = 0,
	z = 15,
	frames = { 12, 13, 14, 13 },
	frame = 0,

	setPos = function(_ENV, _x, _y)
		x = _x
		y = _y
	end,

	update = function(_ENV)
		local f = ((t() * 60) \ 3 % 4) + 1
		frame = frames[f]

		-- spawn dust each 3/10 sec
		-- if (t() * 10) \ 1 % 3 == 0 then
		-- 	dust({
		-- 		x = x + rnd(3),
		-- 		y = y + 4,
		-- 		frames = 18 + rnd(4)
		-- 	})
		-- end
	end,

	draw = function(_ENV)
		spr(frame, x + 3, y + 15)
		spr(frame, x + 5, y + 15, 1, 1, true)
	end
})

ship = entity:extend({
	z = 20,
	x = 60,
	y = 60,
	w = 7,
	h = 5,
	xx = x,
	yy = y,

	dx = 0,
	dy = 0,
	spd = 1.4,

	frames = { 1, 3, 5, 7, 9 },
	frame = 0,

	shotTemp = 0,
	_engine = engine(),

	fire = function(_ENV)
		-- spawn bullet
		-- add(shots, {x=x+3, y=y-2})
		if shotTemp == 0 then
			shot({
				z = 10,
				x = x - 3,
				y = y - 8,
				frames = { 32, 33, 34 },
				h = 16,
				spd = 6,
			})
			shot({
				z = 10,
				x = x + 12,
				y = y - 8,
				frames = { 32, 33, 34 },
				h = 16,
				spd = 6,
			})
			muzzle({
				z = 10,
				x = x - 3,
				y = y + 2,
			})
			muzzle({
				z = 10,
				x = x + 12,
				y = y + 2,
			})
			shotTemp = 3
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

			sx = cos(a) * spd
			sy = sin(a) * spd

			x += sx
			y += sy
		end

		xx = flr(x) + 0.5
		yy = flr(y) + 0.5

		-- restrict movement
		x = mid(0, x, 127)
		y = mid(0, y, 127)

		frame += (sx - frame) * 0.15
		frame = mid(-1, frame, 1)

		if shotTemp > 0 then
			shotTemp -= 1
		end

		_engine:setPos(x, y)
	end,

	draw = function(_ENV)
		-- add(entity.pool, del(entity.pool, _engine))
		spr(frames[flr(frame * 2.4 + 3.5)], xx, yy, 2, 2)
	end
})