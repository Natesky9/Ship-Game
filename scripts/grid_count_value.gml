///grid_count_value(grid,value)
//counts the number of a certain cell in a grid
var get_grid = argument0
var get_value = argument1

var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)

var get_count = 0

for (var h=0;h<get_height;h++)
        {
        for (var w = 0;w<get_width;w++)
            {
            if ds_grid_get(get_grid,w,h) == get_value
            get_count += 1
            }
        }
return get_count            
