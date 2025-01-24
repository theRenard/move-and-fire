-- TODO:
-- 1. movement
-- 2. animations
-- 3.- wall collision
-- 4. object interaction
-- 5. message system
-- 6. combat system
-- 7. fog of war
-- 8. pathfinding
-- 9. throw

game_scene = scene:extend({
  w = 32,
  h = 32,
  maze = {},
  _player = {},
  cam_x = 0,
  cam_y = 0,
  init = function(_ENV)

    -- -- spawn player
    _player = person()

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
    -- add(entity.pool, del(entity.pool, player))
    cam_x = _player.x - 64
    cam_y = _player.y - 64
    -- camera(cam_x, cam_y)
    map(0, 0, 0, 0, w, h)
    entity:each("draw")
    -- camera()
  end
})