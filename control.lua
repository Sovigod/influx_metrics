local filename = "zzzmetrics.stat"


script.on_nth_tick(600, function(event)
    game.write_file(filename, "factorio tick=" .. game.tick .. '\n', false, 0)
    for _, player in pairs(game.players) do
        game.write_file(filename, "factorio_players,name="..player.name..",online="..tostring(player.connected).." online_time="..player.online_time.."\n", true, 0)
    end
    for _, force in pairs(game.forces) do

        for item, count in pairs(force.item_production_statistics.input_counts) do 
            game.write_file(filename, "factorio_item,force="..force.name..",item="..item.." input="..count.."\n", true, 0)
        end
        for item, count in pairs(force.item_production_statistics.output_counts) do 
            game.write_file(filename, "factorio_item,force="..force.name..",item="..item.." output="..count.."\n", true, 0)
        end

        for item, count in pairs(force.fluid_production_statistics.input_counts) do 
            game.write_file(filename, "factorio_fluid,force="..force.name..",item="..item.." input="..count.."\n", true, 0)
        end
        for item, count in pairs(force.fluid_production_statistics.output_counts) do 
            game.write_file(filename, "factorio_fluid,force="..force.name..",item="..item.." output="..count.."\n", true, 0)
        end

        for item, count in pairs(force.kill_count_statistics.input_counts) do 
            game.write_file(filename, "factorio_kill,force="..force.name..",item="..item.." input="..count.."\n", true, 0)
        end
        for item, count in pairs(force.kill_count_statistics.output_counts) do 
            game.write_file(filename, "factorio_kill,force="..force.name..",item="..item.." output="..count.."\n", true, 0)
        end

        for item, count in pairs(force.entity_build_count_statistics.input_counts) do 
            game.write_file(filename, "factorio_build,force="..force.name..",item="..item.." input="..count.."\n", true, 0)
        end
        for item, count in pairs(force.entity_build_count_statistics.output_counts) do 
            game.write_file(filename, "factorio_build,force="..force.name..",item="..item.." output="..count.."\n", true, 0)
        end
    end

    for item, count in pairs(game.pollution_statistics.input_counts) do 
        game.write_file(filename, "factorio_pollution,item="..item.." input="..count.."\n", true, 0)
    end
    for item, count in pairs(game.pollution_statistics.output_counts) do 
        game.write_file(filename, "factorio_pollution,item="..item.." output="..count.."\n", true, 0)
    end
end)