///Event_Drill()
//test for asteroid in front
//old code, to be moved to another function
var get_drill = map_get(myship,"drill")
if not get_drill
exit

var get_ship_heading = map_get(myship,"heading")
var get_ship_x = map_get(myship,"x")
var get_ship_y = map_get(myship,"y")
var drill_progress = map_get(myship,"drill progress")
var drill_entity = map_get(myship,"drill entity")
var drill_x = map_get(myship,"drill x")
var drill_y = map_get(myship,"drill y")
var drill_heat = map_get(myship,"drill heat")
//start test
map_set(myship,"drill progress",0)
get_value = false
for (var i = 1;i < 8;i++)
    {
    var laser_x = get_ship_x + lengthdir_x(i*16,get_ship_heading)
    var laser_y = get_ship_y + lengthdir_y(i*16,get_ship_heading)
    
    //effect_create_above(ef_spark,laser_x,laser_y,0,c_red)
    var rock_count = list_size(rock_list)
    
    
    for (var r=0;r<rock_count;r++)
        {
        var get_entity = ds_list_find_value(rock_list,r)
        var get_rock_x = map_get(get_entity,"x")
        var get_rock_y = map_get(get_entity,"y")
        var get_grid = map_get(get_entity,"grid")
        var get_width = ds_grid_width(get_grid)
        var get_height = ds_grid_height(get_grid)
        var get_point = point_to_hex_grid(get_entity,laser_x,laser_y)
        var get_point_x = get_point[0]
        var get_point_y = get_point[1]
        if not grid_in_bounds(get_width,get_height,get_point_x,get_point_y)
            continue
        get_value = ds_grid_get(get_grid,get_point_x,get_point_y)
        var cell = hex_cell_to_point(get_entity,get_point_x,get_point_y)
        var cell_x = cell[0]
        var cell_y = cell[1]
        //effect_create_above(ef_spark,get_rock_x+cell_x,get_rock_y+cell_y,0,c_orange)
        if get_value
            {
            if get_entity != drill_entity
            or drill_x != get_point_x
            or drill_y != get_point_y
                {
                map_set(myship,"drill progress",0)
                map_set(myship,"drill entity",get_entity)
                map_set(myship,"drill x",get_point_x)
                map_set(myship,"drill y",get_point_y)
                show("found a new rock to drill!")
                break
                }
            
            
            
            map_set(myship,"drill progress",drill_progress+1)
            
            if drill_progress >= 100
                {
                grid_set(get_entity,get_grid,get_point_x,get_point_y,0)
                map_set(myship,"drill progress",0)
                
                var get_item = entity_create(laser_x,laser_y,entity.item)
                map_set(get_item,"item",get_value)
                }
            break
            }
        }
    if get_value
    break
    }

//heat values
if get_value
map_set(myship,"drill heat",min(1000,drill_heat+1))
else
map_set(myship,"drill heat",max(0,drill_heat-1))
