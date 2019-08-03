///ds_set(map,key,value)
var get_map = argument0
var get_key = argument1
var get_value = argument2

if ds_map_exists(get_map,get_key)
    {
    //debug("setting value" + string(get_key) + " to " + string(get_value))
    get_map[? get_key] = get_value
    }
else
    {
    //add new key
    debug("adding new key " + get_key+":"+string(get_value))
    ds_map_add(get_map,get_key,get_value)
    }

