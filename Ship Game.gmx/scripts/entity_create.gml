///entity_create(x,y,type)
//creates an entity,
//adds it to the entity list
var get_x = argument0
var get_y = argument1
var get_type = argument2

var new_entity = ds_map_create()
ds_map_add(new_entity,"x",get_x)
ds_map_add(new_entity,"y",get_y)
ds_map_add(new_entity,"type",get_type)

ds_list_add(entities,new_entity)

return new_entity
