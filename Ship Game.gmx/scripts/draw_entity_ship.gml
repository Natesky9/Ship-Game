///draw_entity_ship(entity,x,y,xspeed,yspeed)
//draw a ship entity
var get_entity = argument0
var get_x = argument1
var get_y = argument2
var get_x_speed = argument3
var get_y_speed = argument4

var get_grid = ds_get(get_entity,"grid")
var grid_width = ds_grid_width(get_grid)
var grid_height = ds_grid_height(get_grid)

for (var xx = 0;xx < grid_width;xx++)
    {
    for (var yy = 0;yy < grid_height;yy++)
        {
        var get_cell = ds_grid_get(get_grid,xx,yy)
        
        switch get_cell
            {
            case 1:
                {
                break
                }
            case 2:
                {
                break
                }
            case 3:
                {
                break
                }
            default:
                {
                break
                }
            }
        }
    }




//draw a final dot/line
color(c_blue)
draw_circle(get_x,get_y,2,false)
color(c_red)
var xvel = get_x+get_x_speed*2
var yvel = get_y+get_y_speed*2
draw_line(get_x,get_y,xvel,yvel)
//done
