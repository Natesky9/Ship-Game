///ds_get(map,key)
var get_map = argument0
var get_key = argument1

var value = ds_map_find_value(get_map,get_key)

if is_undefined(value)
    {
    return false
    }
else
return value
