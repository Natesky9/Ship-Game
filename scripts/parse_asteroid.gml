///parse_asteroid(entity,grid,[break_x,break_y])
//when inputing a grid, outputs the seperated
//grids as arrays
//SERVER
//----------------------------------------//
var time = get_timer()
var get_entity,get_uuid,check_continuity,get_break_x,get_break_y,get_grid,
    get_width,get_height,grid_max,size,test_size,coords,get_x,get_y,
    first_neighbor,test_neighbor,first_side,second_side,size_of_checked,
    size_of_population,h,w,i,t,j,get_cell,int_cell,result,temp,temp_num,
    first,seed_x,seed_y,test_x,test_y,is_free,to_remove,chunks,get_value,
    cells,chunk,new_uuid,new_entity,new_grid,
var get_test_x,get_test_y,get_cell_x,get_cell_y,
var pre_center_x = 0
var pre_center_y = 0
//----------------------------------//
var population = ds_list_create();
var to_check = ds_list_create()
var has_checked = ds_list_create()
//----------------------------------//
get_entity = argument[0]
var get_grid = argument[1]
//--------------------//
check_continuity = argument_count == 5

if check_continuity
    {
    show("continuity is on")
    get_break_x = argument[2]
    get_break_y = argument[3]
    var pre_center = argument[4]
    //find the pre center
    //we need to fetch the center before
    var pre_center_x = pre_center[0];
    var pre_center_y = pre_center[1];
    }

get_grid = map_get(get_entity,"grid")
var get_integrity = map_get(get_entity,"integrity")

get_width = ds_grid_width(get_grid)
get_height = ds_grid_height(get_grid);

grid_max = max(get_width,get_height)
//-------------------------//
//early exit check
//-------------------------//
if check_continuity
    {
    var continuity_timer = -get_timer()
    for (i = 1;i <= 6;i++)
        {
        //get the cell to test
        coords = hex_direction_to_grid(i,get_break_x,get_break_y)
        get_cell_x = get_break_x + coords[0];
        get_cell_y = get_break_y + coords[1];
        
        //check if in bounds
        if not grid_in_bounds(get_width,get_height,get_cell_x,get_cell_y)
            {
            //this cell would be out of bounds
            continue
            }
        
        if ds_grid_get(get_grid,get_cell_x,get_cell_y)
            {
            ds_list_add(population,i)
            }
        }
    size_of_population = list_size(population)
    //show("size of population: " + string(size_of_population))
    //early exit if we have 1,5, or 6 neighbors
    switch size_of_population
        {
        case 0:
            {
            show("entity is empty, destroying")
            entity_delete(get_entity)
            //we're done here
            ds_list_destroy(population)
            ds_list_destroy(to_check)
            ds_list_destroy(has_checked)
            exit
            }
        case 1:
        case 5:
        case 6:
            {
            //we're done here
            ds_list_destroy(population)
            ds_list_destroy(to_check)
            ds_list_destroy(has_checked)
            show("time to execute parse_asteroid: " + string(get_timer() - time))
            exit
            }
        }
    
    //now we have the list of immediately adjacent cells,
    //we test for continuity
    first_neighbor = ds_list_find_value(population,0)
    ds_list_add(to_check,first_neighbor)
    ds_list_add(has_checked,first_neighbor)
    
    while list_size(to_check)
        {
        //do this until we run out of to_check
        test_neighbor = ds_list_find_value(to_check,0)
        ds_list_delete(to_check,0)
        
        //first side
        first_side = ((test_neighbor - 1 - 1 + 6) mod 6) + 1
        coords = hex_direction_to_grid(first_side,get_break_x,get_break_y)
        get_cell_x = get_break_x + coords[0];
        get_cell_y = get_break_y + coords[1];
        if ds_grid_get(get_grid,get_cell_x,get_cell_y)
            {
            if ds_list_find_index(has_checked,first_side) < 0
                {
                ds_list_add(to_check,first_side)
                ds_list_add(has_checked,first_side)
                }
            }
        //second side
        second_side = ((test_neighbor - 1 + 1) mod 6 ) + 1
        coords = hex_direction_to_grid(second_side,get_break_x,get_break_y)
        get_cell_x = get_break_x + coords[0];
        get_cell_y = get_break_y + coords[1];
        if ds_grid_get(get_grid,get_cell_x,get_cell_y)
            {
            if ds_list_find_index(has_checked,second_side) < 0
                {
                ds_list_add(to_check,second_side)
                ds_list_add(has_checked,second_side)
                }
            }
        }
    //done doing the loop
    
    if size_of_population == list_size(has_checked)
        {
        //show("Grid is continuous, no need to continue parsing!")
        ds_list_destroy(population)
        ds_list_destroy(to_check)
        ds_list_destroy(has_checked)
        
        show("time to execute parse_asteroid: " + string(get_timer() - time))
        exit
        }
    continuity_timer += get_timer()
    show("continuity time took: " + string(continuity_timer))
    }
//
//show("-----------")
//show("GRID BROKE")
//show("-----------")
//----------------------------------------//
get_x = map_get(get_entity,"x")
get_y = map_get(get_entity,"y")
var get_heading = map_get(get_entity,"heading")
var get_direction = map_get(get_entity,"direction")
var get_speed = map_get(get_entity,"speed")
var get_x_offset = map_get(get_entity,"x offset")
var get_y_offset = map_get(get_entity,"y offset")


//populate population with all cells
var population_timer = -get_timer()

ds_list_clear(population)
ds_list_clear(to_check)
ds_list_clear(has_checked)

for (h = 0;h < get_height;h += 1)
    {
    for (w = 0;w < get_width;w += 1)
        {
        get_cell = ds_grid_get(get_grid,w,h)        
        if get_cell
            {
            int_cell = coord_to_int(w,h,grid_max)
            ds_list_add(population,int_cell)
            }
        }
    }
//---------------------------------//
//done populating
//---------------------------------//
chunk = 0
while list_size(population)
    {
    //move seed 0 to check
    var seed = ds_list_find_value(population,0)
    ds_list_delete(population,0)
    
    ds_list_add(to_check,seed)
    ds_list_add(has_checked,seed)
    
    if chunk > 0
        {
        //create a new grid to be used later
        new_grid = ds_grid_create(get_width,get_height)
        new_integrity = ds_grid_create(get_width,get_height)
        seed_x = int_to_coord_x(seed,grid_max)
        seed_y = int_to_coord_y(seed,grid_max)
        
        var seed_value = ds_grid_get(get_grid,seed_x,seed_y)
        
        ds_grid_set(get_grid,seed_x,seed_y,0)
        ds_grid_set(new_grid,seed_x,seed_y,seed_value)
        var get_old_damage = ds_grid_get(get_integrity,seed_x,seed_y)
        ds_grid_set(get_integrity,seed_x,seed_y,0)
        ds_grid_set(new_integrity,seed_x,seed_y,get_old_damage)
        }
    
    while list_size(to_check)
        {
        cell_to_check = ds_list_find_value(to_check,0)
        ds_list_delete(to_check,0)
        
        cell_to_check_x = int_to_coord_x(cell_to_check,grid_max)
        cell_to_check_y = int_to_coord_y(cell_to_check,grid_max)
        
        for (i = 1;i <= 6;i++)
            {
            //get the cell to test
            coords = hex_direction_to_grid(i,cell_to_check_x,cell_to_check_y)
            get_test_x = cell_to_check_x + coords[0];
            get_test_y = cell_to_check_y + coords[1];
            
            int_cell = coord_to_int(get_test_x,get_test_y,grid_max)
            
            //check if in bounds
            if not grid_in_bounds(get_width,get_height,get_test_x,get_test_y)
                {
                continue
                }
            //check if cell is empty
            if not ds_grid_get(get_grid,get_test_x,get_test_y)
                continue
            
            //if it hasn't been checked
            if ds_list_find_index(has_checked,int_cell) < 0
                {
                ds_list_add(has_checked,int_cell)
                ds_list_add(to_check,int_cell)
                pos = ds_list_find_index(population,int_cell)
                ds_list_delete(population,pos)
                
                //if this isn't part of the main chunk, make a new one
                if chunk
                    {
                    //get what it used to be
                    get_value = ds_grid_get(get_grid,get_test_x,get_test_y)
                    var get_damage = ds_grid_get(get_integrity,get_test_x,get_test_y)
                    //add to a grid to be used later
                    ds_grid_set(new_grid,get_test_x,get_test_y,get_value)
                    ds_grid_set(new_integrity,get_test_x,get_test_y,get_damage)
                    //clear it from the old one
                    ds_grid_set(get_grid,get_test_x,get_test_y,0)
                    ds_grid_set(get_grid,get_test_x,get_test_y,0)
                    
                    }
                }
            }
        }
    ds_list_clear(to_check)
    ds_list_clear(has_checked)
    //done with this chunk
    if chunk
        {
        
        new_entity = entity_create(get_x-get_x_offset,get_y-get_y_offset,entity.rock)
        
        //set the grid from what we made earlier
        map_set(new_entity,"grid",new_grid)
        map_set(new_entity,"integrity",new_integrity)
        map_set(new_entity,"heading",get_heading)
        map_set(new_entity,"direction",get_direction)
        map_set(new_entity,"speed",get_speed)
        
        
        //post center
        var post_center = rock_find_center(new_entity)
        var post_center_x = post_center[0]
        var post_center_y = post_center[1]
        
        //set the center
        map_set(new_entity,"x offset",post_center_x)
        map_set(new_entity,"y offset",post_center_y)
        show("setting offset: " + string(post_center))
        
        map_set(new_entity,"x",get_x+post_center_x-pre_center_x)
        map_set(new_entity,"y",get_y+post_center_y-pre_center_y)
        
        
        
        //map_set(get_entity,"x",get_x+post_center_x-pre_center_x)
        //map_set(get_entity,"y",get_y+post_center_y-pre_center_y)
        
        }
    
    //move on to the next chunk
    chunk++
    }

//packet_entity_set_grid
//entity_create_hex_vertex_buffer(get_entity)

ds_list_destroy(population)
ds_list_destroy(to_check)
ds_list_destroy(has_checked)
show("time to execute parse_asteroid: " + string(get_timer() - time))
