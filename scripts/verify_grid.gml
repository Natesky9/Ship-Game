///verify_grid(entity)
var get_entity = argument0
var get_grid = map_get(get_entity,"grid")
var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)

var temp_grid = ds_grid_create(get_width,get_height)
ds_grid_copy(temp_grid,get_grid)

var computer_count = 0
var hull_count = 0
var engine_count = 0
var gun_count = 0
var drill_count = 0
var cargo_count = 0
var layout = 0

for (var w=0;w<get_width;w++)
    {
    for (var h=0;h<get_height;h++)
        {
        var get_cell = ds_grid_get(temp_grid,w,h)
        if not get_cell
        continue
        //in this switch, a break will count regions
        //where a continue will count quantity
        switch get_cell
            {
            case part.computer:
                computer_count++
                break
            case part.hull:
                {
                //hulls do not create regions
                //they just count total
                hull_count++
                continue
                }
            case part.engine:
                engine_count++
                break
            case part.gun:
                gun_count++
                break
            case part.drill:
                drill_count++
                break
            case part.cargo:
                {
                //cargo might later, but for now
                //just counts total
                cargo_count++
                break
                }
            }
        //
        var x1 = w
        var y1 = h
        var chain_x = grid_feel(temp_grid,x1,y1,side.right)
        var x2 = x1 + chain_x -1
        
        var temp_list = ds_list_create()
        for (var c = 0;c < chain_x;c++)
            {
            //show("testing down")
            var vert_test = grid_feel(temp_grid,x1+c,y1,side.down)
            //show("depth of: " + string(vert_test))
            ds_list_add(temp_list,vert_test)
            }
        //sort to find minimum, then destroy
        ds_list_sort(temp_list,true)
        var chain_y = list_get(temp_list,0)
        ds_list_destroy(temp_list)
        
        var y2 = y1 + chain_y -1
        
        
        var grid_min = ds_grid_get_min(temp_grid,x1,y1,x2,y2)
        var grid_max = ds_grid_get_max(temp_grid,x1,y1,x2,y2)
        if grid_min == grid_max
            {
            ds_grid_set_region(temp_grid,x1,y1,x2,y2,0)
            var get_name = enum_part(get_cell)
            show("found a " + get_name + " of size: " + string(x2-x1+1) + ":" + string(y2-y1+1))
            var inspection_slot = array_height_2d(layout);
            layout[inspection_slot,0] = get_cell
            layout[inspection_slot,1] = x1
            layout[inspection_slot,2] = y1
            layout[inspection_slot,3] = x2
            layout[inspection_slot,4] = y2
            }
        //
        }
    }

//do stuff with this data
inventory_size = cargo_count*10
if inventory > inventory_size
    {
    show("extra inventory, dropping!")
    //yes, I know this is incorrect, change it later
    entity_create(64,64,entity.item)
    }
//end doing stuff

ds_grid_destroy(temp_grid)
show("-----------------")
show("computers: " + string(computer_count))
show("hulls: " + string(hull_count))
show("engines: " + string(engine_count))
show("guns: " + string(gun_count))
show("drills: " + string(drill_count))
show("cargo: " + string(cargo_count))
show("/////////////////////////////")
map_set(get_entity,"computer count",computer_count)
map_set(get_entity,"hull count",hull_count)
map_set(get_entity,"engine count",engine_count)
map_set(get_entity,"gun count",gun_count)
map_set(get_entity,"drill count",drill_count)
var drill_overheat = drill_count*100
map_set(get_entity,"drill overheat",drill_overheat)
map_set(get_entity,"cargo count",cargo_count)
//cargo size is 20 per tile
var capacity = grid_count_value(get_grid,part.cargo)*20
map_set(get_entity,"capacity",capacity)
show(layout)
return layout
