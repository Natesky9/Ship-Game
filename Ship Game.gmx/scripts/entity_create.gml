///entity_create(x,y,type)
//creates an entity,
//adds it to the entity list
var get_x = argument0
var get_y = argument1
var get_type = argument2

var new_entity = ds_map_create()
ds_set(new_entity,"x",get_x)
ds_set(new_entity,"y",get_y)
ds_set(new_entity,"type",get_type)

//
//ds_set(new_entity,"x_speed",irandom(4))
//ds_set(new_entity,"y_speed",irandom(4))
//

ds_list_add(entity_list,new_entity)

debug("created new entity: " + string(new_entity))

return new_entity
