///draw_ore(x,y,color)
//draws ore
var ore_x = argument0
var ore_y = argument1
var color = argument2

var rotate_value = current_time mod (360*10000)/10000
var lump_x1 = ore_x + lengthdir_x(4,rotate_value)
var lump_y1 = ore_y + lengthdir_y(4,rotate_value)
var lump_x2 = ore_x + lengthdir_x(3,rotate_value+120)
var lump_y2 = ore_y + lengthdir_y(3,rotate_value+120)

set_color(c_gray)
draw_circle(ore_x,ore_y, 6,false)
set_color(color)
draw_circle(lump_x1,lump_y1,4,false)
draw_circle(lump_x2,lump_y2,4,false)

