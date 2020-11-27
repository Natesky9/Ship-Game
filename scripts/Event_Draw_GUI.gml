///Draw_GUI()
//draws above the playing screen

//draw keyboard
switch game_mode
    {
    case mode.free_flight:
        {
        draw_key("E","forward")
        draw_key("S","left")
        draw_key("D","brake")
        draw_key("F","right")
        break
        }
    case mode.fine_flight:
        {
        draw_key("E","forward")
        draw_key("S","left")
        draw_key("D","back")
        draw_key("F","right")
        draw_key("W","turn")
        draw_key("R","turn")
        }
    case mode.ship_edit:
        {
        draw_key("E","up")
        draw_key("S","left")
        draw_key("D","down")
        draw_key("F","right")
        break
        }
    }

//draw based on the ui type
switch ui_type
    {
    case ui.inventory:
        {
        draw_key("I","close")
        draw_key("J","sort")
        draw_key("K","tractor")
        draw_key("L","scroll")
        break
        }
    case ui.craft:
        {
        draw_key("I","up")
        draw_key("J","close")
        draw_key("K","down")
        draw_key("L","make")
        break
        }
    case ui.build:
        {
        draw_key("I","prev")
        draw_key("J","place")
        draw_key("K","next")
        draw_key("L","clear")
        draw_key("O","return")
        break
        }
    case ui.dock:
        {
        draw_key("O","cancel")
        break
        }
    default:
        {
        draw_key("A")
        draw_key("B")
        draw_key("C")
        draw_key("G")
        draw_key("H")
        draw_key("M")
        draw_key("N")
        draw_key("O","dock")
        draw_key("P")
        draw_key("Q")
        draw_key("R")
        draw_key("T","spawn#debug#rock")
        draw_key("U","drill")
        draw_key("V")
        draw_key("W")
        draw_key("X")
        draw_key("Y")
        draw_key("Z")
        draw_key(",")
        draw_key(".")
        draw_key("/")
        draw_key(";")
        draw_key("I","inventory")
        draw_key("J","craft")
        draw_key("K","tractor")
        draw_key("L","ship")
        break
        }
    }

switch ui_type
    {
    case ui.inventory:
        draw_ui_inventory() break
    case ui.craft:
        draw_ui_craft()     break
    case ui.dock:
        draw_ui_dock()      break
    case ui.build:
        draw_ui_build()     break
    case ui.drill:
        draw_ui_drill()     break
    default:
        draw_ui_bar()       break
    }
