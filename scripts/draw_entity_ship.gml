//draw_entity_ship(entity)
//draws a ship entity
var get_entity = argument0
var get_x = map_get(get_entity,"x")
var get_y = map_get(get_entity,"y")
var get_type = map_get(get_entity,"type")
var get_direction = map_get(get_entity,"direction")
var get_heading = map_get(get_entity,"heading")

var get_grid = map_get(get_entity,"grid")
var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)
//width and height are the center of the grid
var width = get_width * 16
var height = get_height * 16
//TRANSFORM
d3d_transform_add_translation(-get_x-width/2,-get_y-height/2,0)
d3d_transform_add_rotation_z(get_heading-90)
d3d_transform_add_translation(get_x,get_y,0)
//TRANFORM
for (var h=0;h<get_height;h++)
    {
    for (var w = 0;w<get_width;w++)
        {
        var get_cell = ds_grid_get(get_grid,w,h)
        if get_cell
            {
            set_color(part_color(get_cell))
            var x1 = get_x+w*16
            var y1 = get_y+h*16
            if get_cell == part.hull
            or get_cell == part.cargo
            draw_rectangle(x1,y1,x1+15,y1+15,false)
            //draw adjacent links
            /*for (var s = side.null+1;s < side.types;s++)
                {
                var cell_adjacent = adjacent(get_grid,w,h,s)
                
                if cell_adjacent != get_cell
                continue
                
                var a_x = lengthdir_x(8,(s+1)*90)
                var a_y = lengthdir_y(8,(s+1)*90)
                set_color(c_black)
                draw_line(x1+8,y1+8,x1+a_x+8,y1+a_y+8)
                }
            */
            //draw adjacent links
            }
        }
    }
//done with grid loop

//draw the ship groups
var layout = map_get(get_entity,"layout")
var layout_size = array_height_2d(layout)
for (var g = 0;g < layout_size;g++)
    {
    var get_part = layout[g,0]
    var get_x1 = layout[g,1]
    var get_y1 = layout[g,2]
    var get_x2 = layout[g,3]
    var get_y2 = layout[g,4]
    
    var draw_x1 = get_x + get_x1*16
    var draw_y1 = get_y + get_y1*16
    var draw_x2 = get_x + get_x2*16 + 16
    var draw_y2 = get_y + get_y2*16 + 16
    set_color(part_color(get_part))
    draw_rectangle(draw_x1,draw_y1,draw_x2,draw_y2,false)
    set_color(c_black)
    draw_rectangle(draw_x1,draw_y1,draw_x2,draw_y2,true)
    }
//done drawing ship groups//


if ui_type = ui.build
    {
    var edit_x = map_get(get_entity,"edit x")
    var edit_y = map_get(get_entity,"edit y")
    
    set_color(c_red)
    var edit_x1 = get_x + edit_x*16
    var edit_y1 = get_y + edit_y*16
    var edit_x2 = edit_x1+16
    var edit_y2 = edit_y1+16
    draw_rectangle(edit_x1,edit_y1,edit_x2,edit_y2,true)
    
    d3d_transform_set_identity()
    var get_name = enum_part(edit_value)
    draw_text(mouse_x,mouse_y,"part selection:" + get_name)
    set_color(part_color(edit_value))
    draw_rectangle(mouse_x,mouse_y,mouse_x-16,mouse_y-16,false)
    }

