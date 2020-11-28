///set_ship_grid(get_entity,x,y)
//sets the grid and health grid of a ship
var get_entity = argument0
var get_x = argument1
var get_y = argument2
var get_value = argument3

var get_grid = map_get(get_entity,"grid")
var get_integrity = map_get(get_entity,"integrity")

ds_grid_set(get_grid,get_x,get_y,get_value)
ds_grid_set(get_integrity,get_x,get_y,100)
