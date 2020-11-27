///inventory_check(entity,item)
//checks the count of an item in inventory
var get_entity = argument0
var get_item = argument1

var get_inventory = inventory

var get_existing = map_get(get_inventory,get_item)
if is_undefined(get_existing)
    {
    return false
    }

return map_get(get_inventory,get_item)
