///draw_drill()
//draws the drill effect

var get_ship_x = map_get(myship,"x")
var get_ship_y = map_get(myship,"y")

var get_drill = map_get(myship,"drill")
//if we're not drilling, exit
if not get_drill
exit
var get_drill_progress = map_get(myship,"drill progress")
var get_drill_entity = map_get(myship,"drill entity")
var get_drill_x = map_get(myship,"drill x")
var get_drill_y = map_get(myship,"drill y")

if is_undefined(get_drill_entity)
exit

var get_grid = map_get(get_drill_entity,"grid")
var x_offset = map_get(get_drill_entity,"x offset")
var y_offset = map_get(get_drill_entity,"y offset")
var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)

var get_value = ds_grid_get(get_grid,get_drill_x,get_drill_y)
if get_value
    {
    show("drawing animation")
    var rock_x = map_get(get_drill_entity,"x")
    var rock_y = map_get(get_drill_entity,"y")
    var cell_point = hex_cell_to_point(get_drill_entity,get_drill_x,get_drill_y)
    var cell_x = cell_point[0] + rock_x - x_offset
    var cell_y = cell_point[1] + rock_y - y_offset
    
    set_color(c_blue)
    //draw_line(get_ship_x,get_ship_y,cell_x,cell_y)
    var drill_distance = point_distance(get_ship_x,get_ship_y,cell_x,cell_y)
    var drill_direction = point_direction(get_ship_x,get_ship_y,cell_x,cell_y)
    //draw the center beam
    var tri_x = lengthdir_x(drill_distance/10,drill_direction+90)
    var tri_y = lengthdir_y(drill_distance/10,drill_direction+90)
    var tri_mean_x = mean(get_ship_x,cell_x)
    var tri_mean_y = mean(get_ship_y,cell_y)
    draw_set_color(c_maroon)
    draw_triangle(get_ship_x,get_ship_y,tri_mean_x+tri_x,tri_mean_y+tri_y,tri_mean_x-tri_x,tri_mean_y-tri_y,false)
    draw_triangle(cell_x,cell_y,tri_mean_x+tri_x,tri_mean_y+tri_y,tri_mean_x-tri_x,tri_mean_y-tri_y,false)
    //draw the animated lines
    for(var i = 0;i < drill_distance;i++)
        {
        var amp1 = 10*sin(current_time/100)
        var amp2 = 10*sin(current_time/100+240)
        var amp3 = 10*sin(current_time/100+480)
        
        var x_wave1 = lengthdir_x(amp1*sin(2*pi*i/drill_distance),drill_direction+90)
        var y_wave1 = lengthdir_y(amp1*sin(2*pi*i/drill_distance),drill_direction+90)
        var point_x1 = get_ship_x + lengthdir_x(i,drill_direction) + x_wave1
        var point_y1 = get_ship_y + lengthdir_y(i,drill_direction) + y_wave1
        var x_wave2 = lengthdir_x(amp2*sin(2*pi*i/drill_distance),drill_direction+90)
        var y_wave2 = lengthdir_y(amp2*sin(2*pi*i/drill_distance),drill_direction+90)
        var point_x2 = get_ship_x + lengthdir_x(i,drill_direction) + x_wave2
        var point_y2 = get_ship_y + lengthdir_y(i,drill_direction) + y_wave2
        var x_wave3 = lengthdir_x(amp3*sin(2*pi*i/drill_distance),drill_direction+90)
        var y_wave3 = lengthdir_y(amp3*sin(2*pi*i/drill_distance),drill_direction+90)
        var point_x3 = get_ship_x + lengthdir_x(i,drill_direction) + x_wave3
        var point_y3 = get_ship_y + lengthdir_y(i,drill_direction) + y_wave3
        
        set_color(c_lime)
        draw_point(point_x1,point_y1)
        set_color(c_fuchsia)
        draw_point(point_x2,point_y2)
        set_color(c_yellow)
        draw_point(point_x3,point_y3)
        }
    
    //draw_text(rock_x,rock_y,string(get_drill_progress) + "%")
    }
