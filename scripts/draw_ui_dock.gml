///draw_ui_dock()
//draw dock ui
var x1 = room_width
var y1 = room_height
var x2 = room_width-200
var y2 = room_height-200
set_color(c_maroon)
draw_rectangle(x1,y1,x2,y2,false)
set_color(c_black)
draw_rectangle(x1,y1,x2,y2,true)

var is_docked = map_get(myship,"docked")


var get_x = map_get(myship,"x")
var get_y = map_get(myship,"y")
var get_heading = map_get(myship,"heading")
var nearest_shipyard = list_get(shipyard_list,0)
var shipyard_x = map_get(nearest_shipyard,"x")
var shipyard_y = map_get(nearest_shipyard,"y")
var nearest_distance = point_distance(get_x,get_y,shipyard_x,shipyard_y)
var nearest_direction = point_direction(get_x,get_y,shipyard_x,shipyard_y)-get_heading+90
/*var shipyard_size = list_size(shipyard_list)
for (var i = 1;i < shipyard_size;i++)
    {
    var get_shipyard = list_get(shipyard_list,i)
    var shipyard_x = map_get(get_shipyard,"x")
    var shipyard_y = map_get(get_shipyard,"y")
    var get_distance = point_distance(get_x,get_y,shipyard_x,shipyard_y)
    }
*/
var flash = (current_time div 500) mod 2
if nearest_distance < 128
    {
    if flash
    set_color(c_white)
    else
    set_color(c_black)
    align(7)
    draw_text(x2,y2,"Press O to Dock!")
    exit
    }
set_color(c_white)
align(7)
draw_text(x2,y2,"Navigate to#nearest shipyard!")
var mean_x = mean(x1,x2)
var mean_y = mean(y1,y2)
var len_x = lengthdir_x(32,nearest_direction)
var len_y = lengthdir_y(32,nearest_direction)
draw_arrow(mean_x - len_x,mean_y - len_y,mean_x + len_x,mean_y + len_y,15)
align(2)
draw_text(mean_x,y1,"distance: " + string(floor(nearest_distance)) + "m")
