///Event_Draw()

//
draw_entities()
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
