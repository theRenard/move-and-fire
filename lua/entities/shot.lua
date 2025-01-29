shot=entity:extend({
  x=0,
  y=0,
  w=1,
  h=1,

  spd=2,
  pool={},

  update=function(_ENV)
    y-=spd

    if y<0 then
      destroy(_ENV)
    end
  end,

  draw=function(_ENV)
    spr(11,x,y)
  end,
})