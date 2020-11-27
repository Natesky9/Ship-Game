///draw_entity_asteroid_grid(entity)
//draws the grid and coordinates of a hex grid
var get_entity = argument0
var entity_x = map_get(get_entity,"x")
var entity_y = map_get(get_entity,"y")
var get_grid = map_get(get_entity,"grid")
var get_direction = map_get(get_entity,"direction")
var get_heading = map_get(get_entity,"heading")
var get_x_offset = map_get(get_entity,"x offset")
var get_y_offset = map_get(get_entity,"y offset")

var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)

var grid_position = point_to_hex_grid(get_entity,mouse_x,mouse_y)
var mouse_grid_x = grid_position[0]
var mouse_grid_y = grid_position[1]




align(5)

for (h = 0;h < get_height;h += 1)
    {
    for (w = 0;w < get_width;w += 1)
        {
        var text = string(w) + ":" + string(h)
        var get_x = rock_grid_size * w * 1.5
        var get_y = rock_grid_size * h * sqrt(3) + w mod 2 * rock_grid_size * sqrt(3)/2
        
        set_color(c_white)
        draw_text(get_x,get_y,text)
        
        var get_hex = ds_grid_get(get_grid,w,h)
        if h == mouse_grid_y
        and w = mouse_grid_x
        and get_hex
            {
            set_color(c_black)
            draw_asteroid_hex(get_x,get_y,get_heading)
            }
        }
    }
