///keyboard_released_s()
if not keyboard_check_released(ord("S"))
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
        map_set(get_entity,"steer",0)
        if keyboard_check(ord("F"))
        map_set(get_entity,"steer",-1)
        exit
        }
    case mode.trade_menu:
        {
        exit
        }
    }
