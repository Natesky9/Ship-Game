///draw_ui_bar()
var x1 = room_width
var y1 = room_height
var x2 = room_width-ui.types*64
var y2 = room_height-64

//set_color(c_aqua)
//draw_rectangle(x1,y1,x2,y2,false)
//set_color(c_black)
//draw_rectangle(x1,y1,x2,y2,true)

var width = x2 - x1
align(5)
//start at first value
for (var i = 1;i < ui.types;i++)
    {
    var button_x1 = x1+width/ui.types*i
    var button_x2 = button_x1 - width/ui.types
    draw_roundrect(button_x1,y1,button_x2,y2,true)
    var mean_x = mean(button_x1,button_x2)
    var mean_y = mean(y1,y2)
    switch i
        {
        case ui.inventory:
            {
            text1 = "inv"
            text2 = "I"
            break
            }
        case ui.craft:
            {
            text1 = "craft"
            text2 = "J"
            break
            }
        case ui.dock:
            {
            text1 = "dock"
            text2 = "O"
            break
            }
        case ui.build:
            {
            text1 = "ship"
            text2 = "L"
            break
            }
        case ui.drill:
            {
            //drill is done
            text1 = "drill"
            text2 = "U"
            break
            }
        default:
            {
            text1 = "???"
            text2 = "?"
            break
            }
        }
    align(2)
    draw_text(mean_x,mean_y,text1)
    align(8)
    draw_text(mean_x,mean_y,text2)
    }
