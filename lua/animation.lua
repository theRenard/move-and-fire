--animation functions

--this creates an item that can
--be animated. it needs a list
--of sprite numbers and a speed
--for the animation.
function make_anim_item(item, sprites, anim_speed)
  --create a temporary table for
  --the new item
  -- local item = {}

  --anim_speed is how many frames
  --should go by before the
  --animation goes to the
  --next frame. so an anim_speed
  --of 3 would make the animation
  --play at 10 frames per second.
  item.anim_speed = anim_speed

  --sprites is a list of sprites
  --for the animation, in the
  --order they should be shown
  item.sprites = sprites

  --tick is a counter to tell
  --when to move to the next
  --frame. it should start at 0.
  item.tick = 0

  --frame keeps track of which
  --is the current number sprite
  --to show. this would also
  --start at 1 so the animation
  --starts on the first sprite.
  item.frame = 1

  --send back the new item
  return item
end

--animate an item. it needs to
--have tick, anim_speed,
--frame, and sprites keys.
function animate(a)
  --add one to the tick, but if
  --it gets to anim_speed number
  --then reset it back to 0.
  a.tick = (a.tick + 1) % a.anim_speed

  --if tick gets resets to 0...
  if (a.tick == 0) then
    --move up to the next frame,
    --but loop back to 1 if it's
    --already at the last frame.
    a.frame = (a.frame % #a.sprites) + 1
  end
end

--draw the animated item
function draw_anim_item(a)
  --use the sprite at the current
  --frame number when drawing
  --the item.
  spr(a.sprites[a.frame], a.x, a.y)
end

