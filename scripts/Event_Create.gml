///Event_Create()
Initialize_Groups()
create_vertex_buffer_format()


game_mode = mode.free_flight

//change edit value to be per-entity instead
edit_value = part.computer

inventory = ds_map_create()
selected_entity = undefined
//myship is temporary
myship = entity_create(50,120,entity.ship)
var inventory_keys = ds_list_create()
map_set(inventory,"keys",inventory_keys)

inventory_give(myship,item.rockred,5)
inventory_give(myship,item.rockblue,1)
inventory_give(myship,item.rockgreen,8)
inventory_give(myship,item.orered,1)
inventory_give(myship,item.oreblue,1)
inventory_give(myship,item.oregreen,1)

inventory_size = 0

myshipyard = entity_create(100,100,entity.shipyard)
ui_type = ui.null

test_ship = entity_create(400,400,entity.ship)
rock_grid_size = 16
ship_grid_size = 16

define_recipes()
