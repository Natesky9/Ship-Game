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
    exit
    }
align(7)
for (var i = part.null;i < part.types;i++)
    {
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
