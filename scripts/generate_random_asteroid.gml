///generate_random_asteroid(uuid,entity,width,height)
//generates an asteroid
var get_entity = argument0
var get_width = argument1
var get_height = argument2

var get_x = map_get(get_entity,"x")
var get_y = map_get(get_entity,"y")

var random_x,random_y

var get_grid = ds_grid_create(get_width,get_height)
var get_integrity = ds_grid_create(get_width,get_height)
map_set(get_entity,"grid",get_grid)
map_set(get_entity,"integrity",get_integrity)

var x_center = floor(get_width/2)
var y_center = floor(get_height/2)
var min_dist = min(x_center,y_center)
//ds_grid_set_disk(get_grid,x_center,y_center,min_dist/2,1)

var rock_material = choose(item.rockred,item.rockblue,item.rockgreen)
repeat irandom_range(4,8)
    {
    var random_dir = irandom(360)
    random_x = lengthdir_x(min_dist/2,random_dir)
    random_y = lengthdir_y(min_dist/2,random_dir)
    
    var get_rock_x = random_x + x_center
    var get_rock_y = random_y + y_center
    
    var random_damage = irandom_range(50,100)
    ds_grid_set_disk(get_grid,get_rock_x,get_rock_y,min_dist/2,rock_material)
    ds_grid_set_disk(get_integrity,get_rock_x,get_rock_y,min_dist/2,random_damage)
    }

var ore_material = choose(item.orered,item.oreblue,item.oregreen)
repeat 4
    {
    var valid_position = false
    do
        {
        random_x = irandom_range(4,get_width-4)
        random_y = irandom_range(4,get_height-4)
        
        valid_position =
        grid_in_bounds(get_width,get_height,random_x,random_y)
        and ds_grid_get(get_grid,random_x,random_y)
        }
    until valid_position
    
    var random_damage = irandom_range(20,100)
    ds_grid_set_disk(get_grid,random_x,random_y,1,ore_material)
    ds_grid_set_disk(get_integrity,random_x,random_y,1,random_damage)
    }


//show("parsing asteroid...")
parse_asteroid(get_entity,get_grid)

//make the vertex buffer
var new_vertex_buffer = entity_create_hex_vertex_buffer(get_entity)
map_set(get_entity,"vertex buffer",new_vertex_buffer)

//set the center
var point = rock_find_center(get_entity)
map_set(get_entity,"x offset",point[0])
map_set(get_entity,"y offset",point[1])
show("setting offset: " + string(point))
