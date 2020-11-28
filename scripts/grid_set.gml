///grid_set(entity,grid,x,y,value)
//custom grid set, used for drilling rocks

var get_entity = argument0;
var get_grid = argument1;
var get_grid_x = argument2;
var get_grid_y = argument3;
var get_value = argument4;
var get_type = map_get(get_entity,"type");

var get_x = map_get(get_entity,"x")
var get_y = map_get(get_entity,"y")

if get_type == entity.rock
    {
    //find the pre center
    //we need to save this, in case we break the grid, so we can
    //match the position shift with the offset
    var pre_center = rock_find_center(get_entity);
    var pre_center_x = pre_center[0];
    var pre_center_y = pre_center[1];
    }

get_grid[# get_grid_x,get_grid_y] = get_value

//if the grid is empty, delete it
var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)
var get_max = ds_grid_get_max(get_grid,0,0,get_width-1,get_height-1)
if not get_max
    {
    entity_delete(get_entity)
    return false
    }


/*update the vertex buffer
//do I need this?
var get_vertex_buffer = map_get(get_entity,"vertex buffer")
if not is_undefined(get_vertex_buffer)
    {
    vertex_delete_buffer(get_vertex_buffer)
    map_set(get_entity,"vertex buffer", undefined)
    }
*/

switch get_type
    {
    case entity.ship:
        {
        //don't have this yet
        //entity_create_grid_vertex_buffer(get_entity)
        
        break
        }
    case entity.rock:
        {
        parse_asteroid(get_entity,get_grid,get_grid_x,get_grid_y,pre_center)
        show("recreating vertex buffer!")
        var success = entity_create_hex_vertex_buffer(get_entity)
        if not success
        show("error @ grid_set!")
        
        var post_center = rock_find_center(get_entity)
        var post_center_x = post_center[0]
        var post_center_y = post_center[1]
        
        //set the center
        map_set(get_entity,"x offset",post_center_x)
        map_set(get_entity,"y offset",post_center_y)
        show("setting offset: " + string(post_center))
        
        map_set(get_entity,"x",get_x+post_center_x-pre_center_x)
        map_set(get_entity,"y",get_y+post_center_y-pre_center_y)
        break
        }
    default:
        {
        show("Error, entity does not have a type associated with a vertex buffer!")
        show("@grid_set with an entity type of: " + string(get_type))
        break
        }
    }
//we're done here
