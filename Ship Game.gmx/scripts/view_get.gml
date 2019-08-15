///view_get(number)
//returns the coordinate for the
//numpad equivilent
var get_edge = argument0

switch get_edge
    {
    case 4:
        {
        return view_xview[0]
        }
    case 8:
        {
        return view_yview[0]
        }
    case 6:
        {
        return view_xview[0]+view_wview[0]
        }
    case 2:
        {
        return view_yview[0]+view_hview[0]
        }
    default:
        {
        debug("Error, view_get() was passed an invalid edge!")
        return false
        }
    }
