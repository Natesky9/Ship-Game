///Event_Motion()
//runs the motion update


var type_count = list_size(entity_types)
for (var ii = 0;ii < type_count;ii++)
    {
    var type_list = list_get(entity_types,ii)
    var entity_count = list_size(type_list)
    for (var i = 0;i < entity_count;i++)
        {
        
        //begin phase
        var get_entity = list_get(type_list,i)
        
        if get_entity == undefined
            {
            show("Error, entity does not exist!")
            continue
            }
        
        //phase 1
        //pre movement get
        var get_thrust = map_get(get_entity,"thrust");
        var get_steer = map_get(get_entity,"steer");
        var get_brake = map_get(get_entity,"brake");
        var get_x = map_get(get_entity,"x");
        var get_y = map_get(get_entity,"y");
        var get_type = map_get(get_entity,"type");
        var get_direction = map_get(get_entity,"direction");
        var get_speed = map_get(get_entity,"speed");
        var get_heading = map_get(get_entity,"heading");
        var is_docked = map_get(get_entity,"docked");
        var get_dock = map_get(get_entity,"docked to")
        var get_shift = map_get(get_entity,"shift")
        //end pre movement get
        
        //phase 2
        if is_docked
            {
            //special case for docked entites
            //if the target isn't docked to it anymore, reset
            //get_dock_target = map_get(get_target_entity,"docked")
            //if get_dock_target != get_entity
            //    {
            //    show("my dock isn't docked to me")
            //    map_set(get_entity,"docked",false)
            //    continue
            //    }
            
            var get_dock_x = map_get(get_dock,"x")
            var get_dock_y = map_get(get_dock,"y")
            var get_dock_speed = map_get(get_dock,"speed")
            var get_dock_heading = map_get(get_dock,"heading")
            var get_dock_direction = map_get(get_dock,"direction")
            
            //set motion based off of docked entity
            map_set(get_entity,"x",get_dock_x)
            map_set(get_entity,"y",get_dock_y)
            map_set(get_entity,"speed",get_dock_speed)
            map_set(get_entity,"heading",get_dock_heading)
            map_set(get_entity,"direction",get_dock_direction)
            continue
            
            //this may need to be reinstated
            //the dock doesn't exist anymore, continue with the rest of the script
            //show("my dock doesn't exist anymore!")
            //map_set(get_entity,"docked",false)
            }
        /*
        //phase 3
        if is_docked
            {
            //special case for entities that have something docked to them
            var get_docked_entity = is_docked
            
            if get_docked_entity)
                {
                console_add("my entity doesn't exist anymore!")
                ds_set(get_entity,"docked",false,key.value)
                }
            //continue with the rest of the script
            }
        */
        //phase 4
        if get_steer != 0
            {
            if get_shift
                {
                if get_steer == -1
                vector = get_heading-90
                else
                vector = get_heading+90
                entity_add_vector(get_entity,.1,vector)
                }
            else
            map_set(get_entity,"heading",get_heading+get_steer)
            }
        if get_thrust != 0
            {
            //multiply by thrust amount
            var get_vector_thrust = .1
            //add the vector
            entity_add_vector(get_entity,get_vector_thrust,get_heading)
            //thrust effect
            var thrust_x = get_x + lengthdir_x(16,get_heading+180)
            var thrust_y = get_y + lengthdir_y(16,get_heading+180)
            effect_create_above(ef_spark,thrust_x,thrust_y,1,c_white)
            //end thrust effect
            }
        if get_brake != 0
            {
            if get_shift
                {
                //move backwards
                entity_add_vector(get_entity,.1,get_heading-180)
                }
            else
            //brake action
            //reverse thrust
            entity_subtract_vector(get_entity,.1,get_heading)
            }
        
        //end phase
        //clamp it
        //Event_Motion_Clamp(get_entity)
        //end clamp it
        
        //move it
        get_speed = map_get(get_entity,"speed")
        get_direction = map_get(get_entity,"direction")
        
        map_set(get_entity,"x",get_x + lengthdir_x(get_speed,get_direction))
        map_set(get_entity,"y",get_y + lengthdir_y(get_speed,get_direction))
        
        //bop it
        }
    //twist it
    }
