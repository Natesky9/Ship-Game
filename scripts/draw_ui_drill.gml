///draw_ui_drill()
//draws the laser ui
var x1 = room_width
var y1 = room_height
var x2 = room_width-200
var y2 = room_height-200
set_color(c_gray)
draw_rectangle(x1,y1,x2,y2,false)
set_color(c_black)
draw_rectangle(x1,y1,x2,y2,true)
align(2)

var get_ship_heading = map_get(myship,"heading")
var get_ship_x = map_get(myship,"x")
var get_ship_y = map_get(myship,"y")
var laser_x = get_ship_x + lengthdir_x(128,get_ship_heading)
var laser_y = get_ship_y + lengthdir_y(128,get_ship_heading)

var rock_count = list_size(rock_list)

var drill_progress = map_get(myship,"drill progress")
var drill_entity = map_get(myship,"drill entity")
var drill_x = map_get(myship,"drill x")
var drill_y = map_get(myship,"drill y")
var drill_heat = map_get(myship,"drill heat")

get_item = 0
if not is_undefined(drill_entity)
    {
    var get_grid = map_get(drill_entity,"grid")
    var get_cell = ds_grid_get(get_grid,drill_x,drill_y)
    var get_item = get_cell
    
    }

//draw the drill progress bar
var mean_x = mean(x1,x2)
var mean_y = mean(y1,y2)
var bar_x1 = x2 + 16
var bar_x2 = x1 - 16
var bar_y1 = y2 + 16
var bar_y2 = y2 + 32
var percent = (bar_x2 - bar_x1)/100*drill_progress
set_color(c_red)
draw_rectangle(bar_x1,bar_y1,bar_x1+percent,bar_y2,false)
set_color(c_black)
draw_rectangle(bar_x1,bar_y1,bar_x2,bar_y2,true)

//draw the item
if not is_undefined(get_item)
draw_item(mean_x,mean_y,get_item)

//draw the heat
var heat_x1 = x2+16
var heat_x2 = x1-16
var heat_y1 = y1-32
var heat_y2 = y1-16
var heat_bar_x = heat_x1 + (heat_x2-heat_x1)/1000*drill_heat

var heat_color = make_color_hsv((1000-drill_heat)/1000*128,255,255)
draw_set_color(heat_color)
draw_rectangle(heat_x1,heat_y1,heat_bar_x,heat_y2,false)
draw_set_color(c_black)
draw_rectangle(heat_x1,heat_y1,heat_x2,heat_y2,true)
draw_text(mean_x,heat_y1-16,"Drill Heat")

if drill_heat >= 1000
    {
    var flash = (current_time div 500) mod 2
    if flash
    set_color(c_yellow)
    else
    set_color(c_white)
    draw_text(mean_x,heat_y2,"Drill Overheat!")
    }
