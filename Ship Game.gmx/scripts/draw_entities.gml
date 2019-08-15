///draw_entities()
//draw the entities to the screen
var entity_count = ds_list_size(entity_list)

for (var i = 0;i < entity_count;i++)
    {
    var get_entity = ds_list_find_value(entity_list,i)
    var get_x = ds_get(get_entity,"x")
    var get_y = ds_get(get_entity,"y")
    var get_type = ds_get(get_entity,"type")
    var get_x_speed = ds_get(get_entity,"x_speed")
    var get_y_speed = ds_get(get_entity,"y_speed")
    
    switch get_type
        {
        case entity.rock:
            {
            color(c_blue)
            draw_circle(get_x,get_y,5,false)
            color(c_black)
            draw_circle(get_x,get_y,5,true)
            color(c_red)
            draw_line(get_x,get_y,get_x+get_x_speed*4,get_y+get_y_speed*4)
            break
            }
        case entity.ship:
            {
            draw_entity_ship()
            color(c_blue)
            draw_rectangle(get_x-32,get_y-32,get_x+32,get_y+32,false)
            color(c_black)
            draw_rectangle(get_x-32,get_y-32,get_x+32,get_y+32,true)
            color(c_red)
            draw_line(get_x,get_y,get_x+get_x_speed*4,get_y+get_y_speed*4)
            break
            }
        }

    }
