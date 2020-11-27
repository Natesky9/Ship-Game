///entity_create(x,y,type)
//creates an entity at the coordinates
var get_x = argument0
var get_y = argument1
var get_type = argument2

var new_map = ds_map_create()
map_set(new_map,"x",get_x)
map_set(new_map,"y",get_y)
map_set(new_map,"direction",0)
map_set(new_map,"heading",0)
map_set(new_map,"speed",0)
map_set(new_map,"type",get_type)
map_set(new_map,"edit x",0)
map_set(new_map,"edit y",0)
map_set(new_map,"grid",0)
map_set(new_map,"docked",0)
map_set(new_map,"thrust",0);
map_set(new_map,"steer",0);
map_set(new_map,"brake",0);
map_set(new_map,"shift",0)
map_set(new_map,"x offset",0)
map_set(new_map,"y offset",0)

switch get_type
    {
    //----------//
    case entity.ship:
        {
        var new_grid = ds_grid_create(7,7)
        ds_grid_set(new_grid,3,3,part.computer)
        ds_grid_set(new_grid,3,2,part.hull)
        ds_grid_set(new_grid,2,3,part.cargo)
        ds_grid_set(new_grid,4,3,part.cargo)
        ds_grid_set(new_grid,2,4,part.engine)
        ds_grid_set(new_grid,4,4,part.engine)
        
        map_set(new_map,"grid",new_grid)
        
        //basic inventory
        var cargo_count = grid_count_value(new_grid,part.cargo)
        show("cargo cells: " + string(cargo_count))
        inventory_size = cargo_count*10
        //end basic inventory
        
        //log it
        ds_list_add(grid_list,new_grid)
        var inspection = verify_grid(new_grid)
        map_set(new_map,"layout",inspection)
        map_set(new_map,"drill",0)
        map_set(new_map,"drill progress",0)
        map_set(new_map,"drill heat",0)
        map_set(new_map,"capacity",inventory_size)
        map_set(new_map,"cargo",0)
        
        ds_list_add(ship_list,new_map)
        break
        }
    //----------//
    case entity.item:
        {
        map_set(new_map,"heading",irandom(360))
        ds_list_add(item_list,new_map)
        break
        }
    //----------//
    case entity.rock:
        {
        ds_list_add(rock_list,new_map)
        break
        }
    //----------//
    case entity.shipyard:
        {
        ds_list_add(shipyard_list,new_map)
        break
        }    //----------//
    default:
        {
        show("Error, no entity_create function for this type of entity!")
        break
        }
    //----------//
    }
    

//log it
ds_list_add(map_list,new_map)
//entity_list is all entities
ds_list_add(entity_list,new_map)
return new_map
