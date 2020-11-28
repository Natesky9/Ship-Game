///Event_Drill()
//test for asteroid in front
//old code, to be moved to another function
var get_drill = map_get(myship,"drill")
if not get_drill
exit

var get_ship_heading = map_get(myship,"heading")
var get_ship_x = map_get(myship,"x")
var get_ship_y = map_get(myship,"y")
var drill_entity = map_get(myship,"drill entity")
var drill_x = map_get(myship,"drill x")
var drill_y = map_get(myship,"drill y")
var drill_heat = map_get(myship,"drill heat")
var drill_count = map_get(myship,"drill count")
var drill_overheat = map_get(myship,"drill overheat")

//if no drills, nothing to do here
if not drill_count
exit

//start test
get_value = 0
for (var i = 1;i < 16;i++)
    {
    var laser_x = get_ship_x + lengthdir_x(i*16,get_ship_heading)
    var laser_y = get_ship_y + lengthdir_y(i*16,get_ship_heading)
    
    if keyboard_check(vk_control)
        effect_create_above(ef_spark,laser_x,laser_y,0,c_red)
    var rock_count = list_size(rock_list)
    
    
    for (var r=0;r<rock_count;r++)
        {
        var get_rock = ds_list_find_value(rock_list,r)
        var get_rock_x = map_get(get_rock,"x")
        var get_rock_y = map_get(get_rock,"y")
        var get_grid = map_get(get_rock,"grid")
        var get_integrity = map_get(get_rock,"integrity")
        var get_width = ds_grid_width(get_grid)
        var get_height = ds_grid_height(get_grid)
        var cell = point_to_hex_grid(get_rock,laser_x,laser_y)
        var cell_x = cell[0]
        var cell_y = cell[1]
        if not grid_in_bounds(get_width,get_height,cell_x,cell_y)
            continue
        get_value = ds_grid_get(get_grid,cell_x,cell_y)
        if get_value == 0
            continue
        var point = hex_cell_to_point(get_rock,cell_x,cell_y)
        var point_x = point[0]
        var point_y = point[1]
        //effect_create_above(ef_spark,get_rock_x+point_x,get_rock_y+point_y,0,c_orange)
        
            
        if get_rock != drill_entity
        or drill_x != cell_x
        or drill_y != cell_y
            {
            map_set(myship,"drill entity",get_rock)
            map_set(myship,"drill x",cell_x)
            map_set(myship,"drill y",cell_y)
            show("found a new rock to drill!")
            break
            }
        
        //add drill_count to the drill progress
        map_set(myship,"drill entity",drill_entity)
        add_grid_damage(get_rock,cell_x,cell_y,drill_count)
        entity_create_hex_vertex_buffer(get_rock)
        
        var get_damage = get_grid_damage(get_rock,cell_x,cell_y)
        //if we broke a cell
        if not get_damage
            {
            map_set(myship,"drill entity",undefined)
            grid_set(get_rock,get_grid,cell_x,cell_y,0)
            show("broke a rock")
            var get_item = entity_create(laser_x,laser_y,entity.item)
            map_set(get_item,"item",get_value)
            map_set(get_item,"direction",irandom(360))
            map_set(get_item,"speed",.3)
            }
        break
        }
    if get_value
        break
    map_set(myship,"drill entity",undefined)
    }

//heat values
if get_value
map_set(myship,"drill heat",min(drill_overheat,drill_heat+1))
else
map_set(myship,"drill heat",max(0,drill_heat-1))
