///keyboard_pressed_f()
if not keyboard_check_pressed(ord("F"))
exit

var get_entity = list_get(ship_list,0)

switch game_mode
    {
    case mode.ship_edit:
        {
        var get_entity = list_get(entity_list,0)
        var get_grid = map_get(get_entity,"grid")
        var get_grid_width = ds_grid_width(get_grid)
        var edit_x = map_get(get_entity,"edit x")
        map_set(get_entity,"edit x",min(get_grid_width-1,edit_x+1))
        exit
        }
    case mode.free_flight:
        {
        map_set(get_entity,"steer",-1)
        exit
        }
    case mode.trade_menu:
        {
        exit
        }
    }
