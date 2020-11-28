///draw_drill()
//draws the drill effect

var get_x = map_get(myship,"x")
var get_y = map_get(myship,"y")
var get_heading = map_get(myship,"heading")
var get_grid = map_get(myship,"grid")
var layout = map_get(myship,"layout")
    var get_width = ds_grid_width(get_grid)*ship_grid_size
    var get_height = ds_grid_height(get_grid)*ship_grid_size

var get_drill = map_get(myship,"drill")
//if we're not drilling, exit
if not get_drill
exit
var get_drill_entity = map_get(myship,"drill entity")
var get_drill_x = map_get(myship,"drill x")
var get_drill_y = map_get(myship,"drill y")

if is_undefined(get_drill_entity)
exit

var get_grid = map_get(get_drill_entity,"grid")
var x_offset = map_get(get_drill_entity,"x offset")
var y_offset = map_get(get_drill_entity,"y offset")

var get_value = ds_grid_get(get_grid,get_drill_x,get_drill_y)
if get_value
    {
    //get the rock stuff
    var rock_x = map_get(get_drill_entity,"x")
    var rock_y = map_get(get_drill_entity,"y")
    var cell_point = hex_cell_to_point(get_drill_entity,get_drill_x,get_drill_y)
    var cell_x = cell_point[0] + rock_x - x_offset
    var cell_y = cell_point[1] + rock_y - y_offset
    //loop through all drills
    var layout_size = array_height_2d(layout)
    for (var g = 0;g < layout_size;g++)
        {
        var get_part = layout[g,0]
        var get_x1 = layout[g,1]
        var get_y1 = layout[g,2]
        var get_x2 = layout[g,3]
        var get_y2 = layout[g,4]
        if get_part != part.drill
            continue
        var drill_width = get_x2-get_x1+1
        var drill_height = get_y2-get_y1+1
        var drill_size = drill_width*drill_height
        var x_tip = mean(get_x1,get_x2)*ship_grid_size-get_width/2+ship_grid_size/2
        var y_tip = get_y1*ship_grid_size-get_height/2
        
        var dis = point_distance(0,0,x_tip,y_tip)
        var dir = point_direction(0,0,x_tip,y_tip)
        var drill_x = lengthdir_x(dis,dir+get_heading-90)+get_x
        var drill_y = lengthdir_y(dis,dir+get_heading-90)+get_y
        
        set_color(c_green)
        draw_line(cell_x,cell_y,drill_x,drill_y)
        }
    exit
    
    set_color(c_blue)
    //draw_line(get_x,get_y,cell_x,cell_y)
    var drill_distance = point_distance(get_x,get_y,cell_x,cell_y)
    var drill_direction = point_direction(get_x,get_y,cell_x,cell_y)
    //draw the center beam
    var tri_x = lengthdir_x(drill_distance/10,drill_direction+90)
    var tri_y = lengthdir_y(drill_distance/10,drill_direction+90)
    var tri_mean_x = mean(get_x,cell_x)
    var tri_mean_y = mean(get_y,cell_y)
    draw_set_color(c_maroon)
    draw_set_alpha(.2)
    draw_triangle(get_x,get_y,tri_mean_x+tri_x,tri_mean_y+tri_y,tri_mean_x-tri_x,tri_mean_y-tri_y,false)
    draw_triangle(cell_x,cell_y,tri_mean_x+tri_x,tri_mean_y+tri_y,tri_mean_x-tri_x,tri_mean_y-tri_y,false)
    draw_set_alpha(1)
    //draw the animated lines
    for(var i = 0;i < drill_distance;i++)
        {
        var amp1 = 10*sin(current_time/100)
        var amp2 = 10*sin(current_time/100+240)
        var amp3 = 10*sin(current_time/100+480)
        
        var x_wave1 = lengthdir_x(amp1*sin(2*pi*i/drill_distance),drill_direction+90)
        var y_wave1 = lengthdir_y(amp1*sin(2*pi*i/drill_distance),drill_direction+90)
        var point_x1 = get_x + lengthdir_x(i,drill_direction) + x_wave1
        var point_y1 = get_y + lengthdir_y(i,drill_direction) + y_wave1
        var x_wave2 = lengthdir_x(amp2*sin(2*pi*i/drill_distance),drill_direction+90)
        var y_wave2 = lengthdir_y(amp2*sin(2*pi*i/drill_distance),drill_direction+90)
        var point_x2 = get_x + lengthdir_x(i,drill_direction) + x_wave2
        var point_y2 = get_y + lengthdir_y(i,drill_direction) + y_wave2
        var x_wave3 = lengthdir_x(amp3*sin(2*pi*i/drill_distance),drill_direction+90)
        var y_wave3 = lengthdir_y(amp3*sin(2*pi*i/drill_distance),drill_direction+90)
        var point_x3 = get_x + lengthdir_x(i,drill_direction) + x_wave3
        var point_y3 = get_y + lengthdir_y(i,drill_direction) + y_wave3
        
        set_color(c_lime)
        draw_point(point_x1,point_y1)
        set_color(c_fuchsia)
        draw_point(point_x2,point_y2)
        set_color(c_yellow)
        draw_point(point_x3,point_y3)
        }
    }
