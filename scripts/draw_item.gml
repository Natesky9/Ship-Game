///draw_item(x,y,item)
//draws an item
var get_x = argument0
var get_y = argument1
var get_item = argument2
var color = item_color(get_item)



switch get_item
    {
    case item.null:
        exit
    case item.rockred:
    case item.rockblue:
    case item.rockgreen:
        {
        draw_tri(get_x,get_y,color)
        break
        }
    case item.orered:
    case item.oreblue:
    case item.oregreen:
        {
        draw_ore(get_x,get_y,color)
        break
        }
    case item.refinedred:
    case item.refinedblue:
    case item.refinedgreen:
        {
        draw_refined(get_x,get_y,color)
        break
        }
    default:
        {
        draw_set_color(c_aqua)
        draw_circle(get_x,get_y,5,false)
        break
        }
    }
