///entity_create_ship
//creates a ship and initializes all the variables
var get_x = argument0
var get_y = argument1
var get_entity = entity_create(get_x,get_y,entity.ship)

var get_grid = ds_grid_create(5,5)
var get_inventory = ds_list_create()

ds_set(get_entity,"grid",get_grid)
ds_set(get_entity,"inventory",get_inventory)

//populate the grid
ds_grid_set_disk(get_grid,2,2,2,1)
ds_grid_set(get_grid,2,1,2)
ds_grid_set(get_grid,1,4,3)
ds_grid_set(get_grid,3,4,3)
//fill the inventory with random junk
ds_list_add(get_inventory,1,2,3,5,5,7)

return get_entity
