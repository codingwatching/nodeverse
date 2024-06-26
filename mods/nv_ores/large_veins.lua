local function large_vein_callback(
    origin, minp, maxp, area, A, A1, A2, mapping, planet, ground_buffer, custom
)
    local x = origin.x
    local z = origin.z
    local base = area.MinEdge
    local extent = area:getExtent()
    local G = PcgRandom(custom.seed, origin.x + origin.z * 27)
    local height = G:next(custom.min_height, custom.max_height)
    if minp.y > height - mapping.offset.y + 1 or maxp.y < height - mapping.offset.y - 1 then
        return
    end
    local size = custom.side / 3
    local y = height - mapping.offset.y
    for z=minp.z,maxp.z,1 do
        for x=minp.x,maxp.x,1 do
            local distance = math.hypot(x - origin.x - 5, z - origin.z - 5)
            local G2 = PcgRandom(x, z)
            local v = G2:next(0, 100) / 100
            if distance - v < size then
                local i = area:index(x, y, z)
                local node_name = minetest.get_name_from_content_id(A[i])
                if node_name == "nv_planetgen:stone" then
                    A[i] = custom.node
                    A2[i] = G2:next(0, 255) % 4
                end
            end
            if distance < size and v > 0.9 and y < maxp.y then
                local i = area:index(x, y + 1, z)
                local node_name = minetest.get_name_from_content_id(A[i])
                if node_name == "nv_planetgen:stone" then
                    A[i] = custom.node
                    A2[i] = G2:next(0, 255) % 4
                end
            end
            if distance < size and v < 0.1 and y > minp.y then
                local i = area:index(x, y - 1, z)
                local node_name = minetest.get_name_from_content_id(A[i])
                if node_name == "nv_planetgen:stone" then
                    A[i] = custom.node
                    A2[i] = G2:next(0, 255) % 4
                end
            end
        end
    end
end

function nv_ores.get_large_vein_meta(seed, index)
    local r = {}
    local G = PcgRandom(seed, index)
    local meta = generate_planet_metadata(seed)
    -- General
    r.density = 1/G:next(1, 2)
    r.index = index
    r.seed = 78954378 + index
    r.side = G:next(5, 12)
    r.order = 100
    r.callback = large_vein_callback
    -- Large vein-specific
    r.min_height = G:next(0, 150) - 100
    r.max_height = r.min_height + G:next(20, 50)
    r.node = gen_weighted(G, {
        -- Iron ores
        hematite = 100,
        magnetite = 100,
        goethite = 50,
        limonite = 50,
        -- Aluminium ores
        gibbsite = 150,
        boehmite = 70,
        diaspore = 70,
        -- Calcium ores
        calcite = 70,
        aragonite = 50,
        -- Sodium ores
        halite = 80,
    })
    r.node = nv_ores.node_types[r.node]
    return r
end
