///Event_Step()

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
    if menu == 4
        {
        menu = 0
        exit
        }
    debug("key 4 pressed")
    menu = 4
    }
if keyboard_check_pressed(ord("5"))
    {
    debug("key 5 pressed")
    var new_entity = entity_create(mouse_x,mouse_y,0)
    }
