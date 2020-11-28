///add_grid_damage(entity,x,y,damage)
//does damage to a ship? grid
//positive does damage, negative heals
var get_entity = argument0
var get_x = argument1
var get_y = argument2
var get_damage = argument3
var get_integrity = map_get(get_entity,"integrity")
var get_type = map_get(get_entity,"type")
var get_grid = map_get(get_entity,"grid")
var get_layout = map_get(get_entity,"layout")
var get_part = ds_grid_get(get_grid,get_x,get_y)
var get_health = ds_grid_get(get_integrity,get_x,get_y)

var final_health = clamp(get_health-get_damage,0,100)

//loop through all the ship groups to check if it's in one
if get_type == entity.ship
    {
    var groups = array_height_2d(get_layout)
    for (var i = 0;i < groups;i++)
        {
        var get_group_part = get_layout[i,0]
        var get_x1 = get_layout[i,1]
        var get_y1 = get_layout[i,2]
        var get_x2 = get_layout[i,3]
        var get_y2 = get_layout[i,4]
        
        if get_part != get_group_part
            continue
        if get_x < get_x1
        or get_x > get_x2
        or get_y < get_y1
        or get_y > get_y2
            continue
        
        ds_grid_set_region(get_integrity,get_x1,get_y1,get_x2,get_y2,final_health)
        return true
        }
    }
//otherwise, set that cell damage
ds_grid_set(get_integrity,get_x,get_y,final_health)
return true
