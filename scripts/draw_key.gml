///draws the key to the screen
var get_key = argument[0]
if argument_count == 2
var get_description = argument[1]

switch get_key
    {
    //
    case "Q":
        {tile_x = 1
        tile_y = 1
        break}
    case "W":
        {tile_x = 2
        tile_y = 1
        break}
    case "E":
        {tile_x = 3
        tile_y = 1
        break}
    case "R":
        {tile_x = 4
        tile_y = 1
        break}
    case "T":
        {tile_x = 5
        tile_y = 1
        break}
    case "Y":
        {tile_x = 6
        tile_y = 1
        break}
    case "U":
        {tile_x = 7
        tile_y = 1
        break}
    case "I":
        {tile_x = 8
        tile_y = 1
        break}
    case "O":
        {tile_x = 9
        tile_y = 1
        break}
    case "P":
        {tile_x = 10
        tile_y = 1
        break}
    case "A":
        {tile_x = 1
        tile_y = 2
        break}
    case "S":
        {tile_x = 2
        tile_y = 2
        break}
    case "D":
        {tile_x = 3
        tile_y = 2
        break}
    case "F":
        {tile_x = 4
        tile_y = 2
        break}
    case "G":
        {tile_x = 5
        tile_y = 2
        break}
    case "H":
        {tile_x = 6
        tile_y = 2
        break}
    case "J":
        {tile_x = 7
        tile_y = 2
        break}
    case "K":
        {tile_x = 8
        tile_y = 2
        break}
    case "L":
        {tile_x = 9
        tile_y = 2
        break}
    case ";":
        {tile_x = 10
        tile_y = 2
        break}
    case "Z":
        {tile_x = 1
        tile_y = 3
        break}
    case "X":
        {tile_x = 2
        tile_y = 3
        break}
    case "C":
        {tile_x = 3
        tile_y = 3
        break}
    case "V":
        {tile_x = 4
        tile_y = 3
        break}
    case "B":
        {tile_x = 5
        tile_y = 3
        break}
    case "N":
        {tile_x = 6
        tile_y = 3
        break}
    case "M":
        {tile_x = 7
        tile_y = 3
        break}
    case ",":
        {tile_x = 8
        tile_y = 3
        break}
    case ".":
        {tile_x = 9
        tile_y = 3
        break}
    case "/":
        {tile_x = 10
        tile_y = 3
        break}
    default:
        {tile_x = 1
        tile_y = 1
        break}
    }

//shift over half a screen
if tile_x >= 6
tile_x += 6

var g = (window_get_width()-8)/16
var h = (window_get_height()-8)/16
var e_x1 = g*tile_x-g + (tile_y-1)*4
var e_x2 = g*tile_x + (tile_y-1)*4
var e_y1 = h*tile_y-h
var e_y2 = h*tile_y

if keyboard_check(ord(get_key))
set_color(c_gray)
else
set_color(c_white)
draw_rectangle(e_x1,e_y1,e_x2,e_y2,false)
set_color(c_black)
draw_rectangle(e_x1,e_y1,e_x2,e_y2,true)
align(5)
draw_set_font(-1)
draw_text(mean(e_x1,e_x2),mean(e_y1,e_y2),get_key)

if argument_count == 2
    {
    set_color(c_blue)
    draw_text(mean(e_x1,e_x2),mean(e_y1,e_y2)+10,get_description)
    }
