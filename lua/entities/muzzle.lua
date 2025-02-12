muzzle = entity:extend({
  w = 16,
  h = 16,
  t = 10,
  as = 0.7,

  frames = { 35, 37, 39, 41 },

  update = function(_ENV)
    animate(_ENV, destroy)
  end,

  draw = function(_ENV)
    draw_animation(_ENV)
  end
})