///keyboard_pressed_h()
if not keyboard_check_released(ord("H"))
exit

var get_ship = myship
map_set(get_ship,"fire",0)

    
switch ui_type
    {
    case ui.inventory:
        {
        break
        }
    case ui.build:
        {
        break
        }
    case ui.craft:
        {
        break
        }
    default:
        {
        break
        }
    }
