///step_entities()
for (var i = 0;i < ds_list_size(entity_list);i++)
    {
    var get_entity = ds_list_find_value(entity_list,i)
    
    var get_x = ds_get(get_entity,"x")
    var get_y = ds_get(get_entity,"y")
    var get_x_speed = ds_get(get_entity,"x_speed")
    var get_y_speed = ds_get(get_entity,"y_speed")
    //debug("entity speeds: " + string(get_x) + ":" + string(get_y) + "|" + string(get_x_speed) + ":" + string(get_y_speed))
    
    
    ds_set(get_entity,"x",get_x+get_x_speed)
    ds_set(get_entity,"y",get_y+get_y_speed)
    }
