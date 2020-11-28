///draw_entity_shipyard(entity)
//old code, clean it up
var get_entity = argument0
var get_x = map_get(get_entity,"x")
var get_y = map_get(get_entity,"y")

var x1 = get_x - 100
var y1 = get_y - 100
var x2 = get_x + 100
var y2 = get_y + 100
//d3d_set_culling(false)
t = current_time mod (40*100)/100
var width = x2-x1
var height = y2-y1
for (var i = 11;i > -1;i--)
    {
    var even = i mod 2
    var tx = (width/10)*i
    var ty = (height/10)*i
    var tx1 = max(0,min(width,tx+t-20))
    var ty1 = max(0,min(height,ty+t-20))
    var tx2 = max(0,min(width,tx-t+20))
    var ty2 = max(0,min(height,ty-t+20))
    //show("i is: " + string(i))
    if even
    set_color(c_black)
    else
    set_color(c_orange)
    draw_triangle(x1,y1,x1+tx1,y1,x1,y1+ty1,false)
    if not even
    set_color(c_black)
    else
    set_color(c_orange)
    draw_triangle(x2,y2,x2-tx2,y2,x2,y2-ty2,false)
    //set_color(c_black)
    //draw_triangle(x1,y1,x1+tx1,y1,x1,y1+ty1,true)
    //draw_triangle(x2,y2,x2-tx2,y2,x2,y2-ty2,true)
    }


/*
var h,w
set_color(c_black)
draw_rectangle(x1,y1,x2,y2,true)
draw_primitive_begin(pr_trianglelist)
for (var i = -1;i < 10-1;i++)
    {
    w11 = i+t;
    h11 = i+t
    w21 = 0
    h21 = 0
    
    if h11 > 10
    w21 += h11-10
    if w11 > 10
    h21 += w11-10
    h11 = clamp(h11,0,10)
    w11 = clamp(w11,0,10)
    //set_color(c_black)
    //draw_line(x1 + w11*20,y1+h21*20,x1+w21*20,y1+h11*20)
    //vertex a and b
    //if not even
    //continue
    
    set_color(c_black)
    draw_vertex(x1+w11*20,y1+h21*20)
    draw_vertex(x1+w21*20,y1+h11*20)
    //set_color(c_blue)
    
    w12 = i+t+1;
    h12 = i+t+1
    w22 = 0
    h22 = 0
    
    if h12 > 10
    w22 += h12-10
    if w12 > 10
    h22 += w12-10
    h12 = clamp(h12,0,10)
    w12 = clamp(w12,0,10)
    w22 = clamp(w22,0,10)
    h22 = clamp(h22,0,10)
    //draw_line(x1 + w12*20,y1+h22*20,x1+w22*20,y1+h12*20)
    //vertex c
    draw_vertex(x1 + w12*20,y1+h22*20)
    set_color(c_red)
    draw_vertex(x1 + w12*20,y1+h22*20)
    draw_vertex(x1+w22*20,y1+h12*20)
    draw_vertex(x1+w21*20,y1+h11*20)
    //vertex d,e,f
    }
set_color(c_green)
draw_primitive_end()
/*
set_color(c_black)
draw_rectangle(x1,y1,x2,y2,false)
var stripes = 5
var size = 200/stripes

*/
//draw the ship zone. Makes an inner box
draw_set_color(c_gray)
draw_rectangle(x1+16,y1+16,x2-16,y2-16,false)
