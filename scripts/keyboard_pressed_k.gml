///keyboard_pressed_k()
if not keyboard_check_pressed(ord("K"))
exit
//tractor

switch ui_type
    {
    case ui.inventory:
        {
        var get_tractor = map_get(myship,"tractor")
        map_set(myship,"tractor",not get_tractor)
        show("toggling tractor")
        break
        }
    case ui.build:
        {
        edit_value = min(part.types-1,edit_value+1)
        break
        }
    case ui.craft:
    {//scroll up
        var limit = list_size(recipes)
        do
            {
            var get_zero = list_get(recipes,0)
            ds_list_delete(recipes,0)
            ds_list_add(recipes,get_zero)
            
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
        var get_tractor = map_get(myship,"tractor")
        
        if not get_tractor
        and map_get(myship,"docked")
            {
            show("undocking")
            map_set(myship,"docked",false)
            break
            }
        map_set(myship,"tractor",not get_tractor)
        show("toggling tractor")
        break
        }
    }
