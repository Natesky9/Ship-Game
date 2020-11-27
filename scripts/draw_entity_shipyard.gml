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
t = current_time mod (1*1000)/1000
var h,w
set_color(c_black)
draw_rectangle(x1,y1,x2,y2,true)
draw_primitive_begin(pr_trianglestrip)
draw_vertex(x1,y1)
for (var i = 0;i < 20;i++)
    {
    w1 = i+t;
    h1 = i+t
    w2 = 0
    h2 = 0
    
    if h1 > 10
    w2 += h1-10
    if w1 > 10
    h2 += w1-10
    h1 = clamp(h1,0,10)
    w1 = clamp(w1,0,10)
    set_color(c_black)
    //draw_line(x1 + w1*20,y1+h2*20,x1+w2*20,y1+h1*20)
    draw_vertex(x1+w1*20,y1+h2*20)
    draw_vertex(x1+w2*20,y1+h1*20)
    set_color(c_blue)
    
    w1 = i+t+1;
    h1 = i+t
    w2 = 0
    h2 = 0
    
    if h1 > 10
    w2 += h1-10
    if w1 > 10
    h2 += w1-10
    h1 = clamp(h1,0,10)
    w1 = clamp(w1,0,10)
    w2 = clamp(w2,0,10)
    h2 = clamp(h2,0,10)
    //draw_line(x1 + w1*20,y1+h2*20,x1+w2*20,y1+h1*20)
    draw_vertex(x1 + w1*20,y1+h2*20)
    //draw_line(x1,y1+h*20,x2+h*20,y1)
    }
draw_vertex(x2,y2)
set_color(c_green)
draw_primitive_end()
/*
set_color(c_black)
draw_rectangle(x1,y1,x2,y2,false)
var stripes = 5
var size = 200/stripes

t = current_time mod (size*100)/100
var tri_x1,tri_y1,tri_x2,tri_y2,tri_x3,tri_y3
for (i = 0;i <= stripes;i += 1)
    {//draw the construction lines
    draw_set_color(make_color_rgb(255,140,0))
    tri_x1 = min(max(x1,x1+i*size-t),x2)
    tri_y1 = y1
    tri_x2 = min(max(x1,x1+i*size+size/2-t),x2)
    tri_y2 = y1
    tri_x3 = x1
    tri_y3 = min(max(y1,y1+i*size-t),y2)
    //show(string(tri_x1) + ":" + string(tri_x2) +":" + string(tri_y3))
    draw_triangle(tri_x1,tri_y1,tri_x2,tri_y2,tri_x3,tri_y3,false)
    draw_set_color(make_color_rgb(255,100,0))
    tri_x1 = x1
    tri_y1 = min(max(y1,y1+i*size-t),y2)
    tri_x2 = x1
    tri_y2 = min(max(y1,y1+i*size+size/2-t),y2)
    tri_x3 = min(max(x1,x1+i*size+size/2-t),x2)
    tri_y3 = y1
    
    draw_triangle(tri_x1,tri_y1,tri_x2,tri_y2,tri_x3,tri_y3,false)
    }
    */
//draw the ship zone. Makes an inner box
draw_set_color(c_gray)
draw_rectangle(x1+16,y1+16,x2-16,y2-16,false)
