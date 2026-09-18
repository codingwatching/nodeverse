--[[
This file defines items that are not associated with a particular nodetype.

 # INDEX
    ITEM TYPES
]]

--[[
 # ITEM TYPES
Allocated: 2
1       polymer_planks
1       polymer_fiber
]]

minetest.register_craftitem("nv_flora:polymer_planks", {
    description = "Polymer planks",
    short_description = "Polymer planks",
    inventory_image = "nv_polymer_planks.png",
})

minetest.register_craftitem("nv_flora:polymer_fiber", {
    description = "Polymer fiber",
    short_description = "Polymer fiber",
    inventory_image = "nv_polymer_fiber.png",
})
