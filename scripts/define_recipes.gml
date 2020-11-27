recipes = ds_list_create()

red_refine = 0
red_refine[0,0] = item.refinedred
red_refine[0,1] = 1
red_refine[1,0] = item.rockred
red_refine[1,1] = 2
ds_list_add(recipes,red_refine)

blue_refine = 0
blue_refine[0,0] = item.refinedblue
blue_refine[0,1] = 1
blue_refine[1,0] = item.rockblue
blue_refine[1,1] = 4
ds_list_add(recipes,blue_refine)

green_refine = 0
green_refine[0,0] = item.refinedgreen
green_refine[0,1] = 1
green_refine[1,0] = item.rockgreen
green_refine[1,1] = 8
ds_list_add(recipes,green_refine)

red_component = 0
red_component[0,0] = item.componentred
red_component[0,1] = 1
red_component[1,0] = item.orered
red_component[1,1] = 1
red_component[2,0] = item.refinedred
red_component[2,1] = 2
ds_list_add(recipes,red_component)

blue_component = 0
blue_component[0,0] = item.componentblue
blue_component[0,1] = 1
blue_component[1,0] = item.oreblue
blue_component[1,1] = 1
blue_component[2,0] = item.refinedred
blue_component[2,1] = 2
ds_list_add(recipes,blue_component)

green_component = 0
green_component[0,0] = item.componentgreen
green_component[0,1] = 1
green_component[1,0] = item.oregreen
green_component[1,1] = 1
green_component[2,0] = item.refinedred
green_component[2,1] = 2
ds_list_add(recipes,green_component)

red_advanced = 0
red_advanced[0,0] = item.advancedred
red_advanced[0,1] = 1
red_advanced[1,0] = item.componentred
red_advanced[1,1] = 1
red_advanced[2,0] = item.refinedblue
red_advanced[2,1] = 2
ds_list_add(recipes,red_advanced)

blue_advanced = 0
blue_advanced[0,0] = item.advancedblue
blue_advanced[0,1] = 1
blue_advanced[1,0] = item.componentblue
blue_advanced[1,1] = 1
blue_advanced[2,0] = item.refinedblue
blue_advanced[2,1] = 2
ds_list_add(recipes,blue_advanced)

green_advanced = 0
green_advanced[0,0] = item.advancedgreen
green_advanced[0,1] = 1
green_advanced[1,0] = item.componentgreen
green_advanced[1,1] = 1
green_advanced[2,0] = item.refinedblue
green_advanced[2,1] = 2
ds_list_add(recipes,green_advanced)

