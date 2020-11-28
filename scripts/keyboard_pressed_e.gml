///keyboard_pressed_e()
if not keyboard_check_pressed(ord("E"))
exit

var get_entity = list_get(ship_list,0)



switch game_mode
    {
    case mode.ship_edit:
        {
        var get_entity = list_get(entity_list,0)
        var get_grid = map_get(get_entity,"grid")
        var get_grid_height = ds_grid_height(get_grid)
        var edit_y = map_get(get_entity,"edit y")
        map_set(get_entity,"edit y",max(0,edit_y-1))
        exit
        }
    case mode.fine_flight:
    case mode.free_flight:
        {
        map_set(get_entity,"thrust",1)
        exit
        }
    case mode.trade_menu:
        {
        exit
        }
    }
