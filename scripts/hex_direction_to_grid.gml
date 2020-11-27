///hex_direction_to_grid(direction,x,y)
//returns the x and y distance
//from the direction of a hex
//neighbor, based on the
//odd-q, flat-topped hex grid

var get_direction = argument0;
var get_x = argument1
var get_y = argument2
var coords;

coords[0] = 0
coords[1] = 0

switch get_direction
    {
    case side.up:
        {
        coords[1] = -1
        break;
        }
    case side.down:
        {
        coords[1] = 1
        break;
        }
    case side.upleft:
        {
        coords[0] = -1
        if not (get_x mod 2)
        coords[1] = -1
        break;
        }
    case side.upright:
        {
        coords[0] = 1
        if not (get_x mod 2)
        coords[1] = -1
        break;
        }
    case side.downleft:
        {
        coords[0] = -1
        if (get_x mod 2)
        coords[1] = 1
        break;
        }
    case side.downright:
        {
        coords[0] = 1
        if (get_x mod 2)
        coords[1] = 1
        break;
        }
    default:
        {
        show("You passed a null direction to hex_direction_to_grid, dummy!")
        }
    }
return coords
