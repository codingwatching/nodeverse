--[[
This file defines items that are not associated with a particular nodetype.

 # INDEX
    ITEM TYPES
]]

--[[
 # ITEM TYPES
Allocated: 8
7     ores
1       carbon
1       iron_oxide
1       aluminium_hydroxide
1       calcium_carbonate
1       sodium_chloride
1       magnesium_hydroxide
1       sulfur_pieces
1     utility
1       basic_fuel
]]

minetest.register_craftitem("nv_ores:carbon", {
    description = "Carbon",
    short_description = "Carbon",
    inventory_image = "nv_carbon.png",
})

minetest.register_craftitem("nv_ores:iron_oxide", {
    description = "Iron oxide",
    short_description = "Iron oxide",
    inventory_image = "nv_iron_oxide.png",
})

minetest.register_craftitem("nv_ores:aluminium_hydroxide", {
    description = "Aluminium hydroxide",
    short_description = "Aluminium hydroxide",
    inventory_image = "nv_aluminium_hydroxide.png",
})

minetest.register_craftitem("nv_ores:aluminium_oxide", {
    description = "Aluminium oxide",
    short_description = "Aluminium oxide",
    inventory_image = "nv_aluminium_oxide.png",
})

minetest.register_craftitem("nv_ores:calcium_carbonate", {
    description = "Calcium carbonate",
    short_description = "Calcium carbonate",
    inventory_image = "nv_calcium_carbonate.png",
})

minetest.register_craftitem("nv_ores:sodium_chloride", {
    description = "Sodium chloride",
    short_description = "Sodium chloride",
    inventory_image = "nv_sodium_chloride.png",
})

minetest.register_craftitem("nv_ores:magnesium_hydroxide", {
    description = "Magnesium hydroxide",
    short_description = "Magnesium hydroxide",
    inventory_image = "nv_magnesium_hydroxide.png",
})

minetest.register_craftitem("nv_ores:potassium_nitrate", {
    description = "Potassium nitrate",
    short_description = "Potassium nitrate",
    inventory_image = "nv_potassium_nitrate.png",
})

minetest.register_craftitem("nv_ores:sulfur_pieces", {
    description = "Sulfur",
    short_description = "Sulfur",
    inventory_image = "nv_sulfur_pieces.png",
})
