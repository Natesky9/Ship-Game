///item_color(value)
//outputs the color for a value
var get_value = argument0

switch get_value
    {
    case item.rockred:
        return c_red
    case item.rockblue:
        return c_blue
    case item.rockgreen:
        return c_olive
    case item.orered:
        return c_maroon
    case item.oreblue:
        return c_aqua
    case item.oregreen:
        return c_green
    //done with ores
    default:
        return make_colour_hsv(get_value * 255/item.types,255,255)
    }
