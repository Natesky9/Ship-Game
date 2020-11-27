///Event_Mouse()
if mouse_check_button_pressed(mb_left)
    {
    
    //find the nearest rock
    var get_rock = undefined
    var get_size = list_size(rock_list)
    for (var i = 0;i < get_size;i++)
        {
        var get_entity = list_get(rock_list,i)
        var get_offset = point_to_hex_grid(get_entity,mouse_x,mouse_y)
        var get_q = get_offset[0]
        var get_r = get_offset[1]
        var get_grid = map_get(get_entity,"grid")
        var get_value = ds_grid_get(get_grid,q,r)
        
        if get_value
            {
            selected_entity = get_entity
            map_set(get_entity,"vertex buffer",undefined)
            exit
            }
        }
    
    var new_item = entity_create(mouse_x,mouse_y,entity.item)
    var random_item = irandom_range(item.rockred,item.oregreen)
    //show("random: " + string(random_item))
    map_set(new_item,"item",random_item)
    }
    
if mouse_check_button_released(mb_left)
    {
    selected_entity = undefined
    exit
    }
if mouse_check_button(mb_left)
    {
    var get_entity = selected_entity
    if is_undefined(get_entity)
        exit
    map_set(get_entity,"x",mouse_x)
    map_set(get_entity,"y",mouse_y)
    }

    

    
if mouse_check_button_pressed(mb_right)
    {
    var get_rock = undefined
    
    var get_size = list_size(rock_list)
    for (var i = 0;i < get_size;i++)
        {
        var get_entity = list_get(rock_list,i)
        var get_offset = point_to_hex_grid(get_entity,mouse_x,mouse_y)
        var get_q = get_offset[0]
        var get_r = get_offset[1]
        var get_grid = map_get(get_entity,"grid")
        var get_value = ds_grid_get(get_grid,q,r)
        
        if get_value
            {
            get_rock = get_entity
            grid_set(get_entity,get_grid,q,r,0)
            var get_item = entity_create(mouse_x,mouse_y,entity.item)
            map_set(get_item,"item",get_value)
            show("broke cell!")
            }
        if not is_undefined(get_rock)
        exit
        }
    
    }
