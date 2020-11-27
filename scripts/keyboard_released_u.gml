///keyboard_released_u()
if not keyboard_check_released(ord("U"))
exit

var get_entity = list_get(ship_list,0)

switch game_mode
    {
    case mode.ship_edit:
        {
        exit
        }
    case mode.free_flight:
        {
        //map_set(get_entity,"drill",0)
        exit
        }
    case mode.trade_menu:
        {
        exit
        }
    }
