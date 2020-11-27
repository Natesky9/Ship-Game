///enum_display
//a list of the interfaces
var value = argument0
enum ui
    {
    null,
    inventory,
    craft,
    dock,
    build,
    drill,
    types
    }

switch value
    {
    case ui.null:
        return "nothing"
    case ui.inventory:
        return "inv"
    case ui.craft:
        return "craft"
    case ui.dock:
        return "dock"
    case ui.build:
        return "build"
    default:
        return "oops"
    }
