///Event_Step()

//entity step
step_entities()
//end entity step

//keyboard step
step_keyboard()

//step mouse
if mouse_check_button_pressed(mb_left)
    {
    view_center(mouse_x,mouse_y)
    }
if mouse_check_button(mb_right)
    {
    var view_x_center = view_xview[0]+view_wview[0]/2
    var view_y_center = view_yview[0]+view_hview[0]/2
    view_center(mean(mouse_x,view_x_center),mean(mouse_y,view_y_center))
    }
//end step mouse

