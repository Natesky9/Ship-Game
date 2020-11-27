///part_name(part.type)
//returns the name of the part
var get_value = argument0

switch get_value
    {
    case part.null:
        return "nothing"
    case part.computer:
        return "computer"
    case part.hull:
        return "hull"
    case part.engine:
        return "engine"
    case part.cargo:
        return "cargo"
    case part.gun:
        return "gun"
    default:
        return "error"
    }
