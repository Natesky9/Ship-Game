///Initialize_Groups()

//entity_list is all entities
entity_list = ds_list_create()
entity_types = ds_list_create()

//entity types
//these are arranged from largest to smallest
shipyard_list = ds_list_create()
ship_list = ds_list_create()
rock_list = ds_list_create()
item_list = ds_list_create()

//entities are the types
list_add(entity_types,shipyard_list)
list_add(entity_types,ship_list)
list_add(entity_types,rock_list)
list_add(entity_types,item_list)

map_list = ds_list_create()
grid_list = ds_list_create()
