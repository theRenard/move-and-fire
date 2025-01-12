--player functions from https://mboffin.itch.io/pico8-movement-with-inertia

-- person
player = entity:extend({
	x = 24,
	y = 24,
	dx = 0,
	dy = 0,
	w = 3,
	h = 3,
	sprite = 192,
	xspd = 1.5,
	yspd = 1.5,
	a = 1,
	drg = 0.6,

	update = function(_ENV)
		--when the user tries to move,
		--we only add the acceleration
		--to the current speed.

		if (btn(⬅️)) dx -= a
		if (btn(➡️)) dx += a
		if (btn(⬆️)) dy -= a
		if (btn(⬇️)) dy += a

		--if we acceleration keeps
		--getting added, they will just
		--speed up forever. so we need
		--to limit the speed to a max
		--speed in both horizontal and
		--vertical directions.
		dx = mid(-xspd, dx, xspd)
		dy = mid(-yspd, dy, yspd)

		--before doing any movement,
		--just check if they are next
		--to a wall, and if so, don't
		--let allow movement in that
		--direction.
		wall_check(x, y, w, h, dx, dy)

		--before the player is moved,
		--movement needs to be checked
		--to see if the player actually
		--can move in that direction.
		if can_move(x, y, w, h, dx, dy) then
			--actually move the player to
			--the new location
			x += dx
			y += dy

			--but if the player cannot move
			--into that spot, find out how
			--close they can get and move
			--them there instead.
		else
			--create temporary variables
			--to store how far the player
			--is trying to move.
			tdx = dx
			tdy = dy

			--now we're going to make
			--tdx,tdy shorter and shorter
			--until we find a new position
			--that the player can move to.
			while not can_move(x, y, w, h, tdx, tdy) do
				--if the amount of x movement
				--has been shortened so much
				--that it's practically 0,
				--just set it to 0.
				if (abs(tdx) <= 0.1) then
					tdx = 0

					--but if it's not too small,
					--make it 90% of what it was
					--before. (this shortens the
					--amount the player is trying
					--to move in that direction.)
				else
					tdx *= 0.9
				end

				--do the same thing for y
				--movement.
				if (abs(tdy) <= 0.1) then
					tdy = 0
				else
					tdy *= 0.9
				end
			end

			--now that we've shorted the
			--distance the player is
			--trying to move to something
			--actually possible, actually
			--move the player to that new
			--shortened distance.
			x += tdx
			y += tdy
		end

		--if the player's still moving,
		--then slow them down just a
		--bit using the drag amount.
		if (abs(dx) > 0) dx *= drg
		if (abs(dy) > 0) dy *= drg
		--if they are going slow enough
		--in a particular direction,
		--just bring them to a halt.
		if (abs(dx) < 0.02) dx = 0
		if (abs(dy) < 0.02) dy = 0
	end,

	draw = function(_ENV)
		spr(sprite, x, y)
	end
})