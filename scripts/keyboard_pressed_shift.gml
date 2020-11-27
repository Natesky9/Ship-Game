///keyboard_pressed_shift()
if not keyboard_check_pressed(vk_shift)
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
        game_mode = mode.fine_flight
        exit
        }
    case mode.trade_menu:
        {
        exit
        }
    }
