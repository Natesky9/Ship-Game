///entity_delete(entity)
//deletes an entity

var get_entity = argument0

var get_type = map_get(get_entity,"type")

//remove from type list
switch get_type
    {
    case entity.ship:
        {//remove from ship list
        var pos = ds_list_find_index(ship_list,get_entity)
        ds_list_delete(ship_list,pos)
        break
        }
    case entity.item:
        {//remove from item list
        var pos = ds_list_find_index(item_list,get_entity)
        ds_list_delete(item_list,pos)
        break
        }
    case entity.rock:
        {//remove from rock list
        var pos = ds_list_find_index(rock_list,get_entity)
        ds_list_delete(rock_list,pos)
        break
        }
    }
//remove from entity list
var list_pos = ds_list_find_index(entity_list,get_entity)
ds_list_delete(entity_list,list_pos)
//remove from map list
var map_pos = ds_list_find_index(map_list,get_entity)
ds_list_delete(map_list,list_pos)
//remove map
ds_map_destroy(get_entity)
