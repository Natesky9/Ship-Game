///Event_Motion_Damage()
//eventually merge this with Event_Motion to
//cut down on game loops
var damage_count = list_size(damage_list)

for (var d=damage_count-1;d>0;d--)
    {
    var get_entity = list_get(damage_list,d)

    var get_x = map_get(get_entity,"x")
    var get_y = map_get(get_entity,"y")
    var get_lifetime = map_get(get_entity,"lifetime")
    var get_parent = map_get(get_entity,"parent")
    
    //do lifetime stuff
    if get_lifetime <= 0
        {
        entity_delete(get_entity)
        show("deleting damage")
        continue
        }
    map_set(get_entity,"lifetime",get_lifetime-1)
    //rock collisions
    var rock_count = list_size(rock_list)
    for (var i = 0;i< rock_count;i++)
        {
        var get_rock = list_get(rock_list,i)
        
        var get_grid = map_get(get_rock,"grid")
        var get_width = ds_grid_width(get_grid)
        var get_height = ds_grid_height(get_grid)
        var get_point = point_to_hex_grid(get_rock,get_x,get_y)
        var point_x = get_point[0]
        var point_y = get_point[1]
        
        if not grid_in_bounds(get_width,get_height,point_x,point_y)
            continue
        var get_cell = ds_grid_get(get_grid,point_x,point_y)
        if not get_cell
            continue
            
        add_grid_damage(get_rock,point_x,point_y,1)
        entity_create_hex_vertex_buffer(get_rock)
          
        var get_damage = get_grid_damage(get_rock,point_x,point_y)
        if not get_damage
            {
            grid_set(get_rock,get_grid,point_x,point_y,0)
            }
        
        //delete the projectile
        entity_delete(get_entity)
        break
        }
    //end rock collisions
    
    //ship collisions
    var ship_count = list_size(ship_list)
    for (var i = 0;i<ship_count;i++)
        {
        var get_ship = list_get(ship_list,i)
        if is_undefined(get_ship)
            {
            show("error, undefined @Event_Damage!")
            continue
            }
        if get_ship == get_parent
            continue
        
        var get_grid = map_get(get_ship,"grid")
        var get_width = ds_grid_width(get_grid)
        var get_height = ds_grid_height(get_grid)
        var get_point = point_to_square_grid(get_ship,get_x,get_y)
        var point_x = get_point[0]
        var point_y = get_point[1]
        if not grid_in_bounds(get_width,get_height,point_x,point_y)
            continue
        var get_cell = ds_grid_get(get_grid,point_x,point_y)
        if not get_cell
            continue
        var get_damage = get_grid_damage(get_ship,point_x,point_y)
        if not get_damage
            continue
        
        add_grid_damage(get_ship,point_x,point_y,1)
        //delete the projectile
        entity_delete(get_entity)
        break
        }
    //end ship collisions
    }
