--[[
This file defines items that are not associated with a particular nodetype.

 # INDEX
    COMMON REGISTRATION
    ITEM TYPES
]]

--[[
 # COMMON REGISTRATION
]]

local function register_item_colors(name, def)
    --[[
    Using palettes would be more efficient, but unfortunately the current API
    still seems to contain some unimplemented features around them.
    ]]
    local default_palette = {
        "#EDEDED", "#9B9B9B", "#4A4A4A", "#212121", "#284E9B",
        "#2F939B", "#6DEE1D", "#287C00", "#F7F920", "#D86128",
        "#683B0C", "#C11D26", "#F9A3A5", "#D10082", "#4C007F",
    }
    for n=1, 15 do
        local item_def = {
            description = def.description or "",
            short_description = def.short_description or "",
            inventory_image = def.inventory_image,
            inventory_overlay = def.inventory_overlay,
            color = default_palette[n],
        }
        minetest.register_craftitem("nv_ships:" .. name .. n, item_def)
    end
end

--[[
 # ITEM TYPES
Allocated: 2
2       hull_plate
]]

register_item_colors("hull_plate", {
    description = "Hull plate",
    short_description = "Hull plate",
    inventory_image = "hull_plate.png",
    inventory_overlay = "hull_plate_overlay.png",
})
