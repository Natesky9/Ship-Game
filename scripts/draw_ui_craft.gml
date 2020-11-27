///draw_ui_craft
//draw crafting

var x1 = room_width
var y1 = room_height
var x2 = room_width-400
var y2 = room_height-600
var get_text, slot

set_color(c_white)
draw_rectangle(x1,y1,x2,y2,false)
set_color(c_black)
draw_rectangle(x1,y1,x2,y2,true)
var slot_height = 16

slot = 0
inventory_1_count = 0
inventory_2_count = 0
var recipe_count = list_size(recipes)
for (var i = 0;i < recipe_count;i++)
    {
    var get_recipe = list_get(recipes,i)
    //alloy recipe has 2 inputs
    var is_alloy = array_height_2d(get_recipe) == 3
    var get_result = get_recipe[0,0]
    var get_result_count = get_recipe[0,1]
    var name_result = enum_item(get_result)
    var get_ingredient_1 = get_recipe[1,0]
    var get_ingredient_1_count = get_recipe[1,1]
    var inventory_1_count = inventory_check(myship,get_ingredient_1)
    if is_undefined(inventory_1_count)
    inventory_1_count = 0
    var name_1 = enum_item(get_ingredient_1)
    
    if is_alloy
        {
        var get_ingredient_2 = get_recipe[2,0]
        var get_ingredient_2_count = get_recipe[2,1]
        var inventory_2_count = inventory_check(inventory,get_ingredient_2)
        if is_undefined(inventory_2_count)
        inventory_2_count = 0
        var name_2 = enum_item(get_ingredient_2)
        }
    
    //if you don't have either, don't even bother drawing the recipe
    if not inventory_1_count
    and not inventory_2_count
    continue
        
    if i == 0
        {
        set_color(c_black)
        align(4)
        draw_text(x2+16,y2+32,"craft " + name_result)
        }
    
    var slot_offset = 64 + slot*slot_height*2
    
    //draw the box around the recipe
    set_color(c_red)
    var box_x1 = x2+16+i
    var box_y1 = y2+slot_offset-slot_height
    var box_x2 = x1-16+i
    var box_y2 = y2+slot_offset+slot_height
    //if it's an alloy, double size
    if is_alloy
    box_y2 += slot_height
    draw_rectangle(box_x1,box_y1,box_x2,box_y2,true)
    
    //draw ingredient_1
    draw_set_color(c_black)
    align(4)
    draw_text(x2+100,y2+slot_offset,name_1)
    
    get_text = string(inventory_1_count) + "/" + string(get_ingredient_1_count)
    draw_text(x2+48,y2+slot_offset,get_text)
    
    //var ingredient_1_color = item_color(get_ingredient_1)
    draw_item(x2+32,y2+slot_offset,get_ingredient_1)
    //draw_tri(x2+32,y2+slot_offset,ingredient_1_color)
    //draw_ingredient_2
    if is_alloy
        {
        set_color(c_black)
        draw_text(x2+100,y2+slot_offset+slot_height,name_2)
        
        get_text = string(inventory_2_count) + "/" + string(get_ingredient_2_count)
        draw_text(x2+48,y2+slot_offset+slot_height,get_text)
        //var ingredient_2_color = item_color(get_ingredient_2)
        draw_item(x2+32,y2+slot_offset+slot_height,get_ingredient_2)
        //draw_tri(x2+32,y2+slot_offset+slot_height,ingredient_2_color)
        }
    //draw result
    //var result_color = item_color(get_result)
    draw_item(x1-120,y2+slot_offset,get_result)
    //draw_tri(x1-120,y2+slot_offset,result_color)// + is_alloy*slot_offset)
    
    set_color(c_black)
    draw_text(x1-150,y2+slot_offset,"=")// + is_alloy*slot_offset,"=")
    
    draw_text(x1-100,y2+slot_offset,name_result)
    
    
    slot++
    //if it's an alloy, give it two spaces
    if is_alloy
    slot++
    }
