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
  si = 1,

  update = function(_ENV)
    y -= spd
    si += .5

    if si > #frames then
      si = 1
    end

    if y < 0 then
      destroy(_ENV)
    end
  end,

  draw = function(_ENV)
    spr(frames[flr(si)], x, y, 1, sh)
  end
})