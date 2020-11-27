///draw_tri(x,y,color)
//draws a rotating triangle, length 4
var tri_x = argument0
var tri_y = argument1
var color = argument2

set_color(color)

var rotate_value = current_time mod (360*10000)/10000
var tri_x1 = tri_x + lengthdir_x(8,rotate_value)
var tri_y1 = tri_y + lengthdir_y(8,rotate_value)
var tri_x2 = tri_x + lengthdir_x(8,rotate_value+120)
var tri_y2 = tri_y + lengthdir_y(8,rotate_value+120)
var tri_x3 = tri_x + lengthdir_x(8,rotate_value+240)
var tri_y3 = tri_y + lengthdir_y(8,rotate_value+240)
draw_triangle(tri_x1,tri_y1,tri_x2,tri_y2,tri_x3,tri_y3,false)
