///Event_Fire()
//the weapon event

var ship_count = list_size(ship_list)
for (var i = 0;i < ship_count;i++)
    {
    var get_entity = list_get(ship_list,i)
    var get_fire = map_get(get_entity,"fire")
    var get_fire_rate = map_get(get_entity,"fire rate")
    if not get_fire
        continue
        var get_x = map_get(get_entity,"x")
        var get_y = map_get(get_entity,"y")
        var get_heading = map_get(get_entity,"heading")
    var layout = map_get(get_entity,"layout")
    var get_grid = map_get(get_entity,"grid")
    var get_width = ds_grid_width(get_grid)*ship_grid_size
    var get_height = ds_grid_height(get_grid)*ship_grid_size
    
    
    var layout_size = array_height_2d(layout)
    for (var g = 0;g < layout_size;g++)
        {
        var get_part = layout[g,0]
        var get_x1 = layout[g,1]
        var get_y1 = layout[g,2]
        var get_x2 = layout[g,3]
        var get_y2 = layout[g,4]
        if get_part != part.gun
            continue
        var gun_width = get_x2-get_x1+1
        var gun_height = get_y2-get_y1+1
        var gun_size = gun_width*gun_height
        var x_tip = mean(get_x1,get_x2)*ship_grid_size-get_width/2+ship_grid_size/2
        var y_tip = get_y1*ship_grid_size-get_height/2
        
        var dis = point_distance(0,0,x_tip,y_tip)
        var dir = point_direction(0,0,x_tip,y_tip)
        var gun_x = lengthdir_x(dis,dir+get_heading-90)+get_x
        var gun_y = lengthdir_y(dis,dir+get_heading-90)+get_y
        
        var new_damage = entity_create(gun_x,gun_y,entity.damage)
        map_set(new_damage,"parent",get_entity)
        map_set(new_damage,"heading",get_heading)
        map_set(new_damage,"direction",get_heading)
        map_set(new_damage,"speed",10)
        map_set(new_damage,"damage",gun_size)
        }
    }
