local filename = "zzzmetrics.stat"

script.on_event(defines.events.on_tick, function(event)
    if event.tick % 600 == 0 then
        game.print("Start write stats to "..filename)
        game.write_file(filename, "factorio tick=" .. game.tick .. '\n', false, 0)
        for _, player in pairs(game.players) do
            game.write_file(filename, "factorio_players,name="..player.name..",online="..tostring(player.connected).." online_time="..player.online_time.."\n", true, 0)
        end
        for _, force in pairs(game.forces) do

            local tmp=",force="..force.name.." zzz=0"
            for item, count in pairs(force.item_production_statistics.input_counts) do tmp=tmp..","..item.."="..count end
            if tmp ~= "" then game.write_file(filename, "factorio_items_input"..tmp.."\n", true, 0) end

            local tmp=",force="..force.name.." zzz=0"
            for item, count in pairs(force.item_production_statistics.output_counts) do tmp=tmp..","..item.."="..count end
            if tmp ~= "" then game.write_file(filename, "factorio_items_output"..tmp.."\n", true, 0) end

            local tmp=",force="..force.name.." zzz=0"
            for item, count in pairs(force.fluid_production_statistics.input_counts) do tmp=tmp..","..item.."="..count end
            if tmp ~= "" then game.write_file(filename, "factorio_fluid_input"..tmp.."\n", true, 0) end

            local tmp=",force="..force.name.." zzz=0"
            for item, count in pairs(force.fluid_production_statistics.output_counts) do tmp=tmp..","..item.."="..count end
            if tmp ~= "" then game.write_file(filename, "factorio_fluid_output"..tmp.."\n", true, 0) end

            local tmp=",force="..force.name.." zzz=0"
            for item, count in pairs(force.kill_count_statistics.input_counts) do tmp=tmp..","..item.."="..count end
            if tmp ~= "" then game.write_file(filename, "factorio_kill_input"..tmp.."\n", true, 0) end

            local tmp=",force="..force.name.." zzz=0"
            for item, count in pairs(force.kill_count_statistics.output_counts) do tmp=tmp..","..item.."="..count end
            if tmp ~= "" then game.write_file(filename, "factorio_kill_output"..tmp.."\n", true, 0) end

            local tmp=",force="..force.name.." zzz=0"
            for item, count in pairs(force.entity_build_count_statistics.input_counts) do tmp=tmp..","..item.."="..count end
            if tmp ~= "" then game.write_file(filename, "factorio_build_input"..tmp.."\n", true, 0) end

            local tmp=",force="..force.name.." zzz=0"
            for item, count in pairs(force.entity_build_count_statistics.output_counts) do tmp=tmp..","..item.."="..count end
            if tmp ~= "" then game.write_file(filename, "factorio_build_output"..tmp.."\n", true, 0) end
        end

        local tmp=" zzz=0"
        for item, count in pairs(game.pollution_statistics.input_counts) do tmp=tmp..","..item.."="..count end
        if tmp ~= "" then game.write_file(filename, "factorio_pollution_in"..tmp.."\n", true, 0) end

        local tmp=" zzz=0"
        for item, count in pairs(game.pollution_statistics.output_counts) do tmp=tmp..","..item.."="..count end
        if tmp ~= "" then game.write_file(filename, "factorio_pollution_out"..tmp.."\n", true, 0) end
    end
end)