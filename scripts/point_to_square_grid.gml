///x_to_grid_x(x,y,get_entity)
//returns a grid value based on a coordinate
//does not return undefined!
var get_entity = argument0
var get_target_x = argument1
var get_target_y = argument2

var get_grid = map_get(get_entity,"grid")
var get_x = map_get(get_entity,"x")
var get_y = map_get(get_entity,"y")
var get_heading = map_get(get_entity,"heading")
var grid_width = ds_grid_width(get_grid)

var grid_offset = grid_width*ship_grid_size/2
//normalize the mouse position to face up

var get_distance = point_distance(get_x,get_y,get_target_x,get_target_y)
var get_direction = point_direction(get_x,get_y,get_target_x,get_target_y)

var new_direction = get_direction - get_heading + 90

var new_target_x = get_x + lengthdir_x(get_distance,new_direction)
var new_target_y = get_y + lengthdir_y(get_distance,new_direction)


var x_corner = get_x-grid_offset
var y_corner = get_y-grid_offset

var x_result = new_target_x - x_corner
var y_result = new_target_y - y_corner

var x_div = x_result div ship_grid_size
var y_div = y_result div ship_grid_size

var square;
square[0] = x_div 
square[1] = y_div
return square







