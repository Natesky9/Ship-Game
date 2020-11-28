///keyboard_pressed_o()
if not keyboard_check_pressed(ord("O"))
exit

var get_entity = list_get(ship_list,0)
var is_docked = map_get(get_entity,"docked")




switch ui_type
    {
    case ui.inventory:
        {
        //move the top item to the bottom
        var get_inventory = inventory
        var get_keys = map_get(get_inventory,"keys")
        var get_first = list_get(get_keys,0)
        ds_list_delete(get_keys,0)
        ds_list_add(get_keys,get_first)
        exit
        }
    case ui.build:
        {
        if is_docked
            {
            ui_type = ui.dock
            game_mode = mode.trade_menu
            show("leaving edit mode")
            }
        exit
        }
    case ui.dock:
        {
        //if docked, undock
        var is_docked = map_get(myship,"docked")
        if is_docked
            {
            map_set(myship,"docked",false)
            ui_type = ui.null
            game_mode = mode.free_flight
            exit
            }
        //
        var get_x = map_get(myship,"x")
        var get_y = map_get(myship,"y")
        var shipyard_size = list_size(shipyard_list)
        for (var i = 0;i < shipyard_size;i++)
            {
            var get_shipyard = list_get(shipyard_list,i)
            var shipyard_x = map_get(get_shipyard,"x")
            var shipyard_y = map_get(get_shipyard,"y")
            var get_distance = point_distance(get_x,get_y,shipyard_x,shipyard_y)
            
            if get_distance < 128
                {
                map_set(myship,"x",shipyard_x)
                map_set(myship,"y",shipyard_y)
                map_set(myship,"docked",true)
                map_set(myship,"docked to",get_shipyard)
                ui_type = ui.build
                game_mode = mode.ship_edit
                exit
                }
            }
        //
        ui_type = ui.null
        exit
        }
    case ui.craft:
        {
        ui_type = ui.dock
        exit
        }
    default:
        {
        ui_type = ui.dock
        exit
        }
    }
