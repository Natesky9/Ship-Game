///inventory_take(entity,item,quantity)
//takes an item from the inventory
var get_entity = argument0
var get_item = argument1
var get_quantity = argument2

var get_inventory = inventory

var get_existing = map_get(get_inventory,get_item)
if is_undefined(get_existing)
    {
    return false
    }

if get_existing >= get_quantity
    {
    map_set(get_inventory,get_item,get_existing-get_quantity)
    //subtract from the ship capacity
    var current_quantity = map_get(get_entity,"cargo")
    map_set(get_entity,"cargo",current_quantity-get_quantity)
    return true
    }
else
return false
