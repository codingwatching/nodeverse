nv_crafting = {}

nv_crafting.furnace_recipes = {}

function nv_crafting.register_furnace_recipe(recipe)
    table.insert(nv_crafting.furnace_recipes, recipe)
end

level_cache = {}

local function get_furnace_formspec(player, level)
    if level then
        level_cache[player:get_player_name()] = level
    else
        level = level_cache[player:get_player_name()]
    end
    local recipes = {}
    for _, recipe in ipairs(nv_crafting.furnace_recipes) do
        if recipe.level <= level then
            table.insert(recipes, recipe)
        end
    end
    local base_formspec = nv_inventory.get_craft_formspec(player, recipes)
    return base_formspec
end

local function furnace_receive_fields_callback(player, fields)
    local name = player:get_player_name()
	for field, value in pairs(fields) do
	    if field == "exit" then
			minetest.close_formspec(name, "furnace")
	    elseif string.sub(field, 1, 6) == "recipe" then
	        local index = tonumber(string.sub(field, 7))
	        local recipe = nv_crafting.furnace_recipes[index]
	        local inv = minetest.get_inventory({type = "player", name = name})
	        for _, item in ipairs(recipe.recipe) do
	            inv:remove_item("main", item)
	        end
	        inv:add_item("craftresult", recipe.output)
	        local formspec = get_furnace_formspec(player)
			nv_gui.show_formspec_raw(player, formspec)
		end
	end
end

nv_gui.register_callback("furnace", furnace_receive_fields_callback)

minetest.register_node(
    "nv_crafting:furnace1", {
        drawtype = "mesh",
        visual_scale = 1.0,
        tiles = {
            "nv_furnace1.png"
        },
        mesh = "nv_furnace1.obj",
        paramtype = "light",
        paramtype2 = "facedir",
        place_param2 = 0,
        sunlight_propagates = true,
        walkable = true,
        buildable_to = false,
        groups = {cracky = 1, falling_node = 1},
        on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
            nv_gui.show_formspec_raw(clicker,
                get_furnace_formspec(clicker, 1),
                "furnace"
            )
        end,
        description = "Furnace",
        short_description = "Furnace",
    }
)

minetest.register_node(
    "nv_crafting:furnace2", {
        drawtype = "mesh",
        visual_scale = 1.0,
        tiles = {
            "nv_furnace2.png"
        },
        mesh = "nv_furnace2.obj",
        paramtype = "light",
        paramtype2 = "facedir",
        place_param2 = 0,
        sunlight_propagates = true,
        walkable = true,
        buildable_to = false,
        groups = {cracky = 1},
        on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
            nv_gui.show_formspec_raw(clicker,
                get_furnace_formspec(clicker, 2),
                "furnace"
            )
        end,
        description = "Blast furnace",
        short_description = "Blast furnace",
    }
)

minetest.register_node(
    "nv_crafting:silicate_sand", {
        drawtype = "normal",
        visual_scale = 1.0,
        tiles = {
            "nv_silicate_sand.png",
            "nv_silicate_sand.png",
            "nv_silicate_sand.png^[transformR180",
            "nv_silicate_sand.png^[transformR90",
            "nv_silicate_sand.png^[transformR270",
            "nv_silicate_sand.png",
        },
        paramtype = "light",
        paramtype2 = "facedir",
        place_param2 = 0,
        sounds = {
            footstep = {
                name = "nv_step_sediment", gain = 0.07, pitch = 1
            }
        },
        sunlight_propagates = false,
        walkable = true,
        buildable_to = false,
        groups = {crumbly = 2, falling_node = 1},
        description = "Silicate sand",
        short_description = "Silicate sand",
    }
)

minetest.register_node(
    "nv_crafting:gray_brick", {
        drawtype = "normal",
        visual_scale = 1.0,
        tiles = {
            "nv_gray_brick.png",
            "nv_gray_brick.png",
            "nv_gray_brick.png",
            "nv_gray_brick.png",
            "nv_gray_brick.png",
            "nv_gray_brick.png",
        },
        paramtype = "light",
        paramtype2 = "facedir",
        place_param2 = 0,
        sounds = {
            footstep = {
                name = "nv_step_stone", gain = 0.4, pitch = 1
            }
        },
        sunlight_propagates = false,
        walkable = true,
        buildable_to = false,
        groups = {cracky = 1},
        description = "Gray brick",
        short_description = "Gray brick",
    }
)

minetest.register_node(
    "nv_crafting:red_brick", {
        drawtype = "normal",
        visual_scale = 1.0,
        tiles = {
            "nv_red_brick.png",
            "nv_red_brick.png",
            "nv_red_brick.png",
            "nv_red_brick.png",
            "nv_red_brick.png",
            "nv_red_brick.png",
        },
        paramtype = "light",
        paramtype2 = "facedir",
        place_param2 = 0,
        sounds = {
            footstep = {
                name = "nv_step_stone", gain = 0.4, pitch = 1
            }
        },
        sunlight_propagates = false,
        walkable = true,
        buildable_to = false,
        groups = {cracky = 1},
        description = "Red brick",
        short_description = "Red brick",
    }
)

minetest.register_node(
    "nv_crafting:black_brick", {
        drawtype = "normal",
        visual_scale = 1.0,
        tiles = {
            "nv_black_brick.png",
            "nv_black_brick.png",
            "nv_black_brick.png",
            "nv_black_brick.png",
            "nv_black_brick.png",
            "nv_black_brick.png",
        },
        paramtype = "light",
        paramtype2 = "facedir",
        place_param2 = 0,
        sounds = {
            footstep = {
                name = "nv_step_stone", gain = 0.4, pitch = 1
            }
        },
        sunlight_propagates = false,
        walkable = true,
        buildable_to = false,
        groups = {cracky = 1},
        description = "Black brick",
        short_description = "Black brick",
    }
)

minetest.register_node(
    "nv_crafting:concrete", {
        drawtype = "normal",
        visual_scale = 1.0,
        tiles = {
            "nv_concrete.png",
            "nv_concrete.png",
            "nv_concrete.png",
            "nv_concrete.png",
            "nv_concrete.png",
            "nv_concrete.png",
        },
        paramtype = "light",
        paramtype2 = "facedir",
        place_param2 = 0,
        sounds = {
            footstep = {
                name = "nv_step_stone", gain = 0.4, pitch = 1
            }
        },
        sunlight_propagates = false,
        walkable = true,
        buildable_to = false,
        groups = {cracky = 1},
        description = "Concrete",
        short_description = "Concrete",
    }
)

minetest.register_node(
    "nv_crafting:torch", {
        drawtype = "mesh",
        visual_scale = 1.0,
        tiles = {
            "nv_torch.png"
        },
        mesh = "nv_torch.obj",
        paramtype = "light",
        paramtype2 = "facedir",
        place_param2 = 0,
        light_source = 7,
        sunlight_propagates = true,
        walkable = false,
        buildable_to = true,
        drop = "",
        groups = {choppy = 3},
        description = "Torch",
        short_description = "Torch",
    }
)

minetest.register_craftitem("nv_crafting:basic_fuel", {
    description = "Basic fuel",
    short_description = "Basic fuel",
    inventory_image = "nv_basic_fuel.png",
})

minetest.register_craftitem("nv_crafting:iron", {
    description = "Iron",
    short_description = "Iron",
    inventory_image = "nv_iron.png",
})

if nv_planetgen then
    nv_inventory.register_manual_recipe({
        output = "nv_crafting:silicate_sand",
        type = "shapeless",
        recipe = {
            "nv_planetgen:crude_silicate 1",
        },
    })
    
    nv_inventory.register_manual_recipe({
        output = "nv_crafting:furnace1",
        type = "shapeless",
        recipe = {
            "nv_planetgen:crude_silicate 4",
        },
    })
    
    if nv_flora then
        nv_crafting.register_furnace_recipe({
            output = "nv_ores:carbon",
            type = "shapeless",
            recipe = {
                "nv_flora:polymer_planks 1",
                "nv_crafting:basic_fuel 1",
            },
            level = 1,
        })
    end
    
    if nv_ores then
        nv_inventory.register_manual_recipe({
            output = "nv_crafting:basic_fuel",
            type = "shapeless",
            recipe = {
                "nv_ores:carbon 1",
            },
        })
        
        nv_inventory.register_manual_recipe({
            output = "nv_crafting:basic_fuel",
            type = "shapeless",
            recipe = {
                "nv_ores:sulfur_pieces 3",
            },
        })
    
        nv_crafting.register_furnace_recipe({
            output = "nv_ores:aluminium_oxide",
            type = "shapeless",
            recipe = {
                "nv_ores:aluminium_hydroxide 1",
                "nv_crafting:basic_fuel 1",
            },
            level = 1,
        })
    end
    
    if nv_flora then
        nv_inventory.register_manual_recipe({
            output = "nv_crafting:basic_fuel",
            type = "shapeless",
            recipe = {
                "nv_flora:polymer_planks 1",
            },
        })
        
        nv_inventory.register_manual_recipe({
            output = "nv_crafting:torch",
            type = "shapeless",
            recipe = {
                "nv_crafting:basic_fuel 1",
                "nv_flora:polymer_planks 1",
            },
        })
    end
    
    if nv_ores then
        nv_inventory.register_manual_recipe({
            output = "nv_crafting:concrete",
            type = "shapeless",
            recipe = {
                "nv_ores:aluminium_oxide 1",
                "nv_ores:calcium_carbonate 1",
            },
        })
    
        nv_inventory.register_manual_recipe({
            output = "nv_crafting:gray_brick",
            type = "shapeless",
            recipe = {
                "nv_ores:aluminium_oxide 1",
                "nv_planetgen:crude_silicate 1",
            },
        })
        
        nv_inventory.register_manual_recipe({
            output = "nv_crafting:red_brick",
            type = "shapeless",
            recipe = {
                "nv_ores:aluminium_oxide 1",
                "nv_ores:iron_oxide 1",
            },
        })
        
        nv_inventory.register_manual_recipe({
            output = "nv_crafting:black_brick",
            type = "shapeless",
            recipe = {
                "nv_ores:aluminium_oxide 1",
                "nv_ores:carbon 1",
            },
        })
        
        if nv_flora then
            nv_inventory.register_manual_recipe({
                output = "nv_crafting:furnace2",
                type = "shapeless",
                recipe = {
                    "nv_crafting:concrete 4",
                    "nv_flora:polymer_planks 2",
                },
            })
        end
        
        nv_crafting.register_furnace_recipe({
            output = "nv_crafting:iron",
            type = "shapeless",
            recipe = {
                "nv_ores:iron_oxide 1",
                "nv_ores:carbon 1",
            },
            level = 2,
        })
    end
end
