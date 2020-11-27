///keyboard_pressed_i()
if not keyboard_check_pressed(ord("I"))
exit

//inventory
if game_mode = mode.ship_edit
    {
    edit_value = max(part.null,edit_value-1)
    exit
    }
    
switch ui_type
    {
    case ui.inventory:
        {//exit inventory
        ui_type = ui.null
        exit
        }
    case ui.build:
        {//scroll up
        edit_value = max(part.null,edit_value-1)
        exit
        }
    case ui.craft:
    {//scroll down
        var limit = list_size(recipes)
        do
            {
            var get_last = list_size(recipes)-1
            var get_value = list_get(recipes,get_last)
            ds_list_delete(recipes,get_last)
            ds_list_insert(recipes,0,get_value)
            
            var get_recipe = list_get(recipes,0)
            var is_alloy = array_height_2d(get_recipe) == 3
            var get_ingredient_1 = get_recipe[1,0]
            
            if inventory_check(myship,get_ingredient_1) > 0
            limit = true
            if is_alloy
                {
                var get_ingredient_2 = get_recipe[2,0]
                if inventory_check(myship,get_ingredient_2) > 0
                limit = true
                }
            limit--;
            }
        until
            (
            not limit
            )
        exit
        }
    default:
        {
        ui_type = ui.inventory
        }
    }
