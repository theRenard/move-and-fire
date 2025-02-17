class = setmetatable(
  {
    extend = function(self, tbl)
      tbl = tbl or {}
      tbl.__index = tbl
      return setmetatable(
        tbl, {
          __index = self,
          __call = function(self, ...)
            return self:new(...)
          end
        }
      )
    end,

    new = function(self, tbl)
      tbl = setmetatable(tbl or {}, self)
      tbl:init()
      return tbl
    end,

    init = noop
  }, { __index = _ENV }
)

-- entities

entity = class:extend({
  -- class
  pools = {},

  extend = function(_ENV, tbl)
    tbl = class.extend(_ENV, tbl)
    tbl.pools = {}
    return tbl
  end,

  each = function(_ENV, method, ...)
    -- pq(entity.pools)
    -- for pl in #entity.pools do
    --   pq(entity.pools[pl])
    --   for e in all(pl) do
    --     if (e[method]) e[method](e, ...)
    --   end
    -- end
    for z in pairs(entity.pools) do
      for i = 1, #entity.pools[z] do
        local e = entity.pools[z][i]
        if e and e[method] then
          e[method](e, ...)
        end
      end
    end
  end,

  -- instance
  x = 0,
  y = 0,

  w = 8,
  h = 8,

  z = 1,

  -- animation
  as = 0.5,
  frame = 1,
  frames = {},

  init = function(_ENV)
    entity.pools[z] = entity.pools[z] or {}
    add(entity.pools[z], _ENV)
    if pools[z] != entity.pools[z] then
      add(pools[z], _ENV)
    end
    -- pq(entity.pools)
  end,

  detect = function(_ENV, other, callback)
    if collide(_ENV, other) then
      callback(_ENV)
    end
  end,

  collide = function(_ENV, other)
    return x < other.x + other.w
        and x + w > other.x
        and y < other.y + other.h
        and h + y > other.y
  end,

  animate = function(_ENV, callback)
    if not #frames then
      return
    end
    frame += as
    if flr(frame) > #frames then
      if callback then
        callback(_ENV)
      end
      frame = 1
    end
  end,

  draw_animation = function(_ENV)
    if (frame) then
      spr(frames[flr(frame)], x, y, w/8, h/8)
    end
  end,

  destroy = function(_ENV)
    del(entity.pools[z], _ENV)
    if pools[z] != entity.pools[z] then
      del(pools[z], _ENV)
    end
  end
})

scene = class:extend({
  current = nil,

  update = noop,
  draw = noop,

  destroy = function(_ENV)
    entity:each("destroy")
  end,

  load = function(_ENV, scn)
    if current != scn then
      if (current) current:destroy()
      current = scn()
    end
  end
})