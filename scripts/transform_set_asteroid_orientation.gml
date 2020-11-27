///transform_set_asteroid_orientation(entity,x,y,heading,grid)
//
var get_entity = argument0
var get_x = argument1
var get_y = argument2
var get_heading = argument3
var get_grid = argument4

var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)
var get_x_offset = map_get(get_entity,"x offset")
var get_y_offset = map_get(get_entity,"y offset")

//var point = rock_find_center(get_entity)
//show("point is : " + string(point))
var x_start = -((get_width-1)*rock_grid_size * 1.5)/2 - get_x_offset
var y_start = -((get_height-1)*rock_grid_size * sqrt(3))/2 - get_y_offset

d3d_transform_add_translation(x_start,y_start,0)
d3d_transform_add_rotation_z(get_heading)
d3d_transform_add_translation(get_x,get_y,0)


/*for (var w = 0;w < get_width;w++)
    {
    for (var h = 0;h < get_height;h++)
        {
        if ds_grid_get(get_grid,w,h)
            {
            count++
            var point = hex_cell_to_point(get_entity,w,h);
            x_start += point[0]-get_x
            y_start += point[1]-get_y
            }
        }
    }
    */
