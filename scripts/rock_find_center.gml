///rock_find_center(entity)
//finds the center of mass for a rock
//returns an array
var get_entity = argument0
var get_grid = map_get(get_entity,"grid")

var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)
var x_start = 0
var y_start = 0
count = 0

for (var w = 0;w < get_width;w++)
    {
    for (var h = 0;h < get_height;h++)
        {
        if ds_grid_get(get_grid,w,h)
            {
            count++
            var point = hex_cell_to_point(get_entity,w,h);
            x_start += point[0]
            y_start += point[1]
            }
        }
    }
x_start /= count
y_start /= count

result[0] = x_start
result[1] = y_start

return result
