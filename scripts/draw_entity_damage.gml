///draw_entity_damage()
//draws a projectile
var get_entity = argument0
var get_x = map_get(get_entity,"x")
var get_y = map_get(get_entity,"y")
var get_damage = map_get(get_entity,"damage")*2
var get_lifetime = map_get(get_entity,"lifetime")

set_color(c_orange)
draw_circle(get_x,get_y,get_damage,false)
set_color(c_black)
draw_circle(get_x,get_y,get_damage,true)
