shot = entity:extend({
  spd = 2,
  frames = { 11 },

  update = function(_ENV)
    y -= spd

    animate(_ENV)

    if y < 0 then
      destroy(_ENV)
    end
  end,

  draw = function(_ENV)
    draw_animation(_ENV)
  end
})