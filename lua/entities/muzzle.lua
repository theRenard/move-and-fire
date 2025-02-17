muzzle = entity:extend({
  w = 16,
  h = 16,
  t = 10,
  ox = 0,
  oy = 0,
  as = 1,
  pos = nil,
  frames = { 35, 37, 39, 41 },

  update = function(_ENV)
    x = pos.x + ox
    y = pos.y + oy
    animate(_ENV, destroy)
  end,

  draw = function(_ENV)
    draw_animation(_ENV)
  end
})