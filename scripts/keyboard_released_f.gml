///keyboard_released_f()
if not keyboard_check_released(ord("F"))
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
        map_set(get_entity,"steer",0)
        if keyboard_check(ord("S"))
        map_set(get_entity,"steer",1)
        exit
        }
    case mode.trade_menu:
        {
        exit
        }
    }
