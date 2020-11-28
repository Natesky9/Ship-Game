///Event_Motion()
//runs the motion update

var done = 0
var get_x, get_y, type_list, entity_count, get_entity
var get_speed, get_direction, get_x, get_y
var type_count = list_size(entity_types)
for (var ii = 0;ii < type_count;ii++)
    {
    type_list = list_get(entity_types,ii)
    entity_count = list_size(type_list)
    for (var i = 0;i < entity_count;i++)
        {
        get_entity = list_get(type_list,i)
        if get_entity == undefined
            {
            show("Error, entity does not exist!")
            continue
            }
        
        //begin phase
        switch get_entity
            {
            case entity.ship:
                {
                //show("event motion ship")
                done = Event_Motion_Ship(get_entity)
                if done continue
                }
            case entity.damage:
                {
                break
                }
            default:
                break
            }
        
        //move it
        get_speed = map_get(get_entity,"speed")
        get_direction = map_get(get_entity,"direction")
        get_x = map_get(get_entity,"x")
        get_y = map_get(get_entity,"y")
        //show("speed:direction " + string(get_speed) + ":" + string(get_direction))
        //show("moving")
        map_set(get_entity,"x",get_x + lengthdir_x(get_speed,get_direction))
        map_set(get_entity,"y",get_y + lengthdir_y(get_speed,get_direction))
        
        //bop it
        }
    //twist it
    }
