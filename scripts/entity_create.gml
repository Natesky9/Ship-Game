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
map_set(new_map,"x offset",0)
map_set(new_map,"y offset",0)

switch get_type
    {
    //----------//
    case entity.ship:
        {
        var new_grid = ds_grid_create(7,7)
        map_set(new_map,"grid",new_grid)
        var grid_integrity = ds_grid_create(7,7)
        map_set(new_map,"integrity",grid_integrity)
        ds_grid_set_region(new_grid,0,0,7,7,part.hull)
        ds_grid_set_region(grid_integrity,0,0,7,7,100)
        ds_grid_set_region(new_grid,0,0,1,7,part.engine)
        ds_grid_set_region(grid_integrity,0,0,1,7,100)
        ds_grid_set_region(new_grid,5,0,7,7,part.cargo)
        ds_grid_set_region(grid_integrity,5,0,7,7,100)
        //set the default ship
        set_ship_grid(new_map,3,3,part.computer)
        set_ship_grid(new_map,3,2,part.hull)
        set_ship_grid(new_map,2,3,part.cargo)
        set_ship_grid(new_map,4,3,part.cargo)
        set_ship_grid(new_map,2,4,part.engine)
        set_ship_grid(new_map,4,4,part.engine)
        set_ship_grid(new_map,0,0,part.drill)
        set_ship_grid(new_map,0,1,part.drill)
        
        
        //log it
        ds_list_add(grid_list,new_grid)
        var inspection = verify_grid(new_map)
        map_set(new_map,"layout",inspection)
        map_set(new_map,"edit x",0)
        map_set(new_map,"edit y",0)
        map_set(new_map,"docked",0)
        map_set(new_map,"thrust",0)
        map_set(new_map,"steer",0)
        map_set(new_map,"brake",0)
        map_set(new_map,"drill",0)
        map_set(new_map,"drill progress",0)
        map_set(new_map,"drill heat",0)
        map_set(new_map,"cargo",0)
        map_set(new_map,"fire",0)
        
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
        map_set(new_map,"edit x",0)
        map_set(new_map,"edit y",0)
        map_set(new_map,"grid",0)
        ds_list_add(rock_list,new_map)
        break
        }
    //----------//
    case entity.shipyard:
        {
        ds_list_add(shipyard_list,new_map)
        break
        }
    //----------//
    case entity.damage:
        {
        map_set(new_map,"lifetime",60)
        ds_list_add(damage_list,new_map)
        break
        }
    //----------//
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
