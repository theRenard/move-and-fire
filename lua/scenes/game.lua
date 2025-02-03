game_scene = scene:extend({
  w = 32,
  h = 32,
  maze = {},
  _ship = {},
  cam_x = 0,
  cam_y = 0,
  init = function(_ENV)

    -- -- spawn player
    _ship = ship()

    --   -- destroy if colliding
    --   obj:detect(
    --     player, function()
    --       obj:destroy()
    --     end
    --   )
    -- end
  end,

  update = function(_ENV)
    entity:each("update")
  end,

  draw = function(_ENV)
    -- cls(2)
    -- add(entity.pool, del(entity.pool, _ship))
    entity:each("draw")
  end
})