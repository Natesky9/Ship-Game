///entity_subtract_vector(get_entity,get_vector_speed)
//subtracts a motion vector to the entity

var get_entity = argument0
var get_vector_speed = argument1;
var get_vector_direction = argument2;

var get_x = map_get(get_entity,"x");
var get_y = map_get(get_entity,"y");
var get_direction = map_get(get_entity,"direction");
var get_speed = map_get(get_entity,"speed");

get_speed -= get_vector_speed

var final_speed = max(0,get_speed);

map_set(get_entity,"speed",final_speed)
//we're done here
