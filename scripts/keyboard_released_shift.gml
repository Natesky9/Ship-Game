///keyboard_released_shift()
if not keyboard_check_released(vk_shift)
exit

var get_entity = list_get(ship_list,0)

switch game_mode
    {
    case mode.ship_edit:
        {
        exit
        }
    case mode.fine_flight:
        {
        game_mode = mode.free_flight
        }
    case mode.trade_menu:
        {
        exit
        }
    }
