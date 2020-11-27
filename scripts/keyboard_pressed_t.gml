///keyboard_pressed_t()
//placeholder spawn asteroid
if not keyboard_check_pressed(ord("T"))
exit

var get_x = map_get(myship,"x") + 400
var get_y = map_get(myship,"y") + 400
var new = entity_create(get_x,get_y,entity.rock)

generate_random_asteroid(new,9,9)
