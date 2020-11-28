///enum_entity(entity.type)
var get_type = argument0

enum entity
    {
    null,
    ship,
    rock,
    item,
    shipyard,
    damage,
    types
    }

switch get_type
    {
    case entity.null:
        return "nothing"
    case entity.ship:
        return "ship"
    case entity.rock:
        return "rock"
    case entity.item:
        return "item"
    case entity.shipyard:
        return "shipyard"
    case entity.damage:
        return "bullet"
    }
