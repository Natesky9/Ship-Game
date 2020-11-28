///get_grid_damage(entity,x,y)
//returns the damage of a ship? cell
var get_entity = argument0
var get_x = argument1
var get_y = argument2

var get_integrity = map_get(get_entity,"integrity")
var get_health = ds_grid_get(get_integrity,get_x,get_y)
return get_health
