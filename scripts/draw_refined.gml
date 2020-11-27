///draw_refined(x,y,color)
//draws a refined... something
var get_x = argument0
var get_y = argument1
var color = argument2

set_color(color)

var height = sin((current_time*pi)/4000)*4

var x1 = get_x - 4
var y1 = get_y - height
var x2 = get_x + 4
var y2 = get_y + height
draw_rectangle(x1,y1,x2,y2,false)
