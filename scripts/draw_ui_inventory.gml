///draw_ui_inventory()
var x1 = room_width
var y1 = room_height
var x2 = room_width-200
var y2 = room_height-200
set_color(c_white)
draw_rectangle(x1,y1,x2,y2,false)
set_color(c_black)
draw_rectangle(x1,y1,x2,y2,true)

var get_inventory_size = map_get(myship,"capacity")
var total_inventory = map_get(myship,"cargo")
var get_inventory = inventory

var keys = map_get(get_inventory,"keys")
var key_count = list_size(keys)
var inventory_slot = 1
for (var i = 0;i <key_count;i++)
    {
    var get_item = list_get(keys,i)
    var get_quantity = inventory_check(myship,get_item);
    
    //draw item
    var slot_y = y2 + 16 + 16*inventory_slot;
    var tri_x = x2+32;
    var tri_y = slot_y;
    
    draw_item(tri_x,tri_y,get_item)
    set_color(c_black);
    align(4)
    var get_name = enum_item(get_item)
    draw_text(x2+64,slot_y,get_name)
    draw_text(x1-32,slot_y,string(get_quantity));
    
    inventory_slot++;
    }

//draw the total inventory
if get_inventory_size == total_inventory
set_color(c_red)
draw_text(mean(x1,x2),y2+16,string(total_inventory)+"/"+string(get_inventory_size))
