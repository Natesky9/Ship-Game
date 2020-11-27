///enum_item(enum.item)
//returns the string of the item
var get_item = argument0

enum item
    {
    null,
    rockred,
    rockblue,
    rockgreen,
    orered,
    oreblue,
    oregreen,
    refinedred,
    refinedblue,
    refinedgreen,
    componentred,
    componentblue,
    componentgreen,
    advancedred,
    advancedblue,
    advancedgreen,
    types
    }

switch get_item
    {
    case item.null:
        return "nothing"
    case item.rockred:
        return "regolith"
    case item.rockblue:
        return "formicite"
    case item.rockgreen:
        return "granite"
        
    case item.orered:
        return "ferrite"
    case item.oreblue:
        return "cobalt"
    case item.oregreen:
        return "coprite"
        
    case item.refinedred:
        return "wafer"
    case item.refinedblue:
        return "cobar"
    case item.refinedgreen:
        return "ranod"
    
    case item.componentred:
        return "red+"
    case item.componentblue:
        return "blue+"
    case item.componentgreen:
        return "green+"
    
    case item.advancedred:
        return "red++"
    case item.advancedblue:
        return "blue++"
    case item.advancedgreen:
        return "green++"
    
    default:
        return "error, item has no name!"
    }
