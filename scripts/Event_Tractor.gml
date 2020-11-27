var get_ship = myship
var get_tractor = map_get(get_ship,"tractor")
if get_tractor
    {
    var get_x = map_get(myship,"x")
    var get_y = map_get(myship,"y")
    
    //docking is no longer in tractor event
    /*

    */
    
    //test if inventory has space
    if map_get(myship,"cargo") >= map_get(myship,"capacity")
        {
        show("Inventory is full or no inventory!")
        map_set(get_ship,"tractor",false)
        exit//exit if inventory is full
        }
        
    var get_ship_x = map_get(get_ship,"x")
    var get_ship_y = map_get(get_ship,"y")
    
    var items = list_size(item_list)
    for (var i = 0; i < items; i++)
        {
        var get_item = ds_list_find_value(item_list,i)
        var get_type = map_get(get_item,"item")
        var get_x = map_get(get_item,"x")
        var get_y = map_get(get_item,"y")
        
       
        //move towards ship
        var dir = point_direction(get_x,get_y,get_ship_x,get_ship_y)    
        var x_dir = lengthdir_x(4,dir)
        var y_dir = lengthdir_y(4,dir)
        map_set(get_item,"x",get_x+x_dir)
        map_set(get_item,"y",get_y+y_dir)
        
        var distance = point_distance(get_ship_x,get_ship_y,get_x,get_y)
        if distance < 64
            {//add to inventory
            inventory_give(get_ship,get_type,1)
            entity_delete(get_item)
            break
            }
        
        }
    }
