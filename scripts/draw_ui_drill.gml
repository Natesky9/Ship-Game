///draw_ui_drill()
//draws the laser ui
var x1, y1, x2, y2, get_ship_heading, get_ship_x, get_ship_y, laser_x, laser_y, 
    drill_entity, drill_x, drill_y, drill_heat, drill_count, drill_overheat, 
    drill_progress, mean_x, mean_y, bar_x1, bar_y1, bar_x2, bar_y2, 
    get_grid, get_cell, get_item, heat_x1, heat_y1, heat_x2, heat_y2, 
    heat_bar_x, heat_color, flash
x1 = room_width
y1 = room_height
x2 = room_width-200
y2 = room_height-200
set_color(c_gray)
draw_rectangle(x1,y1,x2,y2,false)
set_color(c_black)
draw_rectangle(x1,y1,x2,y2,true)
align(2)

get_ship_heading = map_get(myship,"heading")
get_ship_x = map_get(myship,"x")
get_ship_y = map_get(myship,"y")
laser_x = get_ship_x + lengthdir_x(128,get_ship_heading)
laser_y = get_ship_y + lengthdir_y(128,get_ship_heading)

drill_entity = map_get(myship,"drill entity")
drill_x = map_get(myship,"drill x")
drill_y = map_get(myship,"drill y")
drill_heat = map_get(myship,"drill heat")
drill_count = map_get(myship,"drill count")
drill_overheat = map_get(myship,"drill overheat")

if is_undefined(drill_entity)
    drill_progress = 0
else
    drill_progress = 100-get_grid_damage(drill_entity,drill_x,drill_y)

mean_x = mean(x1,x2)
mean_y = mean(y1,y2)

if not drill_count
    {
    align(5)
    draw_text(mean_x,mean_y,"You must have#a drill installed#to mine!")
    exit
    }

//draw the drill progress bar
bar_x1 = x2 + 16
bar_x2 = x1 - 16
bar_y1 = y2 + 16
bar_y2 = y2 + 32
percent = (bar_x2 - bar_x1)/100*drill_progress
set_color(c_red)
draw_rectangle(bar_x1,bar_y1,bar_x1+percent,bar_y2,false)
set_color(c_black)
draw_rectangle(bar_x1,bar_y1,bar_x2,bar_y2,true)

get_item = 0
if not is_undefined(drill_entity)
    {
    get_grid = map_get(drill_entity,"grid")
    get_cell = ds_grid_get(get_grid,drill_x,drill_y)
    get_item = get_cell
    }
//draw the item
if not is_undefined(get_item)
draw_item(mean_x,mean_y-64,get_item)

//draw the heat
heat_x1 = x2+16
heat_x2 = x1-16
heat_y1 = y1-32
heat_y2 = y1-16
heat_bar_x = heat_x1 + (heat_x2-heat_x1)/drill_overheat*drill_heat

heat_color = make_color_hsv((1000-drill_heat)/1000*128,255,255)
draw_set_color(heat_color)
draw_rectangle(heat_x1,heat_y1,heat_bar_x,heat_y2,false)
draw_set_color(c_black)
draw_rectangle(heat_x1,heat_y1,heat_x2,heat_y2,true)
draw_text(mean_x,heat_y1-16,"Drill Heat")
draw_text(mean_x,heat_y1-48,"Overheat temp: " + string(drill_overheat))

if drill_heat >= drill_overheat
    {
    flash = (current_time div 500) mod 2
    if flash
    set_color(c_yellow)
    else
    set_color(c_white)
    draw_text(mean_x,heat_y2,"Drill Overheat!")
    }
