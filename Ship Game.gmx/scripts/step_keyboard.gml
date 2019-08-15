///step_keyboard()
if keyboard_check(ord("E"))
    {
    debug("E is pressed")
    if ship
        {
        var get_y = ds_get(ship_id,"y")
        ds_set(ship_id,"y",get_y-10)
        }
    }
if keyboard_check(ord("S"))
    {
    debug("S is pressed")
    if ship
        {
        var get_x = ds_get(ship_id,"x")
        ds_set(ship_id,"x",get_x-10)
        }
    }
if keyboard_check(ord("D"))
    {
    debug("D is pressed")
    if ship
        {
        var get_y = ds_get(ship_id,"y")
        ds_set(ship_id,"y",get_y+10)
        }
    }
if keyboard_check(ord("F"))
    {
    debug("F is pressed")
    if ship
        {
        var get_x = ds_get(ship_id,"x")
        ds_set(ship_id,"x",get_x+10)
        }
    }

if keyboard_check_pressed(ord("1"))
    {
    if menu == 1
        {
        menu = 0
        exit
        }
    debug("key 1 pressed")
    menu = 1
    }
if keyboard_check_pressed(ord("2"))
    {
    if menu == 2
        {
        menu = 0
        exit
        }
    debug("key 2 pressed")
    menu = 2
    }
if keyboard_check_pressed(ord("3"))
    {
    if menu == 3
        {
        menu = 0
        exit
        }
    debug("key 3 pressed")
    menu = 3
    }
if keyboard_check_pressed(ord("4"))
    {
    if ship == false
        {
        ship = true
        ship_id = entity_create_ship(mouse_x,mouse_y)
        exit
        }
    debug("key 4 pressed")
    }
if keyboard_check_pressed(ord("5"))
    {
    debug("key 5 pressed")
    var new_entity = entity_create(mouse_x,mouse_y,entity.rock)
    }

//zoom keys
if keyboard_check(ord("Q"))
    {
    view_zoom(1)
    }
if keyboard_check(ord("W"))
    {
    view_zoom(-1)
    }
