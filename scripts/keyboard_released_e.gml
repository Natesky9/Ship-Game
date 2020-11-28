///keyboard_released_e()
if not keyboard_check_released(ord("E"))
exit

var get_entity = list_get(ship_list,0)

switch game_mode
    {
    case mode.ship_edit:
        {
        exit
        }
    case mode.fine_flight:
    case mode.free_flight:
        {
        map_set(get_entity,"thrust",0)
        exit
        }
    case mode.trade_menu:
        {
        exit
        }
    }
