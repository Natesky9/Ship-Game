///Event_Draw()

//draw grid
var inc = view_wview[0]/room_width
var v_inc = inc*12
var h_inc = inc*16
var x1 = view_get(4)
var y1 = view_get(8)
var x2 = view_get(6)
var y2 = view_get(2)

var y_line = y1 div 64
var x_line = x1 div 64
var x_start = x_line*64
var y_start = y_line*64

color(c_blue)
draw_line(x1,y_start,x2,y_start)
draw_line(x_start,y1,x_start,y2)


color(c_green)
draw_line(x1,y1,x2,y2)

if keyboard_check(ord("I"))
debug("inc is: " + string(inc))

for (var v = 0;v < v_inc+1;v++)
    {
    color(c_green)
    var y_line = y_start+room_height/v_inc*v*inc
    draw_line(x1,y_line,x2,y_line)
    }
    
for (var h = 0; h < h_inc+1;h++)
    {
    color(c_blue)
    var x_line = x_start+room_width/(inc*16)*h*inc
    draw_line(x_line,y1,x_line,y2)
    }

var view_size = "[" + string(view_wview[0]) + "," + string(view_hview[0])
var view_anchor = "<"+string(x1)+","+string(y1)+" to "+string(x2)+","+string(y2)+">"
align(1)
draw_text(x1,y2,view_size)
draw_text(x1,y2-32,view_anchor)
//end drawing grid

//draw mouse effect
if mouse_check_button(mb_right)
    {
    color(c_red)
    var view_x_center = view_xview[0]+view_wview[0]/2
    var view_y_center = view_yview[0]+view_hview[0]/2
    draw_line(view_x_center,view_y_center,mouse_x,mouse_y)
    }
//end draw mouse

//
draw_entities()
if ship
    {
    var ship_x = ds_get(ship_id,"x")
    var ship_y = ds_get(ship_id,"y")
    
    view_center(ship_x,ship_y)
    }
//

var selected

//draw debug menu
color(c_black)
draw_line(0,64,room_width,64);
var inc = room_width/5

//text offset
text_h_off = inc/2
text_v_off = 64/2

for (var a = 1;a <= 5;a++)
    {
    selected = false
    color(c_dkgray)
    align(5)
    draw_line(a*inc,0,a*inc,64)
    
    //text
    if a == menu
    selected = true
    
    color(c_black)
//----------//
    if a == 1
        {
        //draw the entity tab
        if selected
        color(c_blue)
        draw_text(a*inc - text_h_off,text_v_off,"Entities")
        
        if not selected
        continue
        
        //draw background box
        color(c_aqua)
        draw_rectangle(0,64,room_width,128,false)
        color(c_black)
        draw_rectangle(0,64,room_width,128,true)
        align(7)
        
        if ds_list_size(entity_list)
        for (var i = 0;i <ds_list_size(entity_list);i++)
            {
            var get_entity = ds_list_find_value(entity_list,i)
            
            draw_text((i div 4)*100,64+16*(i mod 4),"entity: " + string(get_entity))
            //debug(" i is: " + string(i))
            //debug("drawing entity in list: " + string(get_entity))
            }
        else
            {
            color(c_black)
            align(7)
            //debug("drawing no entities")
            //draw_text(0,64,"no entities")
            }
        }
//----------//
    if a == 2
        {
        draw_text(a*inc - text_h_off,text_v_off,"new entity")
        }
//----------//
    }

if menu == 2
    {
    color(c_orange)
    draw_rectangle(0,64,room_width,128,false)
    color(c_black)
    draw_rectangle(0,64,room_width,128,true)
    }
if menu == 3
    {
    color(c_lime)
    draw_rectangle(0,64,room_width,128,false)
    color(c_black)
    draw_rectangle(0,64,room_width,128,true)
    }
