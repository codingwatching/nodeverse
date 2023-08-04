--[[
The functions in this file perform registration of all node types used by the
mod. Each base node type has one or more variants to this end.

 # INDEX
    NODE TYPES
    REGISTRATION
    VARIANT SELECTION
]]

local function register_color_variants(name, num_variants, random_yrot, color_fn, def_fn)
    --[[
    Will register a number of node types. These are meant to be variants of a
    common abstract node type.
    name            string      node base name, e.g. 'tall_grass'
    num_variants    number      number of distinct node types to register
    random_yrot     number      value to be registered at 'nv_planetgen.random_yrot_nodes'
    color_fn        function (x)
        (optional) Should return a table with 'r', 'g', and 'b' members in the
        range [0 .. 255], that will be passed as color string to 'def_fn'.
        n           number      index of variant, [1 .. 'num_variants']
    def_fn          function (n, color)
        Should return a node definition table to be passed as second argument to
        'minetest.register_node()'.
        n           number      index of variant, [1 .. 'num_variants']
        color       string      return value of 'color_fn', converted to string
    ]]--
    name = "nv_flora:" .. name
    for n=1, num_variants do
        local variant_name = name
        if num_variants > 1 then
            variant_name = variant_name .. n
        end
        local color = nil
        if color_fn ~= nil then
            color = color_fn(n)
            color = string.format("#%.2X%.2X%.2X", color.r, color.g, color.b)
        end
        local definition = def_fn(n, color)
        minetest.register_node(variant_name, definition)
        nv_planetgen.random_yrot_nodes[minetest.get_content_id(variant_name)] = random_yrot
    end
end

--[[
 # NODE TYPES
Allocated: 1
1  .... tall grass
1           cane_grass
]]--

local function register_tall_grasses()
    -- CANE GRASS
    -- Rigid bamboo-like canes
    -- 1 grass color as nodetype
    register_color_variants(
        "cane_grass", 48, 20,
        function (x) return {
            r = 64, g = 255, b = 64
        } end,
        function (n, color) return {
            drawtype = "plantlike",
            visual_scale = 1.0,
            tiles = string.format(
                "nv_cane_grass.png^[colorize:%s",
                color
            ),
            paramtype = "light",
            paramtype2 = "degrotate",
            place_param2 = 0,
            sunlight_propagates = true,
            walkable = false,
            buildable_to = true,
            selection_box = {
                type = "fixed",
                fixed = {{-0.5, -0.5, -0.5, 0.5, 6/16, 0.5}}
            }
        } end
    )
end

--[[
 # REGISTRATION
Color variants can be generated in two ways: one involves creating a color
palette at node registration and giving values to 'planet.color_dictionary[id]'.
The other is done by passing a value of 'num_variants' > 1 to function
'register_color_variants()', thus creating multiple node types. Of course, both
can be combined, by creating as many palettes as 'num_variants' and using
parameter 'n' of 'def_fn' to choose.
]]

function nv_flora.register_all_nodes()
    register_tall_grasses()
end
