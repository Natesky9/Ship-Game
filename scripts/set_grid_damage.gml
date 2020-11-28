///set_grid_damage(entity,x,y,damage)
//sets the damage of a ship? cell
var get_entity = argument0
var get_x = argument1
var get_y = argument2
var get_damage = argument3

var get_integrity = map_get(get_entity,"integrity")
ds_grid_set(get_integrity,get_x,get_y,get_damage)
