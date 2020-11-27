///grid_feel(grid,x,y,direction)
//returns the distance of a chain of cells
var get_grid = argument0
var get_x = argument1
var get_y = argument2
var get_direction = argument3
var get_value = ds_grid_get(get_grid,get_x,get_y)

if not get_value
return false


var distance = 1

if adjacent(get_grid,get_x,get_y,get_direction) == get_value
    {
    //show("feeling to the side")
    var x_value = get_x + (get_direction==side.right);
    var y_value = get_y + (get_direction==side.down);
    distance += grid_feel(get_grid,x_value,y_value,get_direction)
    }
//show("distance: " + string(distance))
return distance
