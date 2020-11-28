///Event_Draw()
var camera_direction = map_get(myship,"direction")
var camera_x = map_get(myship,"x")
var camera_y = map_get(myship,"y");
var get_heading = map_get(myship,"heading");

var get_width = view_wport[0];
var get_height = view_hport[0];
view_xview[0] = camera_x - get_width/2
view_yview[0] = camera_y - get_height/2
view_angle[0] = -get_heading+90;


//loop through all entities
var type_count = list_size(entity_types)
for (var ii = 0;ii < type_count;ii++)
    {
    var type_list = list_get(entity_types,ii)
    var entity_count = list_size(type_list)
    for (var i = 0;i < entity_count;i++)
        {
        var get_entity = list_get(type_list,i)
        
        if is_undefined(get_entity)
            {
            show("error, drawing an undefined entity!")
            continue
        }
        
        var get_x = map_get(get_entity,"x")
        var get_y = map_get(get_entity,"y")
        var get_type = map_get(get_entity,"type")
        var get_direction = map_get(get_entity,"direction")
        var get_heading = map_get(get_entity,"heading")
        //draw debug lines
        if keyboard_check(vk_control)
            {
            set_color(c_aqua)
            var line_x = lengthdir_x(128,get_direction)
            var line_y = lengthdir_y(128,get_direction)
            draw_line(get_x,get_y,get_x+line_x,get_y+line_y)
            
            set_color(c_white)
            draw_line(0,get_y,room_width,get_y)
            draw_line(get_x,0,get_x,room_height)
            }
        
        switch get_type
            {
            case entity.ship:
                {
                draw_entity_ship(get_entity)
                break
                }
            //end entity ship
            case entity.item:
                {
                var get_item = map_get(get_entity,"item")
                draw_item(get_x,get_y,get_item)
                break
                }
            //end entity item
            //entity rock
            case entity.rock:
                {
                var get_grid = map_get(get_entity,"grid")
                transform_set_asteroid_orientation(get_entity,get_x,get_y,get_heading,get_grid)
                draw_asteroid_vertex_buffer(get_entity,get_x,get_y,get_heading)
                if keyboard_check(vk_control)
                draw_entity_asteroid_grid(get_entity)
                break
                }
            case entity.shipyard:
                {
                draw_entity_shipyard(get_entity)
                break
                }
            case entity.damage:
                {
                draw_entity_damage(get_entity)
                break
                }
            //end entity rock
            default:
                {
                show("error, default draw on entity!")
                set_color(c_blue)
                draw_circle(get_x,get_y,16,false)
                set_color(c_black)
                draw_circle(get_x,get_y,16,true)
                break
                }
            }
        //done transforming
        d3d_transform_set_identity()
        }
    }    
draw_grid()

draw_drill()
