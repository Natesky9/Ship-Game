///draw_ui_build()
//draws the build interface
var x1 = room_width - 400
var y1 = room_height-300
var x2 = room_width
var y2 = room_height
set_color(c_gray)
draw_rectangle(x1,y1,x2,y2,false)
set_color(c_black)
draw_rectangle(x1,y1,x2,y2,true)
align(5)

var is_docked = map_get(myship,"docked")

if not is_docked
    {
    //warn on how to build
    var mean_x = mean(x1,x2)
    var mean_y = mean(y1,y2)
    var flash = (current_time div 500) mod 2
    if flash
    set_color(c_black)
    else
    set_color(c_blue)
    draw_text(mean_x,mean_y,"You must be docked before you can build!")
    }
else
for (var i = part.null;i < part.types;i++)
    {
    align(7)
    var get_name = enum_part(i)
    var color = part_color(i)
    part_x = x1+32
    part_y = y1+32+32*i
    set_color(color)
    draw_rectangle(part_x,part_y,part_x+16,part_y+16,false)
    set_color(c_black)
    draw_text(x1+64,y1+32+32*i,get_name)
    
    if i == edit_value
        {
        set_color(c_black)
        draw_rectangle(part_x-4,part_y-4,part_x+150,part_y+20,true)
        }
    }

//draw the inspection
var x1 = 0
var y1 = room_height-600
var x2 = 300
var y2 = room_height
var get_text, slot

set_color(c_gray)
draw_rectangle(x1,y1,x2,y2,false)
set_color(c_black)
draw_rectangle(x1,y1,x2,y2,true)

var layout = map_get(myship,"layout")
var layout_size = array_height_2d(layout)
for (var i=0;i<layout_size;i++)
    {
    var get_part = layout[i,0]
    var get_x1 = layout[i,1]
    var get_y1 = layout[i,2]
    var get_x2 = layout[i,3]
    var get_y2 = layout[i,4]
    var get_size = (get_x2-get_x1+1)*(get_y2-get_y1+1)
    var get_name = enum_part(get_part)
    set_color(c_black)
    align(7)
    draw_text(x1,y1+i*32,get_name + " x" + string(get_size))
    
    var text_x = x1+120
    var text_y = y1+i*32
    set_color(part_color(get_part))
    switch get_part
        {
        case part.engine:
            {
            var thrust = get_size
            draw_text(text_x,text_y,"thrust + " + string(thrust))
            break
            }
        case part.gun:
            {
            var fire_rate = get_size
            draw_text(text_x,text_y,"firepower + " + string(fire_rate))
            break
            }
        case part.cargo:
            {
            var cargo_size = get_size*20
            draw_text(text_x,text_y,"cargo + " + string(cargo_size))
            break
            }
        case part.drill:
            {
            var drill_speed = get_size
            draw_text(text_x,text_y,"drill speed + " + string(drill_speed))
            break
            }
        case part.computer:
            {
            var oomph = get_size
            draw_text(text_x,text_y,"oomph + " + string(oomph))
            }
        default:
            break
        }
    
    }
