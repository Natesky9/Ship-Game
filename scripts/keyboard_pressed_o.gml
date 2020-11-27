///keyboard_pressed_o()
if not keyboard_check_pressed(ord("O"))
exit

var get_entity = list_get(ship_list,0)


//build
//old, move to ui_type
/*if game_mode = mode.ship_edit
    {
    var get_entity = list_get(ship_list,0)
    var get_grid = map_get(get_entity,"grid")
    var edit_x = map_get(get_entity,"edit x")
    var edit_y = map_get(get_entity,"edit y")
    
    var inspection = verify_grid(get_grid)
    map_set(get_entity,"layout",inspection)
    //get current value
    //var get_value = ds_grid_get(get_grid,edit_x,edit_y)
    //ds_grid_set(get_grid,edit_x,edit_y,part.null)
    exit
    }
*/

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
        ui_type = ui.dock
        show("leaving edit mode")
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
