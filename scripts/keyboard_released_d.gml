///keyboard_released_d()
if not keyboard_check_released(ord("D"))
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
        map_set(get_entity,"brake",0)
        exit
        }
    case mode.trade_menu:
        {
        exit
        }
    }
