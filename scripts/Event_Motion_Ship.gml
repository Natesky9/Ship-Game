///Event_Motion_Ship(get_entity)
var get_entity, get_thrust, get_steer, get_brake, 
    get_x, get_y, get_type, get_direction, 
    get_speed, get_heading, is_docked, get_dock, 
    get_dock_x, get_dock_y, get_dock_speed, 
    get_dock_heading, get_dock_direction, 
    get_vector_thrust, thrust_x, thrust_y
//fetch entity
get_entity = argument0
//fetch values
get_thrust = map_get(get_entity,"thrust");
get_steer = map_get(get_entity,"steer");
get_brake = map_get(get_entity,"brake");
get_x = map_get(get_entity,"x");
get_y = map_get(get_entity,"y");
get_type = map_get(get_entity,"type");
get_speed = map_get(get_entity,"speed");
get_direction = map_get(get_entity,"direction");
get_heading = map_get(get_entity,"heading");
is_docked = map_get(get_entity,"docked");
get_dock = map_get(get_entity,"docked to")

//special case for docked entites
if is_docked
    {
    var get_dock_x = map_get(get_dock,"x")
    var get_dock_y = map_get(get_dock,"y")
    var get_dock_heading = map_get(get_dock,"heading")
    var get_dock_speed = map_get(get_dock,"speed")
    var get_dock_direction = map_get(get_dock,"direction")
    
    //set motion based off of docked entity
    map_set(get_entity,"x",get_dock_x)
    map_set(get_entity,"y",get_dock_y)
    map_set(get_entity,"speed",get_dock_speed)
    map_set(get_entity,"heading",get_dock_heading)
    map_set(get_entity,"direction",get_dock_direction)
    //return true if docked
    return true
    }
//continue with driving
switch game_mode
    {
    case mode.fine_flight:
        {
        if get_steer != 0
            {
            if get_steer == -1
            vector = get_heading-90
            else
            vector = get_heading+90
            entity_add_vector(get_entity,.1,vector)
get_speed = map_get(get_entity,"speed");
get_direction = map_get(get_entity,"direction");
            //clamp it
            get_speed = clamp(get_speed,-10,10)
            map_set(get_entity,"speed",get_speed)
            }
        if get_thrust != 0
            {
            //multiply by thrust amount
            var get_vector_thrust = .1
            //add the vector
            entity_add_vector(get_entity,get_vector_thrust,get_heading)
get_speed = map_get(get_entity,"speed");
get_direction = map_get(get_entity,"direction");
            //clamp it
            //get_speed = clamp(get_speed,-10,10)
            map_set(get_entity,"speed",get_speed)
            }
        if get_brake != 0
            {
            //move backwards
            entity_add_vector(get_entity,.1,get_heading-180)
get_speed = map_get(get_entity,"speed");
get_direction = map_get(get_entity,"direction");
            //clamp it
            //get_speed = clamp(get_speed,-10,10)
            map_set(get_entity,"speed",get_speed)
            }
        break
        }
    case mode.free_flight:
        {
        if get_steer != 0
            {
            map_set(get_entity,"heading",get_heading+get_steer)
            //maybe change this to rotational inertia
            }
        if get_thrust != 0
            {
            //multiply by thrust amount
            var get_vector_thrust = .1
            //add the vector
            entity_add_vector(get_entity,get_vector_thrust,get_heading)
get_speed = map_get(get_entity,"speed");
get_direction = map_get(get_entity,"direction");
            //thrust effect
            var thrust_x = get_x + lengthdir_x(16,get_heading+180)
            var thrust_y = get_y + lengthdir_y(16,get_heading+180)
            effect_create_above(ef_spark,thrust_x,thrust_y,1,c_white)
            //end thrust effect
            //clamp it
            //get_speed = clamp(get_speed,-10,10)
            map_set(get_entity,"speed",get_speed)
            }
        if get_brake != 0
            {
            //reverse thrust
            entity_subtract_vector(get_entity,1,get_heading)
            }
        break
        }
    default:
        break
    }
//return false if we aren't docked
//show("returning false")
return false
