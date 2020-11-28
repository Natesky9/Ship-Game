///part_color(part.type)
//returns the color of a ship part
var get_part = argument0

switch get_part
    {
    case part.computer:
        {
        return c_blue
        }
    case part.hull:
        {
        return c_aqua
        }
    case part.engine:
        {
        return c_yellow
        }
    case part.cargo:
        {
        return c_green
        }
    case part.drill:
        {
        return c_navy
        }
    case part.gun:
        {
        return c_red
        }
    default:
        {
        return c_black
        }
    }
