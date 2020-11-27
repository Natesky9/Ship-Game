///keyboard_pressed_u()
if not keyboard_check_pressed(ord("U"))
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
        switch ui_type
            {
            case ui.drill:
                {
                ui_type = ui.null
                map_set(get_entity,"drill",false)
                exit
                }
            default:
                {
                ui_type = ui.drill
                map_set(get_entity,"drill",true)
                exit
                }
            }
        }
    case mode.trade_menu:
        {
        exit
        }
    }

