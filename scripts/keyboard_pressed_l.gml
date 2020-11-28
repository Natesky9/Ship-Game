///keyboard_pressed_l()
if not keyboard_check_pressed(ord("L"))
exit

var is_docked = map_get(myship,"docked")

switch game_mode
    {
    case mode.free_flight:
        {
        if ui_type == ui.build
            ui_type = ui.null
        else
            ui_type = ui.build
        break
        }
    case mode.trade_menu:
        {
        ui_type = ui.build
        game_mode = mode.ship_edit
        }
    case mode.ship_edit:
        {
        break
        }
    }

switch ui_type
    {
    case ui.inventory:
        {
        //move the top item to the bottom
        var get_inventory = inventory
        var get_keys = map_get(get_inventory,"keys")
        var get_first = list_get(get_keys,0)
        ds_list_delete(get_keys,0)
        ds_list_add(get_keys,get_first)
        exit
        }
    case ui.build:
        {
        if is_docked
            {
            //ui_type = ui.dock
            //game_mode = mode.trade_menu
            }
        else
            ui_type = ui.null
        exit
        }
    case ui.dock:
        {
        //move into build mode if docked
        if is_docked
            {
            ui_type = ui.build
            exit
            }
        else
        show("You must be docked to enter build mode!")
        exit
        }
    case ui.craft:
        {
        //craft something
        var get_recipe = list_get(recipes,0)
        show("recipe is: " + string(get_recipe))
        //alloy recipe has 2 inputs
        var is_alloy = array_height_2d(get_recipe) == 3
        show("is alloy is: " + string(is_alloy))
        var get_result = get_recipe[0,0]
        var get_result_count = get_recipe[0,1]
        var name_result = enum_item(get_result)
        var get_ingredient_1 = get_recipe[1,0]
        var get_ingredient_1_count = get_recipe[1,1]
        var name_1 = enum_item(get_ingredient_1)
        
        if inventory_check(myship,get_ingredient_1) >= get_ingredient_1_count
            {//if we have enough of ingredient_1
            if is_alloy
                {//exit if ingredient 2 is invalid
                show("testing alloy")
                var get_ingredient_2 = get_recipe[2,0]
                var get_ingredient_2_count = get_recipe[2,1]
                var name_2 = enum_item(get_ingredient_2)
                
                show("taking " + string(inventory_check(myship,get_ingredient_2)) + " from " + string(get_ingredient_2_count))
                if inventory_check(myship,get_ingredient_2) < get_ingredient_2_count
                    {
                    show("you don't have enough " + name_2)
                    exit
                    }
                else 
                    {
                    show("taking alloy")
                    inventory_take(myship,get_ingredient_2,get_ingredient_2_count)
                    }
                }
            inventory_take(myship,get_ingredient_1,get_ingredient_1_count)
            inventory_give(myship,get_result,get_result_count)
            show("crafted a " + name_result)
            exit
            }
        else
            {
            show("you don't have enough " + name_1)
            exit
            }
        exit
        }
    default:
        {
        ui_type = ui.build
        exit
        }
    }
