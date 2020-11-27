///inventory_give(entity,item,quantity)
//adds an item to the inventory
var get_entity = argument0
var get_item = argument1
var get_quantity = argument2

var get_inventory = inventory
var get_keys = map_get(get_inventory,"keys")

var get_existing = map_get(get_inventory,get_item)
if is_undefined(get_existing)
    {
    ds_map_add(get_inventory,get_item,get_quantity)
    ds_list_add(get_keys,get_item)
    var current_quantity = map_get(get_entity,"cargo")
    var new_quantity = current_quantity+get_quantity
    map_set(get_entity,"cargo",new_quantity)
    show("adding to cargo")
    return true
    }

//add the quantity to the entity inventory and count
map_set(get_inventory,get_item,get_existing+get_quantity)
//add to the ship quantity
var current_quantity = map_get(get_entity,"cargo")
var new_quantity = current_quantity+get_quantity
map_set(get_entity,"cargo",new_quantity)
return true
