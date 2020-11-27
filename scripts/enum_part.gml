///part_name(enum.part)
//returns the string of the part
var get_value = argument0
enum part
    {
    null,
    computer,
    hull,
    engine,
    cargo,
    drill,
    gun,
    types
    }

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
    case part.drill:
        return "drill"
    default:
        return "error"
    }
