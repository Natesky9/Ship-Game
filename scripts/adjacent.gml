///adjacent(grid,x,y,side)
//returns the value of the cell adjacent
//using the specified side.value
var get_grid = argument0
var get_x = argument1
var get_y = argument2
var get_side = argument3
var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)

switch get_side
    {
    case side.up:
        {
        get_y--
        break
        }
    case side.down:
        {
        get_y++
        break
        }
    case side.left:
        {
        get_x--
        break
        }
    case side.right:
        {
        get_x++
        break
        }
    }
if get_x < 0
or get_y < 0
or get_x >= get_width
or get_y >= get_height
return false

var get_value = ds_grid_get(get_grid,get_x,get_y)
return get_value
