///entity_delete(entity)
//deletes an entity
var get_entity, get_type, list, pos
get_entity = argument0
get_type = map_get(get_entity,"type")
//set the list and pos
switch get_type
    {
    case entity.ship:
        {//remove from ship list
        list = ship_list
        pos = ds_list_find_index(list,get_entity)
        break
        }
    case entity.item:
        {//remove from item list
        list = item_list
        pos = ds_list_find_index(list,get_entity)
        break
        }
    case entity.rock:
        {//remove from rock list
        list = rock_list
        pos = ds_list_find_index(list,get_entity)
        break
        }
    case entity.shipyard:
        {//remove from shipyard list
        list = shipyard_list
        pos = ds_list_find_index(list,get_entity)
        break
        }
    case entity.damage:
        {//remove from damage list
        list = damage_list
        pos = ds_list_find_index(list,get_entity)
        break
        }
    default:
        {
        show("error, entity_delete passed an unknown entity!")
        exit
        }
    }
//remove from specific list
ds_list_delete(list,pos)
//remove from entity list
var list_pos = ds_list_find_index(entity_list,get_entity)
ds_list_delete(entity_list,list_pos)
//remove from map list
var map_pos = ds_list_find_index(map_list,get_entity)
ds_list_delete(map_list,list_pos)
//remove map
ds_map_destroy(get_entity)
