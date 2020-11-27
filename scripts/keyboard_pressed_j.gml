///keyboard_pressed_j
if not keyboard_check_pressed(ord("J"))
exit

if game_mode = mode.ship_edit
    {
    var get_entity = list_get(ship_list,0)
    var get_grid = map_get(get_entity,"grid")
    var edit_x = map_get(get_entity,"edit x")
    var edit_y = map_get(get_entity,"edit y")
    //get current value
    var get_value = ds_grid_get(get_grid,edit_x,edit_y)
    ds_grid_set(get_grid,edit_x,edit_y,edit_value)
    var inspection = verify_grid(get_grid)
    map_set(get_entity,"layout",inspection)
    exit
    }

//craft
switch ui_type
    {
    case ui.inventory:
        {
        var get_inventory = inventory
        var keys = map_get(get_inventory,"keys")
        ds_list_sort(keys,true)
        exit
        }
    case ui.build:
        {
        var get_entity = list_get(ship_list,0)
        var get_grid = map_get(get_entity,"grid")
        var edit_x = map_get(get_entity,"edit x")
        var edit_y = map_get(get_entity,"edit y")
        //get current value
        var get_value = ds_grid_get(get_grid,edit_x,edit_y)
        ds_grid_set(get_grid,edit_x,edit_y,edit_value)
        var inspection = verify_grid(get_grid)
        map_set(get_entity,"layout",inspection)
        exit
        }
    case ui.craft:
        {
    ui_type = ui.null
        exit
        }
    default:
        {
        ui_type = ui.craft
        }
    }
