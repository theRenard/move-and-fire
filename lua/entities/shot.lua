shot = entity:extend({
  x = 0,
  y = 0,
  w = 1,
  h = 1,
  sh = 1,

  spd = 2,
  pool = {},

  frames = { 11 },
  frame = 0,

  update = function(_ENV)
    y -= spd

		local f = (t() * 60 \ 10 % #frames) + 1
		frame = frames[f]

    if y < 0 then
      destroy(_ENV)
    end
  end,

  draw = function(_ENV)
    spr(frame, x, y, 1, sh)
  end
})